//
// Created by elect on 01/10/19.
//

import Foundation

public extension uvec2 {

    init(_ s: Int) {
        self.init(UInt32(s), UInt32(s))
    }

    init(_ t: (UInt32, UInt32, UInt32)) {
        self.init(t.0, t.1, t.2)
    }

    var asTuple: (UInt32, UInt32, UInt32) {
        (x, y, z)
    }
}