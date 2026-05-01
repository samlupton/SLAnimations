import XCTest
@testable import Plume

final class PlumeTests: XCTestCase {
    func test_plume() {
        var plume = Plume(emitter: .circle(birthRate: 10), cells: cells(count: .zero))
        XCTAssertEqual(plume.emitter.mode, .surface)
        XCTAssertEqual(plume.emitter.shape, .circle)
        XCTAssertEqual(plume.emitter.birthRate, 10)
        XCTAssertEqual(plume.cells.count, .zero)
        
        plume = Plume(emitter: .line(birthRate: 11), cells: cells(count: 1))
        XCTAssertEqual(plume.emitter.mode, .outline)
        XCTAssertEqual(plume.emitter.shape, .line)
        XCTAssertEqual(plume.emitter.birthRate, 11)
        XCTAssertEqual(plume.cells.count, 1)
        
        plume = Plume(emitter: .point(birthRate: 12), cells: cells(count: 2))
        XCTAssertEqual(plume.emitter.mode, .points)
        XCTAssertEqual(plume.emitter.shape, .point)
        XCTAssertEqual(plume.emitter.birthRate, 12)
        XCTAssertEqual(plume.cells.count, 2)
        
        plume = Plume(emitter: .rectangle(birthRate: 13), cells: cells(count: 3))
        XCTAssertEqual(plume.emitter.mode, .surface)
        XCTAssertEqual(plume.emitter.shape, .rectangle)
        XCTAssertEqual(plume.emitter.birthRate, 13)
        XCTAssertEqual(plume.cells.count, 3)
    }
}

// MARK: - Testings Constants

extension PlumeTests {
    func cells(count: Int) -> [Plume.Cell] {
        return .make(
            from: Array(repeating: .actions, count: count),
            lifetime: .ambient,
            spin: .chaotic,
            scale: .huge,
            acceleration: .downLeft,
            velocity: .explosive,
            angle: .bottomHemisphere
        )
    }
}
