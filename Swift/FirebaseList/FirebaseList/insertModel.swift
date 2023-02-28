//
//  insertModel.swift
//  FirebaseList
//
//  Created by Jeong Yun Hyeon on 2023/02/19.
//

import Foundation
import Firebase

class insertModel {
    let db = Firestore.firestore()
    
    func insertItems(code: String, name: String, dept: String, phone: String) -> Bool {
        var status: Bool = true
        
        db.collection("students").addDocument(data: [
            "code" : code,
            "name" : name,
            "dept" : dept,
            "phone" : phone
        ]) { error in
            if error != nil {
                status = false
            } else {
                status = true
            }
        }
        return status
    }
}
