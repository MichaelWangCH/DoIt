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
    let refreshControl = UIRefreshControl()

    var taskList: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        taskListTableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.cellReuseIdentifier)
        taskListTableView.estimatedRowHeight = 60
        taskListTableView.rowHeight = UITableViewAutomaticDimension
        taskListTableView.tableFooterView = UIView(frame: CGRect.zero)
        taskListTableView.dataSource = self
        taskListTableView.delegate = self

        refreshControl.addTarget(self, action: #selector(refreshTaskList), for: .valueChanged)
        taskListTableView.addSubview(refreshControl)

        refreshTaskList()
    }

    func refreshTaskList() {
        TaskService().getTaskList(completion: { (taskList) in
            if let taskList = taskList {
                self.taskList = taskList
                self.taskListTableView.reloadData()
            }
        })

        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        }
    }

    @IBAction func addTask(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let navViewController = storyBoard.instantiateViewController(withIdentifier: "NavViewController") as! UINavigationController
        if let addTaskViewController = navViewController.childViewControllers.first as? AddTaskViewController {
            addTaskViewController.didDismiss = {
                self.refreshTaskList()
            }
        }

        self.present(navViewController, animated: true, completion: nil)
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
