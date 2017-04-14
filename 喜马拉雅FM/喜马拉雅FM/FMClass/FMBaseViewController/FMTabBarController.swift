//
//  FMTabBarController.swift
//  喜马拉雅FM
//
//  Created by vcyber on 17/4/11.
//  Copyright © 2017年 vcyber. All rights reserved.
//

import UIKit


class FMTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.tabBar.barTintColor = UIColor.white
        
        let homeViewController = HomeViewController(viewControllerClasses: [ FMRecommendViewController.self, FMHotViewController.self, FMCategoryViewController.self, FMRankingViewController.self, FMAnchorViewController.self ], andTheirTitles: [ "推荐", "热门", "分类", "榜单", "主播" ])
        homeViewController?.menuViewStyle = .line
        homeViewController?.menuHeight = 44
        homeViewController?.titleColorSelected = UIColor.orange
        homeViewController?.menuBGColor = UIColor.white
        homeViewController?.menuView?.scrollView.isScrollEnabled = false
        homeViewController?.menuItemWidth = 44
        homeViewController?.selectIndex = 1
        homeViewController?.pageAnimatable = false
        let homeNav = BaseNavigationController(rootViewController: homeViewController!);
        homeNav.navigationBar.shadowImage = UIImage()
        homeNav.navigationBar.setBackgroundImage(UIImage(), for: .default)
        setChildController(vc: homeNav, imageName: "tabbar_icon_homepage_normal", selectedImage: "tabbar_icon_homepage_pressed")
        
        let subscribeNav = BaseNavigationController(rootViewController: SubscribeViewController());
        setChildController(vc: subscribeNav, imageName: "tabbar_icon_Rss_normal", selectedImage: "tabbar_icon_Rss_pressed")
        
        let helpNav = BaseNavigationController(rootViewController: FMBaseViewController());
        setChildController(vc: helpNav, imageName: "", selectedImage: "")
        
        let findNav = BaseNavigationController(rootViewController: FindViewController());
        setChildController(vc: findNav, imageName: "tabbar_icon_find_normal", selectedImage: "tabbar_icon_find_pressed")
        
        let meNav = BaseNavigationController(rootViewController: MeViewController());
        setChildController(vc: meNav, imageName: "tabbar_icon_my_normal", selectedImage: "tabbar_icon_my_pressed")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setChildController(vc: UIViewController, imageName:String, selectedImage:String) -> Void {
        vc.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        vc.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(.alwaysOriginal)
        addChildViewController(vc)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destin ationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
