//
//  LeetCodeTests_9.swift
//  
//
//  Created by 郭景豪 on 2022/4/24.
//

//寫一個函數，輸入 n ，求斐波那契（Fibonacci）數列的第 n 項（即 F(N)）。斐波那契數列的定義如下：
//
//F(0) = 0,   F(1) = 1
//F(N) = F(N - 1) + F(N - 2), 其中 N > 1.
//斐波那契數列由 0 和 1 開始，之後的斐波那契數就是由之前的兩數相加而得出。
//
//答案需要取模 1e9+7（1000000007），如計算初始結果為：1000000008，請返回 1。
//


import XCTest


/// Only print, not assert
final class LeetCodeTests_9: XCTestCase {
    
    class Solution {
        
        func fib(_ n: Int) -> Int {
            // 标准dp(复杂度O(n)+O(n))
            if (n < 2) {
                return n
            }
            var dp: [Int] = []
            dp.append(0)
            dp.append(1)
            for i in 2...n {
                let next = (dp[i - 1] + dp[i - 2]) % 1000000007
                dp.append(next)
            }
            return dp.removeLast()
        }
        
    }
    //0 1 1 2 3 5 8
    func test_1() {
        let solution = Solution()
        XCTAssertEqual(solution.fib(0), 0)
        XCTAssertEqual(solution.fib(1), 1)
        XCTAssertEqual(solution.fib(2), 1)
        XCTAssertEqual(solution.fib(3), 2)
        XCTAssertEqual(solution.fib(5), 5)
        XCTAssertEqual(solution.fib(6), 8)
        XCTAssertEqual(solution.fib(45), 134903163)
    }
    
}
