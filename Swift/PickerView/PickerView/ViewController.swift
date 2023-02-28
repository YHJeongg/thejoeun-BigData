//
//  ViewController.swift
//  PickerView
//
//  Created by Jeong Yun Hyeon on 2023/02/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    
    let imageFileName = [
        "w1.jpg", "w2.jpg", "w3.jpg",
        "w4.jpg", "w5.jpg", "w6.jpg",
        "w7.jpg", "w8.jpg", "w9.jpg",
        "w10.jpg"
    ]
    var imageArray = [UIImage?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for i in 0..<imageFileName.count {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
        
        pickerImage.dataSource = self
        pickerImage.delegate = self
    }


}

extension ViewController: UIPickerViewDataSource {
    // PickerView의 컬럼 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 10
    }
    
    // PickerView의 Row 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    
}

extension ViewController: UIPickerViewDelegate {
//    // PickerView의 파일명 배치
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    // PickerView의 thumbnail 배치
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 20)
        return imageView
    }
    
    // 선택된 파일명을 이미지로 보이기
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
}
