//
//  JSONModel.swift
//  ServerJson_02
//
//  Created by Jeong Yun Hyeon on 2023/02/18.
//

import Foundation

struct StudentJSON: Codable {
    var code: String
    var phone: String
    var name: String
    var dept: String
}
