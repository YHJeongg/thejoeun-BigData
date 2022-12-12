//
//  ViewController.swift
//  HelloWorld
//
//  Created by Jeong Yun Hyeon on 2022/11/21.
//

import UIKit

class ViewController: UIViewController {
    // Property, Field

    @IBOutlet weak var lblHello: UILabel!
    // Constructor
    
    var count: Int = 0
    var isKorean: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblHello.text = "안녕하세요"
    }
    
    @IBAction func btnHello(_ sender: UIButton) {
        // Method #1
//        if lblHello.text == "안녕하세요" {
//            lblHello.text = "Hello World!"
//        } else {
//            lblHello.text = "안녕하세요"
//        }
        
        // Method #2
//        if count % 2  == 0 {
//            lblHello.text = "Hello World!"
//        } else {
//            lblHello.text = "안녕하세요"
//        }
//        count += 1
        
        // Method #3
        if isKorean {
            lblHello.text = "Hello World!"
            isKorean = false
        } else {
            lblHello.text = "안녕하세요"
            isKorean = true
        }
    }
    
} // ViewController

