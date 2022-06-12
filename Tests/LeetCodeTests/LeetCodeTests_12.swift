//
//  Copyright © 2022 Pinkoi. All rights reserved.
//

import XCTest

/// 剑指 Offer 12. 矩阵中的路径
/*
 DFS 解析：
 遞歸參數： 當前元素在矩陣 board 中的行列索引 i 和 j ，當前目標字符在 word 中的索引 k 。
 終止條件：
 返回 falsefalse ： (1) 行或列索引越界 或 (2) 當前矩陣元素與目標字符不同 或 (3) 當前矩陣元素已訪問過 （ (3) 可合並至 (2) ） 。
 返回 truetrue ： k = len(word) - 1 ，即字符串 word 已全部匹配。
 遞推工作：
 標記當前矩陣元素： 將 board[i][j] 修改為 空字符 '' ，代表此元素已訪問過，防止之後搜索時重復訪問。
 搜索下一單元格： 朝當前元素的 上、下、左、右 四個方向開啟下層遞歸，使用 或 連接 （代表只需找到一條可行路徑就直接返回，不再做後續 DFS ），並記錄結果至 res 。
 還原當前矩陣元素： 將 board[i][j] 元素還原至初始值，即 word[k] 。
 返回值： 返回布爾量 res ，代表是否搜索到目標字符串。
 */
extension Array where Element == Array<Character> {
    subscript(_ tuple: (Int, Int)) -> Element.Element {
        return self[tuple.0][tuple.1]
    }
}


final class LeetCodeTests_12: XCTestCase {
//    func exist(_ board: [[Character]], _ word: String) -> Bool {
//        var lookup = [(Int, Int)]()
//        for y in 0..<board.count {
//            for x in 0..<board[y].count {
//                if board[(y, x)] == word[word.startIndex] {
//                    lookup.append((y, x))
//                }
//            }
//        }
//
//        let xRange = 0..<board[0].count
//        let yRange = 0..<board.count
//        for current in lookup {
//            print("current: \((current.1, current.0))")
//            var x = current.1
//            var y = current.0
//            var wIndex = word.startIndex
//            var footprint = [current]
//            while true {
//                print("x, y = \((x, y))")
//                let nextIndex = word.index(after: wIndex)
//                if nextIndex == word.endIndex {
//                    return true
//                }
//                let next = word[nextIndex]
//
//                var isFind = false
//                for direct in [(y-1, x), (y, x+1), (y+1, x), (y, x-1)] {
//                    if !yRange.contains(direct.0) || !xRange.contains(direct.1) { continue }
//                    if footprint.contains(where: { $0 == direct }) { continue }
//                    if board[direct] == next {
//                        y = direct.0
//                        x = direct.1
//                        footprint.append(direct)
//                        wIndex = nextIndex
//                        isFind = true
//                        break
//                    }
//                }
//
//                if !isFind {
//                    break
//                }
//            }
//        }
//        return false
//    }
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let words = Array(word)
        var board = board
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if dfs(&board, words: words, i: i, j: j, k: 0) {
                    return true
                }
            }
        }
        return false
    }
    
    func dfs(_ board: inout [[Character]], words: [Character], i: Int, j: Int, k: Int) -> Bool {
        
//        for i in 0..<board.count {
//            print(board[i])
//        }

        if(i >= board.count || i < 0 || j >= board[0].count || j < 0 || board[i][j] != words[k]) {
            return false
        }
        if (k == (words.count-1)) {
            return true
        }
        
        board[i][j] = "/"
        
        let result = dfs(&board, words: words, i: i + 1, j: j, k: k + 1) ||
        dfs(&board, words: words, i: i - 1, j: j, k: k + 1) ||
        dfs(&board, words: words, i: i, j: j + 1, k: k + 1) ||
        dfs(&board, words: words, i: i, j: j - 1, k: k + 1)
        board[i][j] = words[k]
        return result
        
    }
    
    func test_0() {
        let result = exist([
            ["A", "B", "C", "E"],
            ["S", "F", "C", "S"],
            ["A", "D", "E", "E"]
        ], "ABCCED")
        XCTAssertEqual(result, true)
    }
    
    func test_1() {
        let result = exist([
            ["A", "D", "E", "E"],
            ["S", "F", "C", "S"],
            ["A", "B", "C", "E"],
        ], "ABCCED")
        XCTAssertEqual(result, true)
    }
    
    func test_2() {
        let result = exist([
            ["a", "b"],
            ["c", "d"]
        ], "abcd")
        XCTAssertEqual(result, false)
    }
    
    func test_3() {
        let result = exist([
            ["a","a"]
        ], "aaaa")
        XCTAssertEqual(result, false)
    }
    
    func test_4() {
        let result = exist([
            ["C","A","A"],
            ["A","A","A"],
            ["B","C","D"]
        ], "AAB")
        XCTAssertEqual(result, true)
    }
    
    func test_5() {
        let result = exist([["F","Y","C","E","N","R","D"],
                            ["K","L","N","F","I","N","U"],
                            ["A","A","A","R","A","H","R"],
                            ["N","D","K","L","P","N","E"],
                            ["A","L","A","N","S","A","P"],
                            ["O","O","G","O","T","P","N"],
                            ["H","P","O","L","A","N","O"]],
                           "POLAND")
        
        XCTAssertEqual(result, true)

    }
}

//
// func exist(_ board: [[Character]], _ word: String) -> Bool {
//    let maxX = board[0].count
//    let maxY = board.count
//    var x = 0
//    var y = 0
//
//    var wIndex = word.startIndex
//
//    while x < maxX || y < maxY {
//        let right = (y, x+1)
//        let down = (y+1, x)
//        let left = (y, x-1)
//
//        if board[y][x] == word[wIndex] {
//            if board[right] == word[word.index(after: wIndex)] {
//                wIndex = word.index(after: wIndex)
//                x += 1
//            } else if board[down] == word[word.index(after: wIndex)] {
//                wIndex = word.index(after: wIndex)
//                y += 1
//            } else if board[left] == word[word.index(after: wIndex)] {
//                wIndex = word.index(after: wIndex)
//                y -= 1
//            } else {
//
//            }
//        } else {
//            if board[right] == word[word.index(after: wIndex)] {
//                wIndex = word.index(after: wIndex)
//                x += 1
//            } else if board[down] == word[word.index(after: wIndex)] {
//                wIndex = word.index(after: wIndex)
//                y += 1
//            } else if board[left] == word[word.index(after: wIndex)] {
//                wIndex = word.index(after: wIndex)
//                y -= 1
//            }
//        }
//    }
// }
