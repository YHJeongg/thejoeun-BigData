//
//  ViewController.swift
//  imageBMIPickerView
//
//  Created by Jeong Yun Hyeon on 2023/02/18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var height: [Int] = []
    var weight: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = ""
        imageView.image = UIImage(named: "bmi.png")
        
        createData()
        pickerView.dataSource = self
        pickerView.delegate = self
        
        // PickerView의 초기값 Setting
        pickerView.selectRow(54, inComponent: 0, animated: true)
        pickerView.selectRow(35, inComponent: 1, animated: true)
    }

    func createData() {
        for i in 100...200 {
            height.append(i)
        }
        
        for i in 20...200 {
            weight.append(i)
        }
    }
    
} // ViewController End

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return 101
        } else {
            return 101
        }
    }
    
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return String(height[row])
        } else {
            return String(weight[row])
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        var height1: Double = 0.0
        var weight1: Double = 0.0 
        if component == 0 {
            height1 = Double(height[row])
        } else {
            weight1 = Double(weight[row])
        }
        lblResult.text = String(weight1 / ((height1 / 100) * (height1 / 100)))
    }
    
}
