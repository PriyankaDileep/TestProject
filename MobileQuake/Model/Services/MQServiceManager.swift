//
//  MQServiceManager.swift
//  MobileQuake
//
//  Created by Priyanka Dileep on 17/02/2017.
//  Copyright © 2017 Priyanka. All rights reserved.
//

import Foundation

enum MQServiceManagerError: Error {
   
    case Unknown
    case FailedRequest
    case InvalidResponse
}

final class MQServiceManager: MQTypeCheck{
    
    typealias EarthQuakeDataCompletion = ([EarthQuake]?, MQServiceManagerError?) -> ()
    let baseURL: URL
    
    // MARK: - Initialization
    
    init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    // MARK: - Requesting Data
    
   func fetchEarthQuakeData(completion: @escaping EarthQuakeDataCompletion) {
        // Create URL
        let URL = baseURL
        // Create Data Task
        URLSession.shared.dataTask(with: URL) { (data, response, error) in
            self.didFetchEarthQuakeData(data: data, response: response, error: error, completion: completion)
            }.resume()
    }
    
   
    
    // MARK: - Helper Methods for fetching and Parsing
    
    private func didFetchEarthQuakeData(data: Data?, response: URLResponse?, error: Error?, completion: EarthQuakeDataCompletion) {
        if let _ = error {
            completion(nil, .FailedRequest)
            
        } else if let data = data, let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                processEarthQuakeData(data: data, completion: completion)
            } else {
                completion(nil, .FailedRequest)
            }
            
        } else {
            completion(nil, .Unknown)
        }
    }
    
    //Parse the JSON Data into swift Dictionary
    private func processEarthQuakeData(data: Data, completion: EarthQuakeDataCompletion) {
        //var jsonRecord : Dictionary<String,AnyObject> = [:]
        do {
           /* jsonRecord = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,AnyObject>
            
            var earthQuakeList : [EarthQuake] = []
            
            if jsonRecord["earthquakes"] is [Dictionary<String,AnyObject>] {
                let earthQuakes =  returnNotNilArray(realValue: jsonRecord["earthquakes"])
                for earthQuake in eart/hQuakes {
                    earthQuakeList.append(EarthQuake(earthQuakeData: earthQuake as! [String:AnyObject]))
                }
            }*/
            var earthQuakeList : [EarthQuake] = []
            let parser = Parser()
            earthQuakeList = parser.parseJson(data: data)
            completion(earthQuakeList as [EarthQuake], nil)
        } catch {
            completion(nil, .InvalidResponse)
        }
        
    }
    
}
