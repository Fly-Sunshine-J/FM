//
//  FMPlayerViewController.swift
//  喜马拉雅FM
//
//  Created by vcyber on 17/4/13.
//  Copyright © 2017年 vcyber. All rights reserved.
//

import UIKit


class FMPlayerViewController: BaseNavigationController {
    
    lazy var playerView:FMPlayerView = {
        let temp = FMPlayerView(frame: CGRect.zero)
        self.view.addSubview(temp)
        temp.snp.makeConstraints({ (make) in
            make.bottom.equalTo(-6);
            make.centerX.equalTo(self.view)
            make.width.equalTo(65)
            make.height.equalTo(65)
        })
        return temp
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationBar.isHidden = true
        playerView.backgroundColor = UIColor.clear
        //playerView.contentImg.image = UIImage(named: "sound_waiting")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
