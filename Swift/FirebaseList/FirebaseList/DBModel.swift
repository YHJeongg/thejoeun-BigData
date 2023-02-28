//
//  DBModel.swift
//  FirebaseList
//
//  Created by Jeong Yun Hyeon on 2023/02/19.
//

import Foundation

struct DBModel {
    
    var documentId: String
    var code: String
    var name: String
    var dept: String
    var phone: String
    
    init(documentId: String, code: String, name: String, dept: String, phone: String) {
        self.documentId = documentId
        self.code = code
        self.name = name
        self.dept = dept
        self.phone = phone
    }
    
}
