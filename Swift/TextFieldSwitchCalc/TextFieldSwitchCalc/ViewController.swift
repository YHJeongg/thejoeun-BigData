//
//  ViewController.swift
//  TextFieldSwitchCalc
//
//  Created by Jeong Yun Hyeon on 2023/02/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfNum1: UITextField!
    @IBOutlet weak var tfNum2: UITextField!
    @IBOutlet weak var switchAdd: UISwitch!
    @IBOutlet weak var switchSub: UISwitch!
    @IBOutlet weak var switchMulti: UISwitch!
    @IBOutlet weak var switchDiv: UISwitch!
    @IBOutlet weak var tfAdd: UITextField!
    @IBOutlet weak var tfSub: UITextField!
    @IBOutlet weak var tfMulti: UITextField!
    @IBOutlet weak var tfDiv: UITextField!
    
    var swAddstate = true
    var swSubstate = true
    var swMulstate = true
    var swDivstate = true
    
    let calculation = Calculation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnCalc(_ sender: UIButton) {
        
        if(swAddstate) {
            let resultAdd = calculation.add(tfNum1.text!, tfNum2.text!)
            tfAdd.text = String(resultAdd)
        }
        
        if(swSubstate) {
            let resultSub = calculation.sub(tfNum1.text!, tfNum2.text!)
            tfSub.text = String(resultSub)
        }
        
        if(swMulstate) {
            let resultMulti = calculation.multi(tfNum1.text!, tfNum2.text!)
            tfMulti.text = String(resultMulti)
        }
        
        if(swDivstate) {
            let resultDiv = calculation.div(tfNum1.text!, tfNum2.text!)
            tfDiv.text = String(resultDiv)
        }
        
    }
        
        
    @IBAction func swAdd(_ sender: UISwitch) {
            if sender.isOn {
                swAddstate = true
            } else {
                swAddstate = false
            }
        }
    @IBAction func swSub(_ sender: UISwitch) {
            if sender.isOn {
                swSubstate = true
            } else {
                swSubstate = false
            }
        }
    @IBAction func swMul(_ sender: UISwitch) {
            if sender.isOn {
                swMulstate = true
            } else {
                swMulstate = false
            }
        }
    @IBAction func swDiv(_ sender: UISwitch) {
            if sender.isOn {
                swDivstate = true
            } else {
                swDivstate = false
            }
        }
    
    
    @IBAction func btnClear(_ sender: UIButton) {
        tfNum1.text = ""
        tfNum2.text?.removeAll()
        tfAdd.text?.removeAll()
        tfSub.text?.removeAll()
        tfMulti.text?.removeAll()
        tfDiv.text?.removeAll()
    }
    
    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

