//
//  AppMarco.swift
//  喜马拉雅FM
//
//  Created by vcyber on 17/4/11.
//  Copyright © 2017年 vcyber. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD
import BlocksKit
import MJExtension
import SDWebImage
import MJRefresh
import SnapKit



#if DEBUG
let API_URL = "aaa"
    
#else
let API_URL = "bbb"
#endif

let kNavigationBar_HEIGHT = 64

let kBigCellHeight = 120

/// 屏幕的宽高
let kSCREEN_WIDTH = UIScreen.main.bounds.size.width
let kSCREEN_HEIGHT = UIScreen.main.bounds.size.height

/// Document文件目录
let kDOCUMNET = NSSearchPathForDirectoriesInDomains(.documentationDirectory, .userDomainMask, true).first



/// 打印
///
/// - Parameters:
///   - message: 打印的信息
///   - function: 函数名
///   - line: 行数
func fmPrint<T>(_ message:T, function:String = #function, line:Int = #line) -> Void {
    #if DEBUG
        print("\(function) [\(line)]: \(message)")
    #endif
}


/// 喜马拉雅所需要的参数
let kTestClientId           = "b617866c20482d133d5de66fceb37da3"
let kTestClientSecret       = "4d8e605fa7ed546c4bcb33dee1381179"
let kTestCallbackURL        = "https://api.ximalaya.com/openapi-collector-app/get_access_token"
let kTestClientBundleId     = "com.test.sdkTest"
let kTestClientName         = "喜马拉雅FM"
let kTestClientScheme       = "XiMaLaYaFM"

