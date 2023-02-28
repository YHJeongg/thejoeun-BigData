//
//  DatailViewController.swift
//  Table
//
//  Created by Jeong Yun Hyeon on 2023/02/18.
//

import UIKit

class DatailViewController: UIViewController {

    @IBOutlet weak var lblItem: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    var receiveItem = ""
    var receiveImage = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblItem.text = receiveItem
        imgView.image = UIImage(named: receiveImage)
    }
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            detailView.receiveItem = dataArray[indexPath!.row].items
        }
    }
    */

}
