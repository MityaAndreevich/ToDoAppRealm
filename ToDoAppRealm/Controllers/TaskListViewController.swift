//
//  TaskListViewController.swift
//  ToDoAppRealm
//
//  Created by Dmitry Logachev on 24.04.2022.
//

import UIKit

class TaskListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListCell", for: indexPath)

        return cell
    }

    private func addButtonPressed() {
        showAlert()
    }
}

extension TaskListViewController {
    
    private func showAlert() {
        let alert = UIAlertController.createAlert(withTitle: "New List", andMessage: "Please, insert new value")
        
        alert.action { newValue in
            
        }
        
        present(alert, animated: true)
    }
}
