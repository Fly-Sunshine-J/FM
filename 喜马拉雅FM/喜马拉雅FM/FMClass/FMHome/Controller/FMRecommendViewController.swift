//
//  FMRecommendViewController.swift
//  喜马拉雅FM
//
//  Created by vcyber on 17/4/13.
//  Copyright © 2017年 vcyber. All rights reserved.
//

import UIKit

class FMRecommendViewController: FMBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        XMReqMgr.sharedInstance().requestXMData(.albumsGuessLike, params:[ "like_count" : 10 ]) { (data, error) in
            if error != nil {
                
            }
        }
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

extension FMRecommendViewController {
    
}
