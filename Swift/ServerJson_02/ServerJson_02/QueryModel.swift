//
//  QueryModel.swift
//  ServerJson_02
//
//  Created by Jeong Yun Hyeon on 2023/02/18.
//

import Foundation

protocol QueryModelProtocol {
    func itemDownload(items: [DBModel])
}

class QueryModel {
    var delegate: QueryModelProtocol!
    let urlPath = "https://zeushahn.github.io/Test/ios/student.json"
    
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
            let students = try decorder.decode([StudentJSON].self, from: data)
            for student in students {
                let query = DBModel(scode: student.code, sname: student.name, sdept: student.dept, sphone: student.phone)
                locations.append(query)
            }
            print(students.count)
        } catch let error {
            print("Fail : \(error.localizedDescription)")
        }
        
        DispatchQueue.main.async {
            self.delegate.itemDownload(items: locations)
        }
    }
}
