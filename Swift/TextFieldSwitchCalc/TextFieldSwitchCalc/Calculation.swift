//
//  Calculation.swift
//  TextFieldSwitchCalc
//
//  Created by Jeong Yun Hyeon on 2023/02/14.
//

import Foundation

class Calculation {
    func add(_ num1: String, _ num2: String) -> Int {
        guard let anum = Int(num1), let bnum = Int(num2) else { return 0 }

        return anum + bnum
    }
    
    func sub(_ num1: String, _ num2: String) -> Int {
        guard let anum = Int(num1), let bnum = Int(num2) else { return 0 }

        return anum - bnum
    }
    
    func multi(_ num1: String, _ num2: String) -> Int {
        guard let anum = Int(num1), let bnum = Int(num2) else { return 0 }

        return anum * bnum
    }
    
    func div(_ num1: String, _ num2: String) -> Double {
        guard let anum = Double(num1), let bnum = Double(num2) else { return 0 }

        return anum / bnum
    }
}
