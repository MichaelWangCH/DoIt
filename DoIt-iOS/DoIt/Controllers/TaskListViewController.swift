//
//  TaskListViewController.swift
//  DoIt
//
//  Created by Wang, Michael on 26/02/2017.
//  Copyright © 2017 MW. All rights reserved.
//

import UIKit

class TaskListViewController: UIViewController {

    @IBOutlet weak var taskListTableView: UITableView!
    var taskList: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        taskList = TaskService().getTaskList()

        taskListTableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.cellReuseIdentifier)
        taskListTableView.estimatedRowHeight = 60
        taskListTableView.rowHeight = UITableViewAutomaticDimension
        taskListTableView.tableFooterView = UIView(frame: CGRect.zero)
        taskListTableView.dataSource = self
        taskListTableView.delegate = self
    }
}

extension TaskListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = taskList[indexPath.row].taskName

        return cell
    }
}

extension TaskListViewController: UITableViewDelegate {

}

extension UITableViewCell {
    static var cellReuseIdentifier: String {
        return String(describing: self)
    }
}
