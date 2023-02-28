//
//  QueryModel.swift
//  FirebaseList
//
//  Created by Jeong Yun Hyeon on 2023/02/19.
//

import Foundation
import Firebase

protocol QueryModelProtocol {
    func itemDownload(items: [DBModel])
}

class QueryModel {
    var delegate: QueryModelProtocol!
    let db = Firestore.firestore()
    
    func downloadItems() {
        var locations: [DBModel] = []
        
        db.collection("students")
            .order(by: "code").getDocuments(completion: {(querySnapShot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    print("Data is download.")
                    for document in querySnapShot!.documents {
                        guard let data = document.data()["code"] else { return }
                        print("\(document.documentID) => \(data)")
                        let query = DBModel(
                            documentId: document.documentID,
                            code: document.data()["code"] as! String,
                            name: document.data()["name"] as! String,
                            dept: document.data()["dept"] as! String,
                            phone: document.data()["phone"] as! String
                        )
                        locations.append(query)
                    }
                }
                DispatchQueue.main.async {
                    self.delegate.itemDownload(items: locations)
                }
            })
    }
}
