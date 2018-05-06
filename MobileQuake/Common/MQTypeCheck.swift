//
//  TypeCheck.swift
//  MobileQuake
//
//  Created by Priyanka Dileep on 17/02/17.
//  Copyright © 2017 Priyanka. All rights reserved.
//

import Foundation

protocol MQTypeCheck {
    func returnNotNilString(realValue:AnyObject?) -> String
    func returnNotNilArray(realValue:AnyObject?) -> Array<AnyObject>
    func returnNotNilDictionary(realValue:AnyObject?) -> Dictionary<String,AnyObject>
}

extension MQTypeCheck {
    
    func returnNotNilString(realValue:AnyObject?) -> String {
        guard let value = realValue else {
            return ""
        }
        if value is String {
            return value as! String
        } else {
            return ""
        }
    }
    
    
    func returnNotNilDictionary(realValue:AnyObject?) -> Dictionary<String,AnyObject> {
        
        guard let value = realValue else {
            return [:]
        }
        
        if value is Dictionary<String,AnyObject> {
            return value as! Dictionary<String,AnyObject>
        } else {
            return [:]
        }
    }
    
    
    func returnNotNilArray(realValue:AnyObject?) -> Array<AnyObject> {
        
        guard let value = realValue else {
            return []
        }
        
        if value is Array<AnyObject> {
            return value as! Array<AnyObject>
        } else {
            return []
        }
    }
}
