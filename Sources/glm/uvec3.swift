//
// Created by elect on 01/10/19.
//

import Foundation

public extension uvec3 {

    init(_ s: Int) {
        self.init(UInt32(s), UInt32(s), UInt32(s))
    }
}