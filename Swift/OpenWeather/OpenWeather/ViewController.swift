//
//  ViewController.swift
//  OpenWeather
//
//  Created by Jeong Yun Hyeon on 2023/02/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfCity: UITextField!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblWeather: UILabel!
    @IBOutlet weak var lblTemperature: UILabel!
    @IBOutlet weak var lblMaxTemp: UILabel!
    @IBOutlet weak var lblMinTemp: UILabel!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        cleanUpLabel()
    }
    
    func cleanUpLabel() {
        tfCity.text = ""
        lblCity.text = ""
        lblWeather.text = ""
        lblTemperature.text = ""
        lblMaxTemp.text = ""
        lblMinTemp.text = ""
    }

    @IBAction func btnGetWeather(_ sender: Any) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
        
        let queryModel = QueryModel()
        queryModel.delegate = self
        queryModel.downloadItems(cityName: tfCity.text!)
    }
    
}

extension ViewController: QueryModelProtocol {
    func itemDownloaded(items: [DBModel]) {
        lblCity.text = items[0].r_name
        lblWeather.text = items[0].r_main
        lblTemperature.text = "\(Int(items[0].r_temp - 273.15))℃"
        lblMaxTemp.text = "최고온도 : \(Int(items[0].r_temp_max - 273.15))℃"
        lblMinTemp.text = "최저온도 : \(Int(items[0].r_temp_min - 273.15))℃"
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
}
