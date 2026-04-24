# SharedConfetti

`SharedConfetti` is a Swift package for rendering configurable confetti effects with `CAEmitterLayer`. It gives you a small public model layer for defining emitter behavior and two main integration paths: embed confetti directly in SwiftUI with `ConfettiView`, or fire a one-shot overlay on the active window with `UIWindow.emitConfetti(configuration:)`.

## Requirements

- iOS 13+
- Swift Package Manager
- UIKit or SwiftUI

## Installation

Add `SharedConfetti` to your project as a Swift package dependency, then import it where needed:

```swift
import SharedConfetti
```

## Core Concepts

- `Confetti.Configuration` describes a complete effect.
- `Confetti.Emitter` describes the emitter’s shape and mode.
- `Confetti.Cell` describes the particles being emitted.
- `ConfettiView` is the SwiftUI entry point.
- `UIConfettiView` is the UIKit entry point.
- `UIWindow.emitConfetti(configuration:)` is a convenience API for full-screen, window-based emission.

## Type Tree

The type tree shows how the package’s core API is organized around `Confetti` as the root namespace, with related configuration and emitter types grouped beneath it. Its purpose is to give you a quick mental model of how the main types fit together before you start building configurations.

```text
Confetti
|_ Configuration
|_ Cell
|  |_ Acceleration
|  |_ Contents
|  |_ Emission
|  |_ Lifetime
|  |_ Scale
|  |_ Spin
|  |_ Velocity
|_ Emitter
|  |_ Mode
|  |_ Shape
```
## Creating a Configuration

At the center of the package is `Confetti.Configuration`, which combines an emitter and one or more cells.

```swift
import SharedConfetti
import UIKit

let cell = Confetti.Cell(
    lifetime: .init(birthRate: 24, base: 6, range: 1),
    spin: .init(base: 3, range: 1),
    scale: .init(base: 0.08, range: 0.03),
    acceleration: .init(x: 0, y: 120, z: 0),
    velocity: .init(base: 180, range: 60),
    emission: .init(latitude: 0, longitude: 0, range: .pi),
    contents: .init(image: UIImage(systemName: "circle.fill")?.cgImage)
)

let configuration = Confetti.Configuration(
    emitter: .init(shape: .line, mode: .surface),
    cells: [cell]
)
```

## SwiftUI Usage

Use `ConfettiView` when you want confetti to live inside a SwiftUI layout. The view uses a trigger-based API: each time the `trigger` value changes, the underlying UIKit view emits again.

```swift
import SwiftUI
import SharedConfetti

struct CelebrationView: View {
    @State private var trigger = 0

    private let configuration = Confetti.Configuration(
        emitter: .init(shape: .line, mode: .surface),
        cells: [
            .init(
                lifetime: .init(birthRate: 20, base: 5, range: 1),
                spin: .init(base: 2, range: 1),
                scale: .init(base: 0.1, range: 0.04),
                acceleration: .init(x: 0, y: 140, z: 0),
                velocity: .init(base: 160, range: 40),
                emission: .init(latitude: 0, longitude: 0, range: .pi),
                contents: .init(image: UIImage(systemName: "star.fill")?.cgImage)
            )
        ]
    )

    var body: some View {
        ZStack {
            Button("Celebrate") {
                trigger += 1
            }

            ConfettiView(configuration: configuration, trigger: trigger)
                .allowsHitTesting(false)
        }
    }
}
```

Use this approach when the confetti effect should be part of a specific screen or view hierarchy.

## UIKit Usage

If you are working in UIKit, create a `UIConfettiView`, size it like any other view, add it to your hierarchy, and call `emit()`.

```swift
import UIKit
import SharedConfetti

final class CelebrationViewController: UIViewController {
    private lazy var confettiView = UIConfettiView(configuration: configuration)

    private let configuration = Confetti.Configuration(
        emitter: .init(shape: .circle, mode: .outline),
        cells: [
            .init(
                lifetime: .init(birthRate: 18, base: 5, range: 1),
                spin: .init(base: 2, range: 2),
                scale: .init(base: 0.08, range: 0.03),
                acceleration: .init(x: 0, y: 100, z: 0),
                velocity: .init(base: 150, range: 50),
                emission: .init(latitude: 0, longitude: 0, range: .pi),
                contents: .init(image: UIImage(systemName: "seal.fill")?.cgImage)
            )
        ]
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        confettiView.frame = view.bounds
        confettiView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(confettiView)
    }

    func celebrate() {
        confettiView.emit()
    }
}
```

## Window-Based Emission

For simple one-shot effects, you can ask the active `UIWindow` to present confetti over the entire window.

```swift
import SharedConfetti
import UIKit

@MainActor
func celebrate() {
    UIWindow.emitConfetti(configuration: configuration)
}
```

This is the quickest API to use, but it is also the most global. Prefer `ConfettiView` or `UIConfettiView` when the effect belongs to a specific screen or container.

## Public Typealiases

The package also exposes convenience aliases if you prefer flatter names:

```swift
typealias ConfettiConfiguration = Confetti.Configuration
typealias ConfettiCell = Confetti.Cell
typealias ConfettiEmitter = Confetti.Emitter
typealias CellVelocity = Confetti.Cell.Velocity
typealias EmitterShape = Confetti.Emitter.Shape
```

## Choosing an API

- Use `ConfettiView` for SwiftUI screens.
- Use `UIConfettiView` for UIKit screens and reusable view hierarchies.
- Use `UIWindow.emitConfetti(configuration:)` for quick full-screen celebration effects.

## Notes

- The package is currently centered around manually building `Confetti.Configuration` values.
- `ConfettiView` is trigger-driven, so the effect emits when the `trigger` input changes.
- `UIConfettiView` is non-interactive and intended to sit on top of other content.

