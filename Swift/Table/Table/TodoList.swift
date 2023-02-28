//
//  TodoList.swift
//  Table
//
//  Created by Jeong Yun Hyeon on 2023/02/18.
//

import Foundation

struct TodoList {
    var items: String
    var itemsImageFile: String
    
    init(items: String, itemsImageFile: String) {
        self.items = items
        self.itemsImageFile = itemsImageFile
    }
}
