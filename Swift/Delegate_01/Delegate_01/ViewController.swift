//
//  ViewController.swift
//  Delegate_01
//
//  Created by Jeong Yun Hyeon on 2023/02/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfInput: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = ""
        tfInput.delegate = self
    }

    @IBAction func btnOK(_ sender: UIButton) {
        lblResult.text = tfInput.text
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        lblResult.text = tfInput.text
        return true
    }
}
