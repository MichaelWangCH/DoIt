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
    var didDismiss: () -> () = {}

    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextView.becomeFirstResponder()
    }

    @IBAction func dismissPage(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func saveTask(_ sender: Any) {
        if let name = nameTextView.text {
            TaskService.sharedInstance.saveTask(name: name, completion: { 
                self.dismiss(animated: true, completion: nil)

                self.didDismiss()
            })
        }
    }
}
