//
//  EmployeesService.swift
//  Learning-MVVM
//
//  Created by Nuttapon Buaban on 20/6/2565 BE.
//

import Foundation

protocol EmployeesServiceProtocol {
    func getEmployees(completion: @escaping (_ success: Bool, _ result: Employees?, _ error: String?) -> Void)
}

class EmployeeService: EmployeesServiceProtocol {
    func getEmployees(completion: @escaping (Bool, Employees?, String?) -> Void) {
        HTTPRequestHelper.shared.getReq(url: Constants.demoURL, params: [:], headers: .application_json) { success, data in
            if success {
                do {
                    let model = try JSONDecoder().decode(Employees.self, from: data!)
                    completion(true, model, nil)
                } catch let err {
                    completion(false, nil, err.localizedDescription)
                }
            } else {
                completion(false, nil, "Error: Get request failed")
            }
        }
    }
}
