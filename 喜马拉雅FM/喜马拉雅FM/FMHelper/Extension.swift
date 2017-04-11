//
//  Extension.swift
//  喜马拉雅FM
//
//  Created by vcyber on 17/4/11.
//  Copyright © 2017年 vcyber. All rights reserved.
//

import Foundation
import UIKit

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
