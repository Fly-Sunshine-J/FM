//
//  FMBaseViewController.swift
//  喜马拉雅FM
//
//  Created by vcyber on 17/4/13.
//  Copyright © 2017年 vcyber. All rights reserved.
//

import UIKit
import MJRefresh

class FMBaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    lazy var tableView:UITableView = {
        let temp = UITableView(frame: CGRect.zero, style: .plain)
        temp.delegate = self
        temp.dataSource = self
        self.view.addSubview(temp)
        return temp
    }()
    
    lazy var dataSource:[Any] = Array()
    
    lazy var page:Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
// MARK: - TableViewDataSource
extension FMBaseViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CELL")
        }
        return cell!
    }
}

// MARK: - MJRefresh
extension FMBaseViewController {
    open func createRefresh() -> Void {
        let header: MJRefreshNormalHeader = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(refresh))
        tableView.mj_header = header
        let footer:MJRefreshAutoNormalFooter = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(getMore))
        tableView.mj_footer = footer
    }
    
    open func refresh() -> Void {
        
    }
    
    open func getMore() -> Void {
        
    }
    
    open func endRefresh() -> Void {
        tableView.mj_header.endRefreshing()
        tableView.mj_footer.endRefreshing()
    }
}
