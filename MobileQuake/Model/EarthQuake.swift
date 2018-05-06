//
//  EarthQuake.swift
//  MobileQuake
//
//  Created by Priyanka Dileep on 17/02/2017.
//  Copyright © 2017 Priyanka. All rights reserved.
//

import Foundation

struct EarthQuake : MQTypeCheck {
    
    var dateAndTime: Date!
    var location: String!
    var latitude: Double!
    var longitude: Double!
    var magnitude: String!
    var region: String!
    
    init(earthQuakeData: [String: AnyObject]) {
        
        
        location = returnNotNilString(realValue: earthQuakeData["region"])
        dateAndTime = convertStringToDate(dateInString: returnNotNilString(realValue: earthQuakeData["timedate"]))
        latitude = Double(returnNotNilString(realValue: earthQuakeData["lat"]))
        longitude = Double(returnNotNilString(realValue: earthQuakeData["lon"]))
        magnitude = returnNotNilString(realValue: earthQuakeData["magnitude"])
        region = returnNotNilString(realValue:  earthQuakeData["region"])
        
    }
    
    
    func convertStringToDate(dateInString:String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd HH:mm:ss"
        
        return dateFormatter.date(from: dateInString)!
    }
}
