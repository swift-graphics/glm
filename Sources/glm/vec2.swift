//
// Created by elect on 01/10/19.
//

import Foundation

public extension vec2 {

    init(_ s: Int) {
        self.init(Float(s), Float(s))
    }

    init(_ t: (Float, Float)) {
        self.init(t.0, t.1)
    }

    var asTuple: (Float, Float) {
        (x, y)
    }
}