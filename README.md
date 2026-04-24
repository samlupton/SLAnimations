# SharedConfetti

## Type Tree

The type tree shows how the package’s core API is organized around Confetti as the root namespace, with related configuration and emitter types grouped beneath it. Its purpose is to give readers a quick mental model of the package structure so they can understand how the main types relate before diving into implementation details or usage examples.

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
