# Plume

`Plume` is a Swift package for building particle effects with `CAEmitterLayer` and using them from SwiftUI or UIKit. The public API is centered around a single `Plume` value that combines an emitter and one or more particle cells.

## Requirements

- iOS 12+
- Swift Package Manager
- UIKit or SwiftUI

## Installation

Add `Plume` as a Swift package dependency, then import it where needed:

```swift
import Plume
```

## Overview

The package has three main pieces:

- `Plume`, the top-level effect model
- `PlumeView` and `PlumeUIView`, the SwiftUI and UIKit renderers
- a set of convenience extensions for quickly building emitters, cells, angles, accelerations, and velocities

## Type Tree

The public API is organized around `Plume` as the root type. Its purpose is to show the main model pieces you compose when building an effect.

```text
Plume
|_ Emitter
|_ Cell
|  |_ Contents
|  |_ Lifetime
|  |_ Spin
|  |_ Scale
|  |_ Acceleration
|  |_ Velocity
|  |_ Angle
```

## Building a Plume

At the center of the package is `Plume`, which combines:

- one `Plume.Emitter`
- one or more `Plume.Cell` values

The easiest way to create an emitter is with the built-in factory methods:

- `Plume.Emitter.point(birthRate:)`
- `Plume.Emitter.line(birthRate:)`
- `Plume.Emitter.circle(birthRate:)`
- `Plume.Emitter.rectangle(birthRate:)`

Here is a small example that builds a plume from SF Symbols-backed images:

```swift
import UIKit
import Plume

let images = [
    UIImage(systemName: "star.fill")!,
    UIImage(systemName: "circle.fill")!,
    UIImage(systemName: "seal.fill")!
]

let plume = Plume(
    emitter: .circle(birthRate: 24),
    cells: .cells(
        uiimages: images,
        lifetime: .init(base: 5, range: 1),
        spin: .init(base: 2, range: 1),
        scale: .init(base: 0.08, range: 0.03),
        acceleration: .gravity,
        velocity: .standard,
        angle: .radial
    )
)
```

## SwiftUI Usage

Use `PlumeView` when the effect belongs inside a SwiftUI hierarchy. The view is trigger-based: when the `trigger` value changes, the underlying `PlumeUIView` emits again.

```swift
import SwiftUI
import UIKit
import Plume

struct CelebrationView: View {
    @State private var trigger = 0

    private let plume = Plume(
        emitter: .line(birthRate: 18),
        cells: .cells(
            uiimages: [
                UIImage(systemName: "star.fill")!,
                UIImage(systemName: "triangle.fill")!
            ],
            lifetime: .init(base: 4),
            spin: .init(base: 2, range: 1),
            scale: .init(base: 0.09, range: 0.03),
            acceleration: .gravityLight,
            velocity: .lively,
            angle: .topHemisphere
        )
    )

    var body: some View {
        ZStack {
            Button("Celebrate") {
                trigger += 1
            }

            PlumeView(plume: plume, trigger: trigger)
                .allowsHitTesting(false)
        }
    }
}
```

Use this approach when the plume effect should be attached to a specific screen or view tree.

## UIKit Usage

Use `PlumeUIView` when you want direct UIKit control. Create the view, size it to your container, add it to the hierarchy, and call `emit()`.

```swift
import UIKit
import Plume

final class CelebrationViewController: UIViewController {
    private let plume = Plume(
        emitter: .rectangle(birthRate: 20),
        cells: .cells(
            uiimages: [
                UIImage(systemName: "sparkle")!,
                UIImage(systemName: "circle.fill")!
            ],
            lifetime: .init(base: 4),
            spin: .init(base: 1.5, range: 1),
            scale: .init(base: 0.08, range: 0.02),
            acceleration: .gravity,
            velocity: .standard,
            angle: .bottomHemisphere
        )
    )

    private lazy var plumeView = PlumeUIView(plume: plume)

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

## Manual Cell Construction

If you need full control, you can build cells directly instead of using `.cells(...)` helpers:

```swift
import UIKit
import Plume

let cell = Plume.Cell(
    contents: .init(uiimage: UIImage(systemName: "diamond.fill")!),
    lifetime: .init(base: 5, range: 1),
    spin: .init(base: 2, range: 1),
    scale: .init(base: 0.1, range: 0.04),
    acceleration: .upRight,
    velocity: .explosive,
    angle: .up
)

let plume = Plume(
    emitter: .point(birthRate: 12),
    cells: [cell]
)
```

## Convenience Helpers

The package includes a few helpers to make common effects easier to express:

- `Array.cells(...)` for turning arrays of `UIImage`, `CGImage`, or `ImageResource` into `[Plume.Cell]`
- `Plume.Cell.Acceleration` presets such as `.gravity`, `.gravityLight`, `.lift`, `.upLeft`, and `.downRight`
- `Plume.Cell.Angle` presets such as `.up`, `.down`, `.topHemisphere`, and `.radial`
- `Plume.Cell.Velocity` presets such as `.none`, `.gentle`, `.standard`, `.lively`, and `.explosive`

## Public Typealiases

If you prefer flatter names, the package exposes typealiases for the most common nested types:

```swift
typealias PlumeCell = Plume.Cell
typealias PlumeEmitter = Plume.Emitter
typealias CellAcceleration = Plume.Cell.Acceleration
typealias CellContents = Plume.Cell.Contents
typealias CellAngle = Plume.Cell.Angle
typealias CellLifetime = Plume.Cell.Lifetime
typealias CellScale = Plume.Cell.Scale
typealias CellSpin = Plume.Cell.Spin
typealias CellVelocity = Plume.Cell.Velocity
```

## Choosing an API

- Use `PlumeView` for SwiftUI screens.
- Use `PlumeUIView` for UIKit screens and custom view hierarchies.
- Use direct `Plume` and `Plume.Cell` construction when you want precise control over emitter behavior.

## Notes

- `PlumeView` is trigger-driven and emits when the `trigger` input changes.
- `PlumeUIView` is non-interactive by default and is intended to sit on top of other content.
- `Plume.Emitter.Mode` and `Plume.Emitter.Shape` are implementation details; the public entry point is the emitter factory API.
- `Plume.Cell.Velocity` currently uses preset constants as its primary public construction path.
