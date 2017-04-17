//
//  FMRecommendViewController.swift
//  喜马拉雅FM
//
//  Created by vcyber on 17/4/13.
//  Copyright © 2017年 vcyber. All rights reserved.
//

import UIKit
import MBProgressHUD
import MJExtension

class FMRecommendViewController: FMBaseViewController {
    
    fileprivate var isPull = true
    fileprivate var lastOffsetY:CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.register(FMRecommendCell.self, forCellReuseIdentifier: NSStringFromClass(FMRecommendCell.self))
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        createRefresh()
        getData()
    }
    
    fileprivate func getData() -> Void {
        let hud = MBProgressHUD.showLoadingWithText(inView: view, "正在加载")
        ApplyService.getRequest(urlString: "http://ifm.ximalaya.com/recsys-stream-query/recsys/stream/feed?device=iPhone", completeBlock: { (data) in
            hud.hideLoading()
            let array = data["data"] as! Array<Dictionary<String, Any>>
            for dict in array {
                let model = FMRecommendModel.mj_object(withKeyValues:dict)
                if self.isPull {
                    self.dataSource.insert(model!, at: 0)
                }else {
                    self.dataSource.append(model!)
                }
            }
            self.tableView.reloadData()
            self.endRefresh()
        }) { (error) in
            hud.hideLoading()
            print(error)
            self.endRefresh()
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

// MARK: - UITableViewDelegate UITableViewDataSource
extension FMRecommendViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:FMRecommendCell = tableView.dequeueReusableCell(withIdentifier: NSStringFromClass(FMRecommendCell.self)) as! FMRecommendCell
        cell.btnClickCallBack = {(section) -> Void in
            print(section)
        }
        let model = dataSource[indexPath.section] as! FMRecommendModel
        cell.configCell(model: model, indexPath: indexPath)
        return cell
    }
   
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: kSCREEN_WIDTH, height: 10))
        header.backgroundColor = UIColor.init(white: 0.9, alpha: 1)
        return header
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if lastOffsetY > scrollView.contentOffset.y {
            isPull = true
        }else {
            isPull = false
        }
        lastOffsetY = scrollView.contentOffset.x
    }
}

// MARK: - Selector
extension FMRecommendViewController {
    override func refresh() {
        getData()
    }
    
    override func getMore() {
        getData()
    }
}
