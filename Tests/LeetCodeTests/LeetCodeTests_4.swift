//
//  Copyright © 2022 Pinkoi. All rights reserved.
//

import XCTest

/// 剑指 Offer 06. 从尾到头打印链表
/// 输入一个链表的头节点，从尾到头反过来返回每个节点的值（用数组返回）。
///
/// 示例 1：
///
/// 输入：head = [1,3,2]
/// 输出：[2,3,1]
///
/// var pre: ListNode? = nil
/// var cur: ListNode? = head
/// while cur != nil {
///     let tmp = cur?.next
///     cur?.pre = pre
///     pre = cur
///     cur = tmp
/// }
/// 1 > 3
/// 3 > 2
/// tmp = 3, cur.next = nil, pre = 1, cur = 3
/// 1 > nil

class ListNode {
    var val: Int
    var next: ListNode?
    var pre: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

final class LeetCodeTests_4: XCTestCase {
    
    func reversePrint(_ head: ListNode?) -> [Int] {
        if head == nil { return [] }
        var count = 0
        var currentHead = head
        
        while currentHead != nil {
            count += 1
            currentHead = currentHead!.next
        }
        var result = ContiguousArray(repeating: 0, count: count)
        var index = 0
        currentHead = head
        while currentHead != nil {
            result[index] = currentHead!.val
            currentHead = currentHead!.next
            index += 1
        }
        return result.reversed()
    }
    
    func reversePrint2(_ head: ListNode?) -> [Int] {
        var pre: ListNode? = nil
        var cur: ListNode? = head
            
        var count = 0
        while cur != nil {
            count += 1
            let tmp = cur?.next
            cur?.next = pre
            pre = cur
            cur = tmp
        }
        var res = ContiguousArray(repeating: 0, count: count)
        var index = 0
        while pre != nil {
            res[index] = pre!.val
            pre = pre?.next
            index += 1
        }
        return Array(res)
    }

    func test() {
        let one = ListNode(1)
        let three = ListNode(3)
        let two = ListNode(2)
        one.next = three
        three.next = two
        XCTAssertEqual(reversePrint(one), [2, 3, 1])
        XCTAssertEqual(reversePrint2(one), [2, 3, 1])
    }
}
