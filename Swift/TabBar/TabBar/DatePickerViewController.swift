//
//  ViewController.swift
//  DatePicker
//
//  Created by Jeong Yun Hyeon on 2023/02/16.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    let interval = 1.0 // 시간 간격 1초
    let timeSelector: Selector = #selector(DatePickerViewController.updateTime)
    let formatter = DateFormatter()
    
    var count = 0
    var alarmTime: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblCurrentTime.text = ""
        lblPickerTime.text = ""
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss"
        lblPickerTime.text = "선택시간 : \(formatter.string(from: datePickerView.date))"
        
        formatter.dateFormat = "a hh:mm"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime() {
        let date = NSDate()
        
        count += 1
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd EEE a hh:mm:ss"
        lblCurrentTime.text = "현재시간 : \(formatter.string(from: date as Date))"
        
        formatter.dateFormat = "a hh:mm"
        let currentTime = formatter.string(from: date as Date)
        
        if alarmTime == currentTime {
            if count % 2 == 0 {
                view.backgroundColor = .yellow
            } else {
                view.backgroundColor = .green
            }
        } else {
            view.backgroundColor = .white
        }
    }
    
}
