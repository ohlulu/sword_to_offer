//
//  LeetCodeTests_7.swift
//

import XCTest

/// 剑指 Offer 07. 重建二叉树
///
/// 输入某二叉树的前序遍历和中序遍历的结果，请构建该二叉树并返回其根节点。
/// 假设输入的前序遍历和中序遍历的结果中都不含重复的数字。
///
/// Input: preorder = [3, 9, 20, 15, 7], inorder = [9, 3, 15, 20, 7]
/// Output: [3, 9, 20, null, null, 15, 7]
///
/// 前序遍歷性質： 節點按照 [ 根節點 | 左子樹 | 右子樹 ] 排序。
/// 中序遍歷性質： 節點按照 [ 左子樹 | 根節點 | 右子樹 ] 排序。
public class TreeNode: CustomStringConvertible {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public var description: String {
        return "value: \(val), left: \(String(describing: left)), right: \(String(describing: right))\n"
    }
}

class Solution {

    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.isEmpty { return nil }
        let node = TreeNode(preorder[0])
        if inorder.count == 1 {
            return node
        }
        guard let inorderStartIndex: Int = inorder.firstIndex(where: { $0 == node.val }) else { return nil }
        let inLeft: [Int] = Array(inorder[0 ..< inorderStartIndex])
        let inRight: [Int] = Array(inorder[max(inorderStartIndex + 1, 0) ..< preorder.count])
            
        let preLeft: [Int] = Array(preorder[1 ... max(inorderStartIndex, 1)])
        let preRight: [Int] = Array(preorder[max(inorderStartIndex + 1, 0) ..< preorder.endIndex])
            
        node.left = buildTree(preLeft, inLeft)
        node.right = buildTree(preRight, inRight)
        return node
    }
}

/// Only print, not assert
final class LeetCodeTests_7: XCTestCase {
    
    override func setUp() {
        print("-----------------")
    }

    func test_1() {
        let solution = Solution()
        print(solution.buildTree([3, 9, 20, 15, 7], [9, 3, 15, 20, 7]) ?? [])
    }
    
    func test_2() {
        let solution = Solution()
        print(solution.buildTree([3, 9, 20, 7, 15], [9, 3, 20, 7, 15]) ?? [])
    }
    
    func test_3() {
        let solution = Solution()
        print(solution.buildTree([3, 9, 20, 15, 7], [9, 3, 20, 15, 7]) ?? [])
    }
    
    func test_4() {
        let solution = Solution()
        print(solution.buildTree([3, 9, 10, 20, 15, 7], [10, 9, 3, 20, 15, 7]) ?? [])
    }
}
