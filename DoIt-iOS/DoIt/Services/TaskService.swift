//
//  TaskService.swift
//  DoIt
//
//  Created by Wang, Michael on 26/02/2017.
//  Copyright © 2017 MW. All rights reserved.
//

import UIKit
import Alamofire

class TaskService {
    static let sharedInstance = TaskService()

    func getTaskList(completion: @escaping ([Task]?) -> Void) {
        Alamofire.request("http://localhost:8080/tasks").responseJSON { (response) in
            if let jsonData = response.result.value as? [[String: AnyObject]] {
                completion(jsonData.flatMap(Task.init))
            } else {
                completion(nil)
            }
        }
    }
}
