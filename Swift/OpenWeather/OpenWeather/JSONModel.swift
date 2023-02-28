//
//  JSONModel.swift
//  OpenWeather
//
//  Created by Jeong Yun Hyeon on 2023/02/19.
//

import Foundation

struct WeatherJSON: Codable {
    let weather: [Weather]
    let main: Main
    let name: String
}

// Weather 객체
struct Weather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct Main:Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
}
