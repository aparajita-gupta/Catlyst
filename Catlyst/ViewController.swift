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
    
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           navigationController?.navigationBar.prefersLargeTitles = true

           let appearance = UINavigationBarAppearance()
           
        appearance.backgroundColor = UIColor(red: 160/255.0, green: 191/255.0, blue: 138/255.0, alpha: 1.0)
           appearance.titleTextAttributes = [.foregroundColor: UIColor.blue]
           appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

           navigationController?.navigationBar.tintColor = .blue
           navigationController?.navigationBar.standardAppearance = appearance
           navigationController?.navigationBar.compactAppearance = appearance
           navigationController?.navigationBar.scrollEdgeAppearance = appearance
   }
    
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

