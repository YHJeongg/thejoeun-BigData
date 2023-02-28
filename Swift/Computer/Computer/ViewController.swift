//
//  ViewController.swift
//  Computer
//
//  Created by Jeong Yun Hyeon on 2023/02/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfSize: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfBag: UITextField!
    @IBOutlet weak var tfColor: UITextField!
    
    let pcName: String = "맥북프로"
    let pcSize: Int = 16
    let pcWeight: Double = 2.56
    let pcBag: Bool = false
    let pcColor: Character = "백"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tfName.text = pcName
        tfSize.text = String(pcSize)
        tfWeight.text = String(pcWeight)
        tfBag.text = String(pcBag)
        tfColor.text = String(pcColor)
    }
    
    @IBAction func btnOK(_ sender: UIButton) {
        tfName.text = pcName
        tfSize.text = String(pcSize)
        tfWeight.text = String(pcWeight)
        tfBag.text = String(pcBag)
        tfColor.text = String(pcColor)
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        tfName.text = ""
        tfSize.text = ""
        tfWeight.text = ""
        tfBag.text?.removeAll()
        tfColor.text?.removeAll()
    }
    
}

