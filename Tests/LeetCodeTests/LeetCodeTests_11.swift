//
//  Copyright © 2022 Pinkoi. All rights reserved.
//

import XCTest

/// 剑指 Offer 11. 旋转数组的最小数字

final class LeetCodeTests_11: XCTestCase {
    func minArray(_ numbers: [Int]) -> Int {
        return numbers.min(by: <) ?? 0
    }
    
    func test_1() {
        XCTAssertEqual(minArray([3,4,5,1,2]), 1)
        XCTAssertEqual(minArray([2,2,2,0,1]), 0)
    }
}
