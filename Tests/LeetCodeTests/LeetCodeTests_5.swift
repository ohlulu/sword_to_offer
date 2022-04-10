//
//  Copyright © 2022 Ohlulu. All rights reserved.
//

import XCTest

/// 剑指 Offer 05. 替换空格
///
/// 请实现一个函数，把字符串 s 中的每个空格替换成"%20"。
///
/// 示例 1：
///
/// 输入：s = "We are happy."
/// 输出："We%20are%20happy."
final class LeetCodeTests_5: XCTestCase {
    
    /**
     先把 Array 的空間填好，創兩個 index，搬 Character，遇到空白就補上 %20
     "We are happy."
     "We are happy.000000"
                  ^     ^
                 12     18
     "We are happy.00000."
     "We are happy.0000y."
     "We are happy.000py."
     "We are happy.00ppy."
     "We are happy.0appy."
     "We are happy.happy." // strArr[left] == " "
            ^     ^
     "We are hap%20happy." //left -= 1 right -= 3
     "We are hap%20happy."
           ^   ^
     */
    func replaceSpace(_ s: String) -> String {
        var strArr = Array(s)
        var spaceCount = 0
        for i in strArr {
            if i == " " {
                spaceCount += 1
            }
        }
        var left = strArr.count - 1
        var right = strArr.count + spaceCount * 2 - 1
        for _ in 0 ..< (spaceCount * 2) {
            strArr.append("0")
        }
        while left < right {
            if strArr[left] == " " {
                strArr[right] = "0"
                strArr[right - 1] = "2"
                strArr[right - 2] = "%"
                left -= 1
                right -= 3
            } else {
                strArr[right] = strArr[left]
                left -= 1
                right -= 1
            }
        }
        return String(strArr)
    }
    
    
    /**
     先把 Array 的空間創好，把 s 的 Character 搬到 array 遇到空白改填入 %20
     */
    func replaceSpace2(_ s: String) -> String {
        var spaceCount = 0
        for i in s {
            if i == " " {
                spaceCount += 1
            }
        }
        var array = ContiguousArray(repeating: Character(" "), count: s.count + spaceCount * 2)
        var i = 0
        for char in s {
            if char == " " {
                array[i] = "%"
                array[i+1] = "2"
                array[i+2] = "0"
                i += 3
            } else {
                array[i] = char
                i += 1
            }
        }
        return String(array)
    }

    func test() throws {
        XCTAssertEqual(replaceSpace2("We are happy."), "We%20are%20happy.")
        XCTAssertEqual(replaceSpace("We are happy."), "We%20are%20happy.")
    }
}
