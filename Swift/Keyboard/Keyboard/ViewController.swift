//
//  ViewController.swift
//  Keyboard
//
//  Created by Jeong Yun Hyeon on 2023/02/18.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setKeyboardEvent()
    }

    // 아무곳이나 눌러 softkeyboard 지우기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func setKeyboardEvent() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillApper(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisApper(_ :)), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    @objc func keyboardWillApper(_ sender: NotificationCenter) {
        self.view.frame.origin.y = -150
    }
    
    @objc func keyboardWillDisApper(_ sender: NotificationCenter) {
        self.view.frame.origin.y = 0.0
    }
    
}
