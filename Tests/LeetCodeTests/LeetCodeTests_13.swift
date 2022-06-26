//
//  Copyright © 2022 Pinkoi. All rights reserved.
//

import XCTest

/**
 剑指 Offer 13. 机器人的运动范围
 
 地上有一个m行n列的方格，从坐标 [0,0] 到坐标 [m-1,n-1] 。一个机器人从坐标 [0, 0] 的格子开始移动，它每次可以向左、右、上、下移动一格（不能移动到方格外），也不能进入行坐标和列坐标的数位之和大于k的格子。例如，当k为18时，机器人能够进入方格 [35, 37] ，因为3+5+3+7=18。但它不能进入方格 [35, 38]，因为3+5+3+8=19。请问该机器人能够到达多少个格子？
  */
final class LeetCodeTests_13: XCTestCase {
    class Solution {
        func movingCount(_ m: Int, _ n: Int, _ k: Int) -> Int {
            var visited: [[Bool]] = {
                let nr = [Bool](repeating: false, count: n)
                let mr = [[Bool]](repeating: nr, count: m)
                return mr
            }()
            
            func dfs(_ i: Int, _ j: Int) -> Int {
                if i >= m || j >= n || sum(i) + sum(j) > k || visited[i][j] {
                    return 0
                }
                visited[i][j] = true
                return 1 + dfs(i + 1, j) + dfs(i, j + 1)
            }
            
            return dfs(0, 0)
        }
        
        private func sum(_ x: Int) -> Int {
            var x = x
            var s = 0
            while x != 0 {
                s += x % 10
                x /= 10
            }
            return s
        }
    }
    
    func test_0() {
        let result = Solution().movingCount(1, 1, 0)
        XCTAssertEqual(result, 1)
    }
    
    func test_1() {
        let result = Solution().movingCount(2, 3, 1)
        XCTAssertEqual(result, 3)
    }
    
    func test_2() {
        let result = Solution().movingCount(16, 8, 10)
        XCTAssertEqual(result, 101)
    }
}
