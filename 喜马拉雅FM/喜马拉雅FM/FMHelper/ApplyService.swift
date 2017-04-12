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
    
    private static func request(urlString:URLConvertible, method:HTTPMethod, parameters:Parameters?, encoding:ParameterEncoding, headers: HTTPHeaders? = nil,completeBlock:@escaping (Any) -> Void, errorBlock:@escaping (String) -> Void) -> Void {
        Alamofire.request(urlString, method: method, parameters: parameters, encoding: encoding, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success(let json):
                let data = json as! Dictionary<String, AnyObject>
                let msg = data["msg"] as! String
                if msg == "成功" {
                    completeBlock(data)
                }else {
                    errorBlock(data["msg"] as! String);
                }
                
            case .failure(let err):
                errorBlock(err.localizedDescription);
            }
        }
    }
    
    static func getRequest(urlString:URLConvertible, parameters:Parameters? = nil, completeBlock:@escaping (Any) -> Void, errorBlock:@escaping (String) -> Void) -> Void {
        ApplyService.request(urlString: urlString, method: .get, parameters: parameters, encoding:JSONEncoding.default, completeBlock: completeBlock, errorBlock: errorBlock);
    }
    
    static func postRequest(urlString:URLConvertible, parameters:Parameters?, completeBlock:@escaping (Any) -> Void, errorBlock:@escaping (String) -> Void) -> Void {
        ApplyService.request(urlString: urlString, method: .post, parameters: parameters, encoding: JSONEncoding.default, completeBlock: completeBlock, errorBlock: errorBlock)
    }

}
