//
//  ViewController.swift
//  Hello
//
//  Created by Jeong Yun Hyeon on 2023/02/07.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblHello: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initLabel()
    }

    func initLabel() {
        lblHello.text = "jkernakhnorejkenrakjnfklaenklfnelknadswklndkvlsnklvadfkj1234nvdsndfskldfkl"
    }
    
}

