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
    
    func jsonTask(with request: URLRequest) -> URLSession {
        let task = session.dataTask(with: request) { data, response, error in
            
            // convert to HTTP Response
            guard let httpResponse = response as? HTTPURLResponse else {
                
            }
        }
        
        return task
    }
}
