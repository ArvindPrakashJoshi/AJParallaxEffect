//
//  Constant.swift
//  Moreover
//
//  Created by Arvind Joshi on 05/06/15.
//  Copyright (c) 2015 Arvind Joshi. All rights reserved.
//

import Foundation
import UIKit

let kScreenWidth = UIScreen.mainScreen().bounds.size.width
let kScreenHeight = UIScreen.mainScreen().bounds.size.height
let kScreenBounds: CGRect = UIScreen.mainScreen().bounds
let kAppDelegate = UIApplication.sharedApplication().delegate

extension UIDevice{

    public class var isPhone: Bool {
        return (UIDevice.currentDevice().userInterfaceIdiom == .Phone)
    }
    
    public class var isIPhone4: Bool {
        return UIDevice.isPhone && kScreenHeight < 568.0
    }
    public class var isIPhone5: Bool {
        return UIDevice.isPhone && kScreenHeight == 568.0
    }
    public class var isIPhone6: Bool {
        return UIDevice.isPhone && kScreenHeight == 667.0
    }
    public class var isIPhone6Plus: Bool {
        return UIDevice.isPhone && kScreenHeight == 736.0
    }
    
}




