//
//  ViewController.swift
//  ServerImage_01
//
//  Created by Jeong Yun Hyeon on 2023/02/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnNo1(_ sender: UIButton) {
        let url = URL(string: "https://zeushahn.github.io/Test/images/dog.jpg")
        let defaultSession = Foundation.URLSession(configuration: .default)
        //task
        let task = defaultSession.dataTask(with: url!){(data,response,error) in
            if error != nil{
                print("Failed to download data")
            }else{
                print("Data is downloaded")
                DispatchQueue.main.async {
                    self.imgView.image = UIImage(data: data!)
                }
            }
        }
        task.resume()
    }
    
    @IBAction func btnNo2(_ sender: UIButton) {
        let url = URL(string: "https://zeushahn.github.io/Test/images/dog2.jpg")
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url!)
            DispatchQueue.main.async {
                self.imgView.image = UIImage(data: data!)
            }
        }
    }
}
