//
//  DetailViewController.swift
//  SQLite
//
//  Created by Jeong Yun Hyeon on 2023/02/19.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var tfId: UITextField!
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfDept: UITextField!
    @IBOutlet weak var tfPhone: UITextField!
    
    var receiveId = 0
    var receiveName = ""
    var receiveDept = ""
    var receivePhone = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tfId.text = String(receiveId)
        tfName.text = String(receiveName)
        tfDept.text = String(receiveDept)
        tfPhone.text = String(receivePhone)
    }
    
    @IBAction func btnUpdate(_ sender: Any) {
        let studentsDB = StudentsDB()
        guard let id = Int(tfId.text!) else { return }
        guard let name = tfName.text else { return }
        guard let dept = tfDept.text else { return }
        guard let phone = tfPhone.text else { return }
        
        let result = studentsDB.updateDB(id: id, name: name, dept: dept, phone: phone)
        if result {
            let resultAlert = UIAlertController(title: "완료", message: "수정이 되었습니다.", preferredStyle: .alert)
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
    
    @IBAction func btnDelete(_ sender: Any) {
        let studentsDB = StudentsDB()
        guard let id = Int(tfId.text!) else { return }
        
        let result = studentsDB.deleteDB(id: id)
        if result {
            let resultAlert = UIAlertController(title: "완료", message: "삭제가 되었습니다.", preferredStyle: .alert)
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
