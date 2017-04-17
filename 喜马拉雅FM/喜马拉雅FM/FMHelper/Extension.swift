//
//  Extension.swift
//  喜马拉雅FM
//
//  Created by vcyber on 17/4/11.
//  Copyright © 2017年 vcyber. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIFont {
    /// 创建字体
    ///
    /// - Parameter size: size
    /// - Returns: UIFont
    open static func fmFont(_ size:CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: size);
    }
}

extension UIColor {
    /// RBGColor
    ///
    /// - Parameters:
    ///   - red: red
    ///   - green: green
    ///   - blue: blue
    /// - Returns: UIColor
    open static func fmColor(_ red:CGFloat, _ green:CGFloat, _ blue:CGFloat) -> UIColor {
        return UIColor(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1)
    }
}

extension MBProgressHUD {
    
    open func hideLoading() -> Void {
        self.hide(animated: true);
    }
    
    open static func showSimpleLoading(inView:UIView = UIApplication.shared.keyWindow!) -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: inView, animated: true);
        hud.removeFromSuperViewOnHide = true
        return hud
    }
    
    open static func showLoadingWithText(inView:UIView = UIApplication.shared.keyWindow!, _ text:String?) -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: inView, animated: true)
        hud.removeFromSuperViewOnHide = true
        hud.label.text = text
        return hud
    }
    
    open static func showAlertWithText(inView:UIView = UIApplication.shared.keyWindow!, _ text:String?) -> Void {
        let hud = MBProgressHUD.showAdded(to: inView, animated: true)
        hud.mode = .text
        hud.removeFromSuperViewOnHide = true
        hud.label.text = text
        hud.hide(animated: true, afterDelay: 1)
    }
    
    open static func showAlertWithTextAndDelay(inView:UIView = UIApplication.shared.keyWindow!, _ text:String?, _ delay:TimeInterval = 0) -> Void {
        let hud = MBProgressHUD.showAdded(to: inView, animated: true)
        hud.removeFromSuperViewOnHide = true
        hud.label.text = text
        hud.mode = .text
        hud.hide(animated: true, afterDelay: delay)
    }
    
}



extension NSNotification.Name {

    public static let FMPlayerWillPlayNotification: NSNotification.Name = NSNotification.Name(rawValue: "FMPlayerWillPlayNotification")
    
    public static let FMPlayerDidStopNotification: NSNotification.Name = NSNotification.Name(rawValue: "FMPlayerDidStopNotification")
}






