//
//  AddTaskViewController.swift
//  DoIt
//
//  Created by Wang, Michael on 28/02/2017.
//  Copyright © 2017 MW. All rights reserved.
//

import UIKit
import Alamofire

class AddTaskViewController: UIViewController {

    @IBOutlet weak var nameTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextView.becomeFirstResponder()
    }

    @IBAction func dismissPage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func saveTask(_ sender: Any) {
        if let name = nameTextView.text {
            let parameters = ["name": name]

            Alamofire.request("http://localhost:8080/tasks", method: .post, parameters: parameters).responseJSON { (response) in

                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
