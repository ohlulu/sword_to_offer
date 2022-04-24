//
//  LeetCodeTests_8.swift
//  
//
//  Created by 郭景豪 on 2022/4/24.
//

//用兩個棧實現一個隊列。隊列的聲明如下，請實現它的兩個函數 appendTail 和 deleteHead ，分別完成在隊列尾部插入整數和在隊列頭部刪除整數的功能。(若隊列中沒有元素，deleteHead 操作返回 -1 )

import Foundation

class CQueue {
    
    var array = [Int]()
    
    init() {
        
    }
    
    func appendTail(_ value: Int) {
        array.append(value)
    }
    
    func deleteHead() -> Int {
        if array.isEmpty {
            return -1
        }
        return array.removeFirst()
    }
}

/**
 * Your CQueue object will be instantiated and called as such:
 * let obj = CQueue()
 * obj.appendTail(value)
 * let ret_2: Int = obj.deleteHead()
 */
