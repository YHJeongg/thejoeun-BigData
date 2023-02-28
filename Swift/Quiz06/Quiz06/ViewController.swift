//
//  ViewController.swift
//  Quiz06
//
//  Created by Jeong Yun Hyeon on 2023/02/14.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var prevButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var imgView2: UIImageView!
    
    var numImage = 0
    var numImage2 = 1
    var imageName = [
        "flower_01.png", "flower_02.png",
        "flower_03.png", "flower_04.png",
        "flower_05.png", "flower_06.png"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayImage()
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if sender == prevButton {
            numImage -= 1
            numImage2 -= 1
            if numImage < 0 {
                numImage = imageName.count - 1
            }
            if numImage2 < 0 {
                numImage2 = imageName.count - 1
            }
        } else {
            numImage += 1
            numImage2 += 1
            if numImage >= imageName.count {
                numImage = 0
            }
            if numImage2 >= imageName.count {
                numImage2 = 0
            }
        }
        displayImage()
    }
    
    func displayImage() {
        imgTitle.text = imageName[numImage]
        imgView.image = UIImage(named: imageName[numImage])
        imgView2.image = UIImage(named: imageName[numImage2])
    }
    
}

