//
//  Calculation.swift
//  Calc
//
//  Created by Jeong Yun Hyeon on 2023/02/14.
//

import Foundation

class Calculation {
    // Field / Property
    // Constructor
    // Function
    func add(_ num1: String, _ num2: String) -> Int {
        guard let anum = Int(num1), let bnum = Int(num2) else { return 0 }

        return anum + bnum
    }
}
