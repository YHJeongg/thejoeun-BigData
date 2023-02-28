//
//  EditViewController.swift
//  Navigation
//
//  Created by Jeong Yun Hyeon on 2023/02/18.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String, isOnOff: Bool)
}

class EditViewController: UIViewController {

    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var lblOnOff: UILabel!
    @IBOutlet weak var swIsOn: UISwitch!
    
//    var isOn: Bool = Message.isOn
    
    var textWayValue: String = ""
    var textMessage: String = ""
    var isOn: Bool = false
    var delegate: EditDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        lblLocation.text = Message.location
//        tfMessage.text = Message.message
//
//        swIsOn.isOn = isOn
//        if isOn {
//            lblOnOff.text = "On"
//        } else {
//            lblOnOff.text = "Off"
//        }
        
        lblLocation.text = textWayValue
        tfMessage.text = textMessage
        swIsOn.isOn = isOn
        if isOn {
            lblOnOff.text = "On"
        } else {
            lblOnOff.text = "Off"
        }
}
    
    @IBAction func btnDone(_ sender: UIButton) {
//        Message.message = tfMessage.text!
//        Message.isOn = isOn
//        navigationController?.popViewController(animated: true)
        delegate?.didMessageEditDone(self, message: tfMessage.text!, isOnOff: isOn)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
            lblOnOff.text = "On"
        } else {
            isOn = false
            lblOnOff.text = "Off"
        }
    }
    
}
