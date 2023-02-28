//
//  QueryModel.swift
//  OpenWeather
//
//  Created by Jeong Yun Hyeon on 2023/02/19.
//

import Foundation

protocol QueryModelProtocol {
    func itemDownloaded(items: [DBModel])
}

class QueryModel {
    var delegate: QueryModelProtocol!
    var apiKey: String = "_"
    
    func downloadItems(cityName: String) {
        let urlPath = "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=\(apiKey)"
        let url: URL = URL(string: urlPath)!
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.parseJSON(data)
                }
            } else {
                DispatchQueue.main.async {
                    self.errorJSON()
                }
            }
        }
    }
    
    func parseJSON(_ data: Data) {
        let decoder = JSONDecoder()
        var locations: [DBModel] = []
        
        do {
            let w = try decoder.decode(WeatherJSON.self, from: data)
            let query = DBModel(r_id: w.weather.first!.id, r_main: w.weather.first!.main, r_description: w.weather.first!.description, r_icon: w.weather.first!.icon, r_temp: w.main.temp, r_feels_like: w.main.feels_like, r_temp_min: w.main.temp_min, r_temp_max: w.main.temp_max, r_name: w.name)
            locations.append(query)
        } catch let error {
            print("Fail : \(error.localizedDescription)")
        }
        
        DispatchQueue.main.async {
            self.delegate.itemDownloaded(items: locations)
        }
    }
    
    func errorJSON() {
        var locations: [DBModel] = []
        let query = DBModel(r_id: 999, r_main: "None", r_description: "None", r_icon: "None", r_temp: 273, r_feels_like: 273, r_temp_min: 273, r_temp_max: 273, r_name: "None")
        locations.append(query)
        
        DispatchQueue.main.async {
            self.delegate.itemDownloaded(items: locations)
        }
    }
}
