//
//  AddViewController.swift
//  Table
//
//  Created by Jeong Yun Hyeon on 2023/02/18.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var tfAddItem: UITextField!
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    
    let imageFileName = [
        "cart.png", "clock.png", "pencil.png"
    ]
    var imageArray = [UIImage?]()
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0..<imageFileName.count {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image)
        }
        
        imageView.image = imageArray[count]
        
        pickerImage.dataSource = self
        pickerImage.delegate = self
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        if tfAddItem.text!.trimmingCharacters(in: .whitespaces).isEmpty{
            Message.check = "Old"
        } else {
            Message.check = "New"
            Message.item = tfAddItem.text!
            Message.itemsImageFile = imageFileName[count]
        }
       
        navigationController?.popViewController(animated: true)
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


extension AddViewController: UIPickerViewDataSource {
    // PickerView의 컬럼 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // PickerView의 Row 개수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    
    
}

extension AddViewController: UIPickerViewDelegate {
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
        imageView.image = imageArray[row]
        count = row
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40
    }
}
