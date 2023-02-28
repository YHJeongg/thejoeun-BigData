//
//  JSONModel.swift
//  ServerJsonCardList
//
//  Created by Jeong Yun Hyeon on 2023/02/19.
//

import Foundation

struct ImageJson: Codable {
    var image: String
    var category: String
    var heading: String
    var author: String
}
