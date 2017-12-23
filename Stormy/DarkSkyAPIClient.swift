//
//  DarkSkyAPIClient.swift
//  Stormy
//
//  Created by Henry Moran on 12/22/17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

class DarkSKyAPIClient {
    fileprivate let apiKey = "ea9b171400289d945fe35fcb185d982d"
    
    lazy var baseURL: URL = {
        return URL(string: "https://api.darksky.net/forecast/\(apiKey)/")!
    }()
    
    let downloader = JsonDownloader()
    
    typealias CurrentWeatherCompletionHandler = (CurrecntWeather?, DarkSkyError) -> Void
    
    func getCurrentWeather(at coordinate: Cooridinate, completionHandler completion: @escaping CurrentWeatherCompletionHandler)
}













