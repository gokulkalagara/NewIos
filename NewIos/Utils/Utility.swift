//
//  Utility.swift
//  NewIos
//
//  Created by Developer on 08/06/18.
//  Copyright © 2018 PQ. All rights reserved.
//

import UIKit

public class Utility: NSObject
{


    public static func getColor(value : String) -> UIColor
    {
        switch value
        {
        case Constants.COLOR_PRIMARY:
            return UIColor(red:0.77, green:0.09, blue:0.17, alpha:1.0)
            
        case Constants.LIGHT_GRAY: // #c4c4c4
            return UIColor(red:0.77, green:0.77, blue:0.77, alpha:1.0)
            
        case Constants.THICK_GRAY: // #505050
            return UIColor(red:0.31, green:0.31, blue:0.31, alpha:1.0)

        case Constants.NORMAL_ORGANE:
            return UIColor(red:0.31, green:0.31, blue:0.31, alpha:1.0)

        case Constants.TEXT_COLOR: // #404040
            return UIColor(red:0.25, green:0.25, blue:0.25, alpha:1.0)

        case Constants.HASH_TEXT_COLOR: // #999999
            return UIColor(red:0.60, green:0.60, blue:0.60, alpha:1.0)

        case Constants.SUCCESS_GREEN:
            return UIColor(red:0.15, green:0.75, blue:0.38, alpha:1.0)
            
        case Constants.WHITE:
            return UIColor(red:1.00, green:1.00, blue:1.00, alpha:1.0)

        default:
            return UIColor(red:0.00, green:0.00, blue:0.00, alpha:1.0)
        }
    }
    
    public static func hideKeyword(view: UIView)
    {
        view.endEditing(true)
    }
    
    
}
