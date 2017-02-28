//
//  Task.swift
//  DoIt
//
//  Created by Wang, Michael on 26/02/2017.
//  Copyright © 2017 MW. All rights reserved.
//

import UIKit

struct Task {
    var taskID: String
    var taskName: String

    init(taskID: String, taskName: String) {
        self.taskID = taskID
        self.taskName = taskName
    }

    init?(json: [String: AnyObject]) {
        guard let id = json["id"] as? Int,
            let name = json["name"] as? String else {
            return nil
        }

        self.taskID = String(id)
        self.taskName = name
    }
}
