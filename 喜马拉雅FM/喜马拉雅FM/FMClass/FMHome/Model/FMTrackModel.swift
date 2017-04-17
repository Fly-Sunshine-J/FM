//
//  FMTrackModel.swift
//  喜马拉雅FM
//
//  Created by vcyber on 17/4/14.
//  Copyright © 2017年 vcyber. All rights reserved.
//

import UIKit

class FMTrackModel: NSObject {
    var trackId:Int?
    var title:String?
    var coverPath:String?
    var cover_small_path:String?
    var cover_middle_path:String?
    var cover_large_path:String?
    var duration:String?
    var uptrackAt:String?
    var tags:String?
    var playCounts:String?
    var play_path_32:String?
    var lay_path_64:String?
    var play_path_aac_v164:String?
    var play_path_aac_v224:String?
    var download_path:String?
    var is_paid:Bool?
    var count_comment:String?
    var count_share:String?
    var count_like:String?
    var isDeleted:Bool?
}
