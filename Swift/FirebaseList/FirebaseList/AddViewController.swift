//
//  AddViewController.swift
//  FirebaseList
//
//  Created by Jeong Yun Hyeon on 2023/02/19.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var tfCode: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnInsert(_ sender: UIButton) {
        guard let code = tfCode.text else { return }
        guard let name = tfName.text else { return }
        guard let dept = tfDept.text else { return }
        guard let phone = tfPhone.text else { return }
        
        if !code.trimmingCharacters(in: .whitespaces).isEmpty {
            let insertModel = insertModel()
            let result = insertModel.insertItems(code: code, name: name, dept: dept, phone: phone)
            if result {
                let resultAlert = UIAlertController(title: "완료", message: "입력이 되었습니다.", preferredStyle: .alert)
                let onAction = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                    self.navigationController?.popViewController(animated: true)
                })
                
                resultAlert.addAction(onAction)
                present(resultAlert, animated: true)
            } else {
                let resultAlert = UIAlertController(title: "실패", message: "에러가 발생 되었습니다.", preferredStyle: .alert)
                let onAction = UIAlertAction(title: "OK", style: .default)
                
                resultAlert.addAction(onAction)
                present(resultAlert, animated: true)
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
