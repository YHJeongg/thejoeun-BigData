//
//  ViewController.swift
//  Quiz32
//
//  Created by Jeong Yun Hyeon on 2023/02/09.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfNum1: UITextField!
    @IBOutlet weak var tfNum2: UITextField!
    @IBOutlet weak var lblMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCalc(_ sender: UIButton) {
        // 입력을 안했을 경우 기본값 0으로 대체하여 계산하기
        let numNum1 = Int(tfNum1.text!) ?? 0
        let numNum2 = Int(tfNum2.text!) ?? 0
        
        // 숫자 크기 비교하여 순서 정하기
        var num1st: Int
        var num2nd: Int
        
        if numNum1 > numNum2 {
            num1st = numNum2
            num2nd = numNum1
        } else {
            num1st = numNum1
            num2nd = numNum2
        }
        
        // 범위 합계 구하기
        var totalNum = 0 // 누적변수
        
        for i in num1st...num2nd {
            totalNum += i
        }
        
        lblMessage.text = "숫자의 합계는 \(totalNum) 입니다."
    }
    
}

