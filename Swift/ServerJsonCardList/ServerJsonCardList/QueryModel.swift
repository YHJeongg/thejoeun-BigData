//
//  QueryModel.swift
//  ServerJsonCardList
//
//  Created by Jeong Yun Hyeon on 2023/02/19.
//

import Foundation

protocol QueryModelProtocol {
    func itemDownload(items: [DBModel])
}

class QueryModel {
    var delegate: QueryModelProtocol!
    let urlPath = "https://zeushahn.github.io/Test/ios/cards.json"
    
    func downloadItems() {
        let url: URL = URL(string: urlPath)!
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                self.parseJSON(data!)
            }
        }
    }
    
    func parseJSON(_ data: Data) {
        let decorder = JSONDecoder()
        var locations: [DBModel] = []
        
        do {
            let images = try decorder.decode([ImageJson].self, from: data)
            for image in images {
                let query = DBModel(dbImage: image.image, dbCategory: image.category, dbHeading: image.heading, dbAuthor: image.author)
                locations.append(query)
            }
        } catch let error {
            print("Fail : \(error.localizedDescription)")
        }
        
        DispatchQueue.main.async {
            self.delegate.itemDownload(items: locations)
        }
    }
}
