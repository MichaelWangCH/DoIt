//
//  TaskService.swift
//  DoIt
//
//  Created by Wang, Michael on 26/02/2017.
//  Copyright © 2017 MW. All rights reserved.
//

import UIKit

class TaskService: NSObject {
    func getTaskList() -> [Task] {
        let taskList = [Task(taskID: "1", taskName: "Complete coding the demo"),
                        Task(taskID: "2", taskName: "Finish reading the document")]

        return taskList
    }
}
