//
//  DBModel.swift
//  ServerJson_02
//
//  Created by Jeong Yun Hyeon on 2023/02/18.
//

import Foundation

class DBModel {
    var scode: String
    var sname: String
    var sdept: String
    var sphone: String
    
    init(scode: String, sname: String, sdept: String, sphone: String) {
        self.scode = scode
        self.sname = sname
        self.sdept = sdept
        self.sphone = sphone
    }
}
