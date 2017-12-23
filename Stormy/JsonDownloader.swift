//
//  JsonDownloader.swift
//  Stormy
//
//  Created by Henry Moran on 12/19/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class JsonDownloader {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        self.init(configuration: .default)
    }
    
    
    typealias JSON = [String: AnyObject]
    
    typealias JSONTaskCompletionHandler = (JSON?, DarkSkyError?) -> Void
    
    func jsonTask(with request: URLRequest, completionHandler completion: @escaping JSONTaskCompletionHandler) -> URLSession {
        let task = session.dataTask(with: request) { data, response, error in
            
            // convert to HTTP Response
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                
                return
            }
            
            if httpResponse.statusCode == 200 {
                if let data == data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : AnyObject]
                        completion(json, nil)
                    } catch {
                        completion(nil, .jsonConversionFailure)
                    }
                } else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .responseUnsuccessful)
            }
        }
        
        return task
    }
}
