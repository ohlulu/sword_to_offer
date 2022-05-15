//
//  Copyright © 2022 Pinkoi. All rights reserved.
//

import XCTest

// 剑指 Offer 10- II. 青蛙跳台阶问题
// 一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个 n 级的台阶总共有多少种跳法。

// 答案需要取模 1e9+7（1000000007），如计算初始结果为：1000000008，请返回 1。

final class LeetCodeTests_10_2: XCTestCase {
    
    /// f(0) = 1
    /// f(1) = 1
    /// f(2) = 2
    func numWays(_ n: Int) -> Int {
        var arr = [1, 1, 2]
        
        if n <= 2 {
            return arr[n]
        }
        
        for i in 3...n {
            let next = (arr[i-1] + arr[i-2]) % 1000000007
            arr.append(next)
        }
        
        return arr.last!
    }
    
    func numWays2(_ n: Int) -> Int {
        var l = 1
        var r = 2
        
        if n == 0 || n == 1 { return 1 }
        if n == 2  { return 2 }
        
        for _ in 3...n {
            (l, r) = (r, (l+r) % 1000000007)
        }
        
        return r
    }
    
    
    func test_1() {
        XCTAssertEqual(numWays(0), 1)
        XCTAssertEqual(numWays2(0), 1)
    }
    
    func test_2() {
        XCTAssertEqual(numWays(1), 1)
        XCTAssertEqual(numWays2(1), 1)
    }
    
    func test_3() {
        XCTAssertEqual(numWays(2), 2)
        XCTAssertEqual(numWays2(2), 2)
    }
    
    func test_4() {
        XCTAssertEqual(numWays(3), 3)
        XCTAssertEqual(numWays2(3), 3)
    }
    
    func test_5() {
        XCTAssertEqual(numWays(7), 21)
        XCTAssertEqual(numWays2(7), 21)
    }
}
