//
//  AppDelegate.swift
//  喜马拉雅FM
//
//  Created by vcyber on 17/4/11.
//  Copyright © 2017年 vcyber. All rights reserved.
//

import UIKit
import MBProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, XMLYAuthorizeDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let playerNav: FMPlayerViewController = FMPlayerViewController(rootViewController: FMTabBarController())
        
        window?.rootViewController = playerNav;
        
        application.beginReceivingRemoteControlEvents()
        self.becomeFirstResponder()
        
        XMLYAuthorize.shareInstance().initWithAppkey(kTestClientId, appSecret: kTestClientSecret, appRedirectUri: kTestCallbackURL, appPackageId: kTestClientBundleId, appName: kTestClientName, appScheme: kTestClientScheme, delegate: self)
        XMReqMgr.sharedInstance().registerXMReqInfo(withKey: kTestClientId, appSecret: kTestClientSecret)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    override func remoteControlReceived(with event: UIEvent?) {
        if event?.type != .remoteControl {
            return
        }
        
        if event?.subtype == .remoteControlPause {
            XMSDKPlayer.shared().pauseTrackPlay()
        }else if event?.subtype == .remoteControlPlay {
            XMSDKPlayer.shared().resumeTrackPlay()
        }else if event?.subtype == .remoteControlTogglePlayPause {
            XMSDKPlayer.shared().pauseTrackPlay()
        }
    }

}


//MARK: -XMLYAuthorizeDelegate

extension AppDelegate {
    func onAuthorizeSuccess(_ responseType: XmlyResponseType, responseData authorizeModel: XMLYAuthorizeModel!) {
        if .AuthorizeSuccess == responseType {
            MBProgressHUD.showAlertWithTextAndDelay("授权成功", 2)
        }else if .RefreshTokenSuccess == responseType {
            MBProgressHUD.showAlertWithTextAndDelay("刷新accesstoken成功", 2)
        }
    }
    
    
    func onAuthorizeFail(_ errorType: XmlyResponseType) {
        if .ErrorAuthorizeFail == errorType {
            MBProgressHUD.showAlertWithTextAndDelay("授权失败", 2)
        }
        else if .ErrorRefreshTokenFail == errorType {
            MBProgressHUD.showAlertWithTextAndDelay("刷新accesstoken失败", 2)
        }
    }
}





