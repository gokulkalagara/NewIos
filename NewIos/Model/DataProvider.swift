//
//  DataProvider.swift
//  NewIos
//
//  Created by Developer on 11/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

public class DataProvider: NSObject {
    
    

    
    public init(key: Int, params : [String: Any])
    {
        self.viewControllerKey = key
        self.params = params
    }

    public var viewControllerKey : Int!
    
    public var params : [String : Any]!
    
   
    
}
