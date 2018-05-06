//
//  MQConfiguration.swift
//  MobileQuake
//
//  Created by Priyanka Dileep on 17/02/2017.
//  Copyright © 2017 Priyanka. All rights reserved.
//

import Foundation


struct API {
    static let BaseURL = URL(string: "http://www.seismi.org/api/eqs/")!
    static var AuthenticatedBaseURL: URL {
        return BaseURL
    }
    
}
