@testable import LeetCode
import XCTest

/// 剑指 Offer 04. 二维数组中的查找
final class LeetCodeTests_2: XCTestCase {
    
    /// 從右上開始往左下查找
    func findNumberIn2DArray2(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false }
            
        let n = matrix.count // 5
        let m = matrix[0].count // 5
            
        var i = 0
        var j = m - 1
            
        while i < n && j >= 0 {
            let current = matrix[i][j]
                
            if current == target {
                return true
            } else if target < current {
                j -= 1
            } else {
                i += 1
            }
        }
        return false
    }

    func test() throws {
        let sample = [
          [1,   4,  7, 11, 15],
          [2,   5,  8, 12, 19],
          [3,   6,  9, 16, 22],
          [10, 13, 14, 17, 24],
          [18, 21, 23, 26, 30]
        ]
        XCTAssertFalse(findNumberIn2DArray2(sample, 31))
        XCTAssertTrue(findNumberIn2DArray2(sample, 5))
    }
}
