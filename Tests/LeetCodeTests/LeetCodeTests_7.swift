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
        return "value: \(val), left: \(left), right: \(right)\n"
    }
}

class Solution {
    /// preorder 中左右
    /// inorder 左中右
    /// Input: preorder = [3, 9, 20, 15, 7], inorder = [9, 3, 15, 20, 7] lv1
    /// Input: preorder = [9, 20, 15, 7], inorder = [9] lv2
    /// Input: preorder = [20, 15, 7], inorder = [15, 20, 7] lv2
    /// Input: preorder = [20, 15, 7], inorder = [] lv3
    /// Input: preorder = [20, 15, 7], inorder = [] lv3
    /// Input: preorder = [20, 15, 7], inorder = [15, 20, 7] lv2
    /// Input: preorder = [15, 7], inorder = [15] lv3
    /// Input: preorder = [7], inorder = [7] lv3
    ///
    /// Output: [3, 9, 20, null, null, 15, 7]
    ///
    ///
    /// Input: preorder = [3, 9, 20, 7, 15], inorder = [9, 3, 20, 7, 15] lv1
    /// Input: preorder = [9, 20, 7, 15], inorder = [9] lv2
    /// Input: preorder = [20, 7, 15], inorder = [20, 7, 15] lv2
    /// Input: preorder = [7, 15], inorder = [] lv3
    /// Input: preorder = [7, 15], inorder = [7, 15] lv3
    /// Input: preorder = [15], inorder = [] lv4
    /// Input: preorder = [15], inorder = [15] lv4
    func next(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        let node = TreeNode(preorder[0])
        if inorder.count == 1 {
            return node
        }
        
        guard let inorderStartIndex: Int = inorder.firstIndex(where: { $0 == node.val }) else {
            return nil
        }
    
        let newPreorder = Array(preorder.dropFirst())
        let leftArray: [Int] = Array(inorder[0..<inorderStartIndex])
        let rightArray: [Int] = {
            if inorderStartIndex == preorder.count {
                return []
            } else {
                return Array(inorder[inorderStartIndex+1..<preorder.count])
            }
        }()
        node.left = next(newPreorder, leftArray)
        node.right = next(newPreorder, rightArray)
        return node
    }
    
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        var preorder = preorder
        return next(preorder, inorder)
    }
}

final class LeetCodeTests_7: XCTestCase {
    
    override func setUp() {
        print("-----------------")
    }

    func test_1() {
        let solution = Solution()
        print(solution.buildTree([3,9,20,15,7], [9,3,15,20,7]))
    }
    
    func test_2() {
        let solution = Solution()
        print(solution.buildTree([3,9,20,7,15], [9,3,20,7,15]))
    }
    
    func test_3() {
        let solution = Solution()
        print(solution.buildTree([3,9,20,15,7], [9,3,20,15,7]))
    }
}
