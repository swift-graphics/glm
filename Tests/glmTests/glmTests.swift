import XCTest
@testable import glm
import Foundation
import CoreFoundation

//Setup stuff
var array = (0..<40_000).map { (_) in
    Float(rand() % 10)
}
var vecArray = stride(from: 0, to: array.count, by: 4)
        .map { (i: Int) -> SIMD4<Float> in
            SIMD4<Float>(array[i], array[i + 1], array[i + 2], array[i + 3])
        }

final class glmTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
//        XCTAssertEqual(glm().text, "Hello, World!")


        let a = bvec1()

        doNormalCount()
        doSimdCount()
    }

    func doNormalCount() {
        let a = array.count
        let b = array.endIndex
        let c = array.capacity
        var average = 0.0
        for boundary in 0...9 {
//            let negBoundary = -Float(boundary - 1)
//            var total = 0

            let time = benchmarkTime() {
                for i in stride(from: 0, through: 3999, by: 8) {
                    array[i] *= array[i + 4]
                    array[i + 1] *= array[i + 5]
                    array[i + 2] *= array[i + 6]
                    array[i + 3] *= array[i + 7]
//                    total += (array.count - Int(count))
                }
            }
            average += time
        }
        print("NORM: average \(average / 10) ms")
    }

    func sign(_ f: Float) -> Float {
        if f > 0 {
            return 1
        } else if f < 0 {
            return -1
        }
        return f
    }

    func doSimdCount() {
        var average = 0.0
        for boundary in 0...9 {
//            let negBoundary = SIMD4<Float>(-Float(boundary - 1))

            let time = benchmarkTime() {
                for i in stride(from: 0, through: 999, by: 2) {
                    vecArray[i] *= vecArray[i + 1]
//                    var counts = SIMD4<Float>()
//                    for i in 0..<vecArray.count {
//                        var v = vecArray[i]
//                        v += negBoundary
//                        v = pointwiseMax(v, SIMD4<Float>(0))
//                        counts += v
//                    }
                }
            }
            average += time
        }
        print("SIMD: average = \(average / 10) ms")
    }


    static var allTests = [
        ("testExample", testExample),
    ]
}

extension SIMD4 {
    public init(_ s: Scalar) {
        self.init(s, s, s, s)
    }
}

public func benchmarkTime(f: () -> ()) -> Double {
    f() // warmup
    let start = CFAbsoluteTimeGetCurrent()
    for _ in 0..<1 {
        f()
    }
    return (CFAbsoluteTimeGetCurrent() - start) * 1000
}