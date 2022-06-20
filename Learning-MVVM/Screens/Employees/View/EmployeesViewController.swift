//
//  EmployeesViewController.swift
//  Learning-MVVM
//
//  Created by 7Peaks on 17/6/2565 BE.
//

import Foundation
import UIKit

class EmployeesViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Initial Section

    func initVC() {
        // TableView setup
        tableView.register(EmployeeCell.nib(), forCellReuseIdentifier: EmployeeCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

    func initVM() {}
}

// MARK: UITableViewDelegate, UITableViewDataSource

extension EmployeesViewController: UITableViewDelegate, UITableViewDataSource {
    // delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    // datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeCell.identifier, for: indexPath) as? EmployeeCell else { fatalError("Xib does not exists.") }

        return cell
    }
}
