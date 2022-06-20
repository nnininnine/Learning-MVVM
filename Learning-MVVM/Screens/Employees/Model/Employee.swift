//
//  Employee.swift
//  Learning-MVVM
//
//  Created by Nuttapon Buaban on 20/6/2565 BE.
//

import Foundation

typealias Employees = [Employee]

// MARK: EmployeeModel

struct Employee: Codable {
    let id: String
    let employeeName: String
    let employeeSalary: String
    let employeeAge: String

    enum CodingKeys: String, CodingKey {
        case id
        case employeeName = "employee_name"
        case employeeSalary = "employee_salary"
        case employeeAge = "employee_age"
    }
}
