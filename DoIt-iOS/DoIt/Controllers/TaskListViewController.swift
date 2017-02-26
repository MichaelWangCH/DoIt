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

    override func viewDidLoad() {
        super.viewDidLoad()

        taskListTableView.estimatedRowHeight = 60
        taskListTableView.rowHeight = UITableViewAutomaticDimension
        taskListTableView.dataSource = self
        taskListTableView.delegate = self
        taskListTableView.register(UITableViewCell.self, forCellReuseIdentifier: "")
    }
}

extension TaskListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension TaskListViewController: UITableViewDelegate {

}
