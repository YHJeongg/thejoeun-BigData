//
//  Students.swift
//  SQLite
//
//  Created by Jeong Yun Hyeon on 2023/02/19.
//

import Foundation

struct Students {
    var id: Int
    var name: String
    var dept: String
    var phone: String
    
    init(id: Int, name: String, dept: String, phone: String) {
        self.id = id
        self.name = name
        self.dept = dept
        self.phone = phone
    }
}
