//
//  HTTPRequestHelper.swift
//  Learning-MVVM
//
//  Created by Nuttapon Buaban on 20/6/2565 BE.
//

import Foundation

class HTTPRequestHelper {
    // a singleton http request object

    static var shared: HTTPRequestHelper = {
        let instance = HTTPRequestHelper()

        return instance
    }()

    private init() {}

    func getReq(url: String, params: [String: String], headers: HTTPHeaderFields, complete: @escaping (Bool, Data?) -> Void) {
        guard var components = URLComponents(string: url) else { return }

        components.queryItems = params.map { key, value in
            URLQueryItem(name: key, value: value)
        }

        guard let url = components.url else { return }

        var req = URLRequest(url: url)
        req.httpMethod = HTTPMethods.GET.rawValue

        switch headers {
        case .application_json:
            req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        case .application_x_www_form_urlencoded:
            req.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        case .none:
            break
        }

        // .ephemeral prevent JSON from caching (They'll store in Ram and nothing on Disk)
        let config = URLSessionConfiguration.ephemeral
        let session = URLSession(configuration: config)
        session.dataTask(with: req) { data, response, error in
            guard error == nil else {
                print("Error: problem calling GET")
                print(error!)
                complete(false, nil)
                return
            }
            guard let data = data else {
                print("Error: did not receive data")
                complete(false, nil)
                return
            }
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                print("Error: HTTP request failed")
                complete(false, nil)
                return
            }
            complete(true, data)
        }.resume()
    }
}
