//
//  ViewController.swift
//  Calc
//
//  Created by Jeong Yun Hyeon on 2023/02/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfNum1: UITextField!
    @IBOutlet weak var tfNum2: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnAdd(_ sender: Any) {
        let calculation = Calculation()
        
//        guard let num1 = tfNum1.text else { return }
//        guard let num2 = tfNum2.text else { return }
        
        let result = calculation.add(tfNum1.text!, tfNum2.text!)
        lblResult.text = "덧셈 결과는 \(result) 입니다."
    }
    
}

