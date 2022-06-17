//
//  ViewController.swift
//  Catlyst
//
//  Created by Aparajita Gupta on 6/14/22.
//

import UIKit
public var inputTime = ""
public var seconds = 0
class ViewController: UIViewController {

    @IBAction func unwindToHomeVC(sender: UIStoryboardSegue){
        
    }
    @IBOutlet weak var question: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func submitButtonTapped(_ sender: UIButton) {
        if let newTitle = textField.text {
//            inputTime = Int(newTitle) ?? 0
            inputTime = newTitle
            let timerInfo = textField.text
            do {
                seconds =  try timeToSeconds(for: timerInfo ?? "")
            } catch {
                print("failed")
            }
        }
    }
    
}

