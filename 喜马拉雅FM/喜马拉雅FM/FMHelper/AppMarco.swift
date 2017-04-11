//
//  AppMarco.swift
//  喜马拉雅FM
//
//  Created by vcyber on 17/4/11.
//  Copyright © 2017年 vcyber. All rights reserved.
//

import Foundation
import UIKit

let kNavigationBar_HEIGHT = 64

let kBigCellHeight = 120

let kSCREEN_WIDTH = UIScreen.main.bounds.size.width
let kSCREEN_HEIGHT = UIScreen.main.bounds.size.height

let kDOCUMNET = NSSearchPathForDirectoriesInDomains(.documentationDirectory, .userDomainMask, true).first


func fmColor(_ red:CGFloat, _ green:CGFloat, _ blue:CGFloat) -> UIColor {
    return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1)
}

func fmFont(_ size:CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size);
}

func fmPrint<T>(_ message:T, function:String = #function, line:Int = #line) -> Void {
    #if DEBUG
        print("\(function) [\(line)]: \(message)")
    #endif
}

#if DEBUG
let API_URL = "aaa"
    
#else
let API_URL = "bbb"
#endif
