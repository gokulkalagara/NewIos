//
//  Logger.swift
//  NewIos
//
//  Created by Developer on 09/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

public class Logger: NSObject {
    
    public static let debug : Bool = true
    
    public static func log(data: Any...)
    {
        if debug == true
        {
         print(data)
        }
    }
}
