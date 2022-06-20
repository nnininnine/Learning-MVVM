//
//  EmployeesViewModel.swift
//  Learning-MVVM
//
//  Created by Nuttapon Buaban on 20/6/2565 BE.
//

import Foundation

class EmployeesViewModel {
    // MARK: Properties

    private var employeesService: EmployeesServiceProtocol
    var reloadTableView: (() -> Void)?
    var employees: Employees = .init()
    var employeeCellViewModels = [EmployeeCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }

    // MARK: Init

    init(employeesService: EmployeesServiceProtocol = EmployeeService()) {
        self.employeesService = employeesService
    }

    // MARK: Methods

    func getEmployees() {
        employeesService.getEmployees { success, result, err in
            if success, let employees = result {
                // call fetch data func.
                self.fetch(employees)
            } else {
                print(err ?? "")
            }
        }
    }

    func fetch(_ employees: Employees) {
        self.employees = employees // Cache
        var vms: [EmployeeCellViewModel] = []
        for employee in employees {
            vms.append(createCellModel(employee))
        }
        employeeCellViewModels = vms
    }

    func createCellModel(_ employee: Employee) -> EmployeeCellViewModel {
        let id = employee.id
        let name = employee.employeeName
        let salary = "$ " + employee.employeeSalary
        let age = employee.employeeAge

        return EmployeeCellViewModel(id: id, name: name, salary: salary, age: age)
    }

    func getCellViewModel(at indexPath: IndexPath) -> EmployeeCellViewModel {
        return employeeCellViewModels[indexPath.row]
    }
}
