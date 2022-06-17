//
//  ShareViewController.swift
//  Catlyst
//
//  Created by amelia kerr on 6/17/22.
//

import UIKit

class ShareViewController: UIViewController {

    @IBOutlet weak var time: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        time.text = "\(hours)h \(minutes)m \(theSeconds)s"
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
