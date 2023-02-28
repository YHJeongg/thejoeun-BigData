//
//  DBModel.swift
//  OpenWeather
//
//  Created by Jeong Yun Hyeon on 2023/02/19.
//

import Foundation

struct DBModel {
    let r_id: Int
    let r_main: String
    let r_description: String
    let r_icon: String
    let r_temp: Double
    let r_feels_like: Double
    let r_temp_min: Double
    let r_temp_max: Double
    let r_name: String
    
    init(r_id: Int, r_main: String, r_description: String, r_icon: String, r_temp: Double, r_feels_like: Double, r_temp_min: Double, r_temp_max: Double, r_name: String) {
        self.r_id = r_id
        self.r_main = r_main
        self.r_description = r_description
        self.r_icon = r_icon
        self.r_temp = r_temp
        self.r_feels_like = r_feels_like
        self.r_temp_min = r_temp_min
        self.r_temp_max = r_temp_max
        self.r_name = r_name
    }
}
