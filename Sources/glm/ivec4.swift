//
// Created by elect on 28/09/19.
//

import Foundation

extension ivec4 {

    init(ints: [Int32]) {
        switch ints.count {
        case 0: self.init(0, 0, 0, 0)
        case 1: self.init(ints[0], 0, 0, 0)
        case 2: self.init(ints[0], ints[1], 0, 0)
        case 3: self.init(ints[0], ints[1], ints[2], 0)
        default: self.init(ints[0], ints[1], ints[2], ints[3])
        }
    }
}