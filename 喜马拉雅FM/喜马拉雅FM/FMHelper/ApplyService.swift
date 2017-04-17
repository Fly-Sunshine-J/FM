//
//  ApplyService.swift
//  喜马拉雅FM
//
//  Created by vcyber on 17/4/11.
//  Copyright © 2017年 vcyber. All rights reserved.
//

import UIKit
import Alamofire

class ApplyService: NSObject {
    
    private static func request(urlString:URLConvertible, method:HTTPMethod, parameters:Parameters?, encoding:ParameterEncoding, headers: HTTPHeaders? = [ "Cookie" : "domain=.ximalaya.com; path=/; channel=ios-b1; 1&_device=iPhone&3F3174C8-3CD4-4B2D-B9C8-1C5A907715E7&5.4.93; impl=com.gemd.iting; XUM=3F3174C8-3CD4-4B2D-B9C8-1C5A907715E7; c-oper=%E6%9C%AA%E7%9F%A5; net-mode=WIFI; res=640%2C1136; idfa=3F3174C8-3CD4-4B2D-B9C8-1C5A907715E7; x_xmly_tid=55388324; x_xmly_resource=xm_source%3Arecommend%26xm_medium%3ArecommendFlow; x_xmly_ts=2147483647"],completeBlock:@escaping (Dictionary<String, Any>) -> Void, errorBlock:@escaping (String) -> Void) -> Void {
    
        Alamofire.request(urlString, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let json):
                let data = json as! Dictionary<String, Any>
                let msg = data["ret"] as! Int
                if msg == 0 {
                    completeBlock(data)
                }else {
                    errorBlock(data["msg"] as! String);
                }
                
            case .failure(let err):
                errorBlock(err.localizedDescription);
            }
        }
    }
    
    static func getRequest(urlString:URLConvertible, parameters:Parameters? = nil, completeBlock:@escaping (Dictionary<String, Any>) -> Void, errorBlock:@escaping (String) -> Void) -> Void {
        ApplyService.request(urlString: urlString, method: .get, parameters: parameters, encoding:JSONEncoding.default, completeBlock: completeBlock, errorBlock: errorBlock);
    }
    
    static func postRequest(urlString:URLConvertible, parameters:Parameters?, completeBlock:@escaping (Dictionary<String, Any>) -> Void, errorBlock:@escaping (String) -> Void) -> Void {
        ApplyService.request(urlString: urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, completeBlock: completeBlock, errorBlock: errorBlock)
    }

}
