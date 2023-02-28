//
//  ViewController.swift
//  ButtonName
//
//  Created by Jeong Yun Hyeon on 2023/02/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblSmile: UILabel!
    
    let smile1: String = "😀"
    let smile2: String = "🥰"
    let smile3: String = "🤪"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblSmile.text = ""
        view.backgroundColor = .green
    }

    @IBAction func btnSmile1(_ sender: UIButton) {
        lblSmile.text! += smile1
    }
    
    @IBAction func btnSmile2(_ sender: UIButton) {
        lblSmile.text?.append(smile2)
    }
    
    @IBAction func btnSmile3(_ sender: UIButton) {
        lblSmile.text! += smile3
    }
    
}

