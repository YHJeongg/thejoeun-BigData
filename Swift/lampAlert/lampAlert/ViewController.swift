//
//  ViewController.swift
//  lampAlert
//
//  Created by Jeong Yun Hyeon on 2023/02/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    var imgOn = UIImage(named: "lamp_on.png")
    var imgOff = UIImage(named: "lamp_off.png")
    var imgRemove = UIImage(named: "lamp_remove.png")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = imgOn
    }
    
    @IBAction func btnOn(_ sender: UIButton) {
        
        if imgView.image == imgOn {
            let testAlert = UIAlertController(title: "경고", message: "현재 On상태입니다.", preferredStyle: .alert)
            //back button, UIAlertAction 설정, handler:nil이므로 그냥 아무 액션 없이 사라짐
            let actionDefault = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: {action in self.lampon()})
            
            
            //UIAlertController에 UIAlertAction 추가하기
            testAlert.addAction(actionDefault)
            
            //위에 정의한 것 최종적으로 show
            present(testAlert, animated: true)
        } else {
            let testAlert = UIAlertController(title: "램프 켜기", message: "램프를 키시겠습니까?", preferredStyle: .alert)
            
            //back button, UIAlertAction 설정, handler:nil이므로 그냥 아무 액션 없이 사라짐
            let actionDefault = UIAlertAction(title: "네", style: .default, handler: {action in self.lampon()})
            let actionDefault2 = UIAlertAction(title: "아니요", style: .default, handler: {action in self.lampCondition()})
            
            
            //UIAlertController에 UIAlertAction 추가하기
            testAlert.addAction(actionDefault)
            testAlert.addAction(actionDefault2)
            
            //위에 정의한 것 최종적으로 show
            present(testAlert, animated: true)
        }
        
    }
    
    
    @IBAction func btnOff(_ sender: UIButton) {
        
        if imgView.image == imgOff {
            let testAlert = UIAlertController(title: "경고", message: "현재 Off상태입니다.", preferredStyle: .alert)
            //back button, UIAlertAction 설정, handler:nil이므로 그냥 아무 액션 없이 사라짐
            let actionDefault = UIAlertAction(title: "네, 알겠습니다.", style: .default, handler: {action in self.lampCondition()})
            
            
            //UIAlertController에 UIAlertAction 추가하기
            testAlert.addAction(actionDefault)
            
            //위에 정의한 것 최종적으로 show
            present(testAlert, animated: true)
        } else {
            let testAlert = UIAlertController(title: "램프 끄기", message: "램프를 끄시겠습니까?", preferredStyle: .alert)
            
            //back button, UIAlertAction 설정, handler:nil이므로 그냥 아무 액션 없이 사라짐
            let actionDefault = UIAlertAction(title: "네", style: .default, handler: {action in self.lampCondition()})
            let actionDefault2 = UIAlertAction(title: "아니요", style: .default, handler: {action in self.lampon()})
            
            
            //UIAlertController에 UIAlertAction 추가하기
            testAlert.addAction(actionDefault)
            testAlert.addAction(actionDefault2)
            
            //위에 정의한 것 최종적으로 show
            present(testAlert, animated: true)
        }
        
    }
    
    func lampon(){
        imgView.image = imgOn
    }
    func lampCondition(){
        imgView.image = imgOff
    }
    func lampRemove(){
        imgView.image = imgRemove
    }
    
    
    @IBAction func btnRemove(_ sender: UIButton) {
        
        // UIAlertController 초기화
        let testAlert = UIAlertController(title: "램프 제거?", message: "램프를 제거 할까요?", preferredStyle: .alert)
        
        //back button, UIAlertAction 설정, handler:nil이므로 그냥 아무 액션 없이 사라짐
        let actionDefault = UIAlertAction(title: "아니오, 끕니다!", style: .default, handler: {action in
            self.lampCondition()
        })
        let actionDestructive = UIAlertAction(title: "아니오, 켭니다!", style: .destructive, handler: {ACTION in
            self.lampon()
        })
        let actionDestructive2 = UIAlertAction(title: "네 제거합니다.", style: .destructive, handler: {ACTION in
            self.lampRemove()
        })
        
        //UIAlertController에 UIAlertAction 추가하기
        testAlert.addAction(actionDefault)
        testAlert.addAction(actionDestructive)
        testAlert.addAction(actionDestructive2)
        
        //위에 정의한 것 최종적으로 show
        present(testAlert, animated: true)
        
    }
    
    
}
