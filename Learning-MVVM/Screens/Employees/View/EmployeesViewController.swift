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

    lazy var viewModel: EmployeesViewModel = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        initVC()
        initVM()
    }

    // MARK: Initial Section

    func initVC() {
        // TableView setup
        tableView.register(EmployeeCell.nib(), forCellReuseIdentifier: EmployeeCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

    func initVM() {
        viewModel.getEmployees()
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                if let self = self {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

// MARK: UITableViewDelegate, UITableViewDataSource

extension EmployeesViewController: UITableViewDelegate, UITableViewDataSource {
    // delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 158
    }

    // datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.employeeCellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeCell.identifier, for: indexPath) as? EmployeeCell else { fatalError("Xib does not exists.") }
        let cellViewModel = viewModel.getCellViewModel(at: indexPath)
        cell.cellViewModel = cellViewModel
        return cell
    }
}
