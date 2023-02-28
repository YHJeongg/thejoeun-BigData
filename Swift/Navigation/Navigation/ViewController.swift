//
//  ViewController.swift
//  Navigation
//
//  Created by Jeong Yun Hyeon on 2023/02/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var imgView: UIImageView!
    
    let imgOn = UIImage(named: "lamp_on.png")
    let imgOff = UIImage(named: "lamp_off.png")
    var isOn = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        tfMessage.text = Message.message
//        if Message.isOn {
//            imgView.image = imgOn
//        } else {
//            imgView.image = imgOff
//        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        Message.message = tfMessage.text!
//        Message.isOn = isOn
//        
//        if segue.identifier == "editButton" {
//            Message.location = "Segue: Use Button!"
//        } else {
//            Message.location = "Segue: Use BarButton!"
//        }
        
        let editViewController = segue.destination as! EditViewController
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "Segue: Use Button!"
        } else {
            editViewController.textWayValue = "Segue: Use BarButton!"
        }
        editViewController.textMessage = tfMessage.text!
        editViewController.isOn = isOn
        editViewController.delegate = self
    }
    

}

extension ViewController: EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String, isOnOff: Bool) {
        tfMessage.text = message
        isOn = isOnOff
        if isOn {
            imgView.image = imgOn
        } else {
            imgView.image = imgOff
        }
    }
    
}
