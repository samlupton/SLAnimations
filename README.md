# Plume

`Plume` is a Swift package for rendering configurable plume effects with `CAEmitterLayer`. It gives you a small public model layer for defining emitter behavior and two main integration paths: embed plume directly in SwiftUI with `PlumeView`.

## Requirements

- iOS 12+
- Swift Package Manager
- UIKit or SwiftUI

## Installation

Add `Plume` to your project as a Swift package dependency, then import it where needed:

```swift
import Plume
```

## Core Concepts

- `Plume.Configuration` describes a complete effect.
- `Plume.Emitter` describes the emitter’s shape and mode.
- `Plume.Cell` describes the particles being emitted.
- `PlumeView` is the SwiftUI entry point.
- `UIPlumeView` is the UIKit entry point.

## Type Tree

The package’s core API is organized around `Plume` as the root namespace, with related configuration and emitter types grouped beneath it.

```text
Plume
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

At the center of the package is `Plume.Configuration`, which combines an emitter and one or more cells.

```swift
import Plume
import UIKit

let cell = Plume.Cell(
    lifetime: .init(birthRate: 24, base: 6, range: 1),
    spin: .init(base: 3, range: 1),
    scale: .init(base: 0.08, range: 0.03),
    acceleration: .init(x: 0, y: 120),
    velocity: .init(base: 180, range: 60),
    emission: .init(latitude: 0, longitude: 0, range: .pi),
    contents: .init(uiimage: UIImage(systemName: "circle.fill"))
)

let configuration = Plume.Configuration(
    emitter: .init(shape: .line, mode: .surface),
    cells: [cell]
)
```

## SwiftUI Usage

Use `PlumeView` when you want plume to live inside a SwiftUI layout. The view uses a trigger-based API: each time the `trigger` value changes, the underlying UIKit view emits again.

```swift
import SwiftUI
import Plume

struct CelebrationView: View {
    @State private var trigger = 0

    private let configuration = Plume.Configuration(
        emitter: .init(shape: .line, mode: .surface),
        cells: [
            .init(
                lifetime: .init(birthRate: 20, base: 5, range: 1),
                spin: .init(base: 2, range: 1),
                scale: .init(base: 0.1, range: 0.04),
                acceleration: .init(x: 0, y: 140),
                velocity: .init(base: 160, range: 40),
                emission: .init(latitude: 0, longitude: 0, range: .pi),
                contents: .init(uiimage: UIImage(systemName: "star.fill"))
            )
        ]
    )

    var body: some View {
        ZStack {
            Button("Celebrate") {
                trigger += 1
            }

            PlumeView(configuration: configuration, trigger: trigger)
                .allowsHitTesting(false)
        }
    }
}
```

Use this approach when the plume effect should be part of a specific screen or view hierarchy.

## UIKit Usage

If you are working in UIKit, create a `UIPlumeView`, size it like any other view, add it to your hierarchy, and call `emit()`.

```swift
import UIKit
import Plume

final class CelebrationViewController: UIViewController {
    private lazy var plumeView = UIPlumeView(configuration: configuration)

    private let configuration = Plume.Configuration(
        emitter: .init(shape: .circle, mode: .outline),
        cells: [
            .init(
                lifetime: .init(birthRate: 18, base: 5, range: 1),
                spin: .init(base: 2, range: 2),
                scale: .init(base: 0.08, range: 0.03),
                acceleration: .init(x: 0, y: 100),
                velocity: .init(base: 150, range: 50),
                emission: .init(latitude: 0, longitude: 0, range: .pi),
                contents: .init(uiimage: UIImage(systemName: "seal.fill"))
            )
        ]
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        plumeView.frame = view.bounds
        plumeView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(plumeView)
    }

    func celebrate() {
        plumeView.emit()
    }
}
```

## Public Typealiases

The package also exposes convenience aliases if you prefer flatter names:

```swift
typealias PlumeConfiguration = Plume.Configuration
typealias PlumeCell = Plume.Cell
typealias PlumeEmitter = Plume.Emitter
typealias CellVelocity = Plume.Cell.Velocity
typealias EmitterShape = Plume.Emitter.Shape
```

## Choosing an API

- Use `PlumeView` for SwiftUI screens.
- Use `UIPlumeView` for UIKit screens and reusable view hierarchies.

## Notes

- The package is currently centered around manually building `Plume.Configuration` values.
- `PlumeView` is trigger-driven, so the effect emits when the `trigger` input changes.
- `UIPlumeView` is non-interactive and intended to sit on top of other content.

