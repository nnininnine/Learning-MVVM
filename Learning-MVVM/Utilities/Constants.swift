//
//  Constants.swift
//  Learning-MVVM
//
//  Created by Nuttapon Buaban on 20/6/2565 BE.
//

import Foundation

enum Constants {
    static let demoURL = "https://raw.githubusercontent.com/johncodeos-blog/MVVMiOSExample/main/demo.json"
}

enum HTTPHeaderFields {
    case application_json
    case application_x_www_form_urlencoded
    case none
}

enum HTTPMethods: String {
    case POST, GET, PUT, DELETE, PATCH
}
