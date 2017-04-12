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

extension UIView {
    
    var x:CGFloat {
        get {
            return self.frame.origin.x
        }
        
        set {
            self.frame = CGRect(x: newValue, y: self.y, width: self.width, height: self.height)
        }
    }
    
    var y:CGFloat {
        get {
            return self.frame.origin.y
        }
        
        set {
            self.frame = CGRect(x: self.x, y: newValue, width: self.width, height: self.height)
        }
    }
    
    var width:CGFloat {
        get {
            return self.frame.size.width
        }
        
        set {
            self.frame = CGRect(x: self.x, y: self.y, width: newValue, height: self.height)
        }
    }
    
    var height:CGFloat {
        get {
            return self.frame.size.height
        }
        
        set {
            self.frame = CGRect(x: self.x, y: self.y, width: self.width, height: newValue)
        }
    }
    
    var centerX:CGFloat{
        get {
            return self.center.x
        }
        
        set {
            self.center = CGPoint(x: newValue, y: self.centerY)
        }
    }
    
    var centerY:CGFloat{
        get {
            return self.center.y
        }
        
        set {
            self.center = CGPoint(x: self.centerX, y: newValue)
        }
    }
    
    var size:CGSize{
        get {
            return self.frame.size
        }
        
        set {
            self.frame = CGRect(x: self.x, y: self.y, width: newValue.width, height: newValue.height)
        }
    }
    
    
    var origin:CGPoint{
        get {
           return self.frame.origin
        }
        
        set {
            self.frame = CGRect(x: newValue.x, y: newValue.y, width: self.width, height: self.height)
        }
    }
    
}

extension MBProgressHUD {
    
    func hideLoading() -> Void {
        self.hide(animated: true);
    }
    
    func showSimpleLoading(inView:UIView = UIApplication.shared.keyWindow!) -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: inView, animated: true);
        hud.removeFromSuperViewOnHide = true
        return hud
    }
    
    func showLoadingWithText(inView:UIView = UIApplication.shared.keyWindow!, text:String?) -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: inView, animated: true)
        hud.removeFromSuperViewOnHide = true
        hud.label.text = text
        return hud
    }
    
    func showAlertWithText(inView:UIView = UIApplication.shared.keyWindow!, text:String?) -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: inView, animated: true)
        hud.mode = .text
        hud.removeFromSuperViewOnHide = true
        hud.label.text = text
        return hud
    }
    
    func showLoadingWithTextAndDelay(inView:UIView = UIApplication.shared.keyWindow!, text:String?, delay:TimeInterval = 0) -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: inView, animated: true)
        hud.removeFromSuperViewOnHide = true
        hud.label.text = text
        hud.hide(animated: true, afterDelay: delay)
        return hud
    }
    
}






