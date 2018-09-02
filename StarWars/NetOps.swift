//
//  NetOps.swift
//  StarWars
//
//  Created by Tomaz Golob on 03/09/2018.
//  Copyright © 2018 Columbae. All rights reserved.
//

import Alamofire

class NetOps {
    // MARK: - Init
    static let shared = NetOps()
    private init() { }
    
    struct Routes {
        private static var RootURL: String { return "http://private-84e428-starwars2.apiary-mock.com" }
        
        static var Planets: String { return RootURL + "/Planets" }
        static var Residents: String { return RootURL + "/Residents" }
    }
}

extension NetOps {
    
    /// Fetches the planet info.
    ///
    /// - Parameter planetID: The planet identifier.
    /// - Parameter result: The resulting planet info.
    func planetInfo(for planetID: Int,_ result: @escaping ([String: Any]?, _ error: NSError?) -> Void) {
        let parameters: [String: String] = [:]
        let route = "\(Routes.Planets)/\(planetID)"
        
        Alamofire.request(route, parameters: parameters).validate().responseJSON { response in
            guard let response = response.result.value as? [String: Any] else { return }
            
            result(response, nil)
        }
    }
    
    /// Fetches the resident info.
    ///
    /// - Parameter residentID: The resident identifier.
    /// - Parameter result: The resulting planet info.
    func residentInfo(for residentID: Int,_ result: @escaping ([String: Any]?, _ error: NSError?) -> Void) {
        let parameters: [String: String] = [:]
        let route = "\(Routes.Residents)/\(residentID)"
        
        Alamofire.request(route, parameters: parameters).validate().responseJSON { response in
            guard let response = response.result.value as? [String: Any] else { return }
            
            result(response, nil)
        }
    }
    
    /// Fetches the JSON from the given url and returns it.
    ///
    /// - Parameters:
    ///   - route: The JSON url.
    ///   - result: The resulting JSON.
    func fetchJSON(from route: String, result: @escaping ([String: Any]) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        Alamofire.request(route).validate().responseJSON { response in
            defer {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            guard let response = response.result.value as? [String: Any] else { return }
            
            result(response)
        }
    }
    
    func fetchImage(from route: String, result: @escaping (Data) -> Void) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        Alamofire.request(route).validate().responseData { response in
            defer {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
            guard let data = response.result.value else { return }
            
            result(data)
        }
    }
}
