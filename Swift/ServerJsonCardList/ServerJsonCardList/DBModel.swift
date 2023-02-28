//
//  DBModel.swift
//  ServerJsonCardList
//
//  Created by Jeong Yun Hyeon on 2023/02/19.
//

import Foundation

struct DBModel {
    var dbImage: String
    var dbCategory: String
    var dbHeading: String
    var dbAuthor: String
    
    init(dbImage: String, dbCategory: String, dbHeading: String, dbAuthor: String) {
        self.dbImage = dbImage
        self.dbCategory = dbCategory
        self.dbHeading = dbHeading
        self.dbAuthor = dbAuthor
    }
}
