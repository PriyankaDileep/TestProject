//
//  Parser.swift
//  MobileQuake
//
//  Created by Dileep on 23/02/2017.
//  Copyright © 2017 Priyanka. All rights reserved.
//

import Foundation

class Parser: MQTypeCheck{
   
func parseJson(data:Data)->[EarthQuake]
    {
        var earthQuakeArray :[EarthQuake] = []
        var jsonRecord: Dictionary<String,AnyObject>
        do {
            jsonRecord = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,AnyObject>
            
            if jsonRecord["earthquakes"] is [Dictionary<String,AnyObject>] {
                let earthQuakes =  returnNotNilArray(realValue: jsonRecord["earthquakes"])
                for earthQuake in earthQuakes {
                    earthQuakeArray.append(EarthQuake(earthQuakeData: earthQuake as! [String:AnyObject]))
                }
            }
        }
        catch  {
            
        }
        return earthQuakeArray as [EarthQuake]
    }
}
/*
func processJson(data: Data,completion:completionJson)
{
    var jsonRecord:Dictionary<String,AnyObject> = [:]
    do {
        jsonRecord = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,AnyObject>
        
        var earthQuakeList: [EarthQuake] = []
        
    } catch  {
       // completionJson([A], Error)
    }
}*/
/*
func parseJson(data:Data)->[EarthQuake]
{
    
    var jsonRecord: Dictionary<String,AnyObject>
    do {
        jsonRecord = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String,AnyObject>
        

    }
    catch  {
        
    }
    
    
    
}*/
