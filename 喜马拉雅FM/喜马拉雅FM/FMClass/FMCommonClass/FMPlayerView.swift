//
//  FMPlayerView.swift
//  喜马拉雅FM
//
//  Created by vcyber on 17/4/13.
//  Copyright © 2017年 vcyber. All rights reserved.
//

import UIKit

class FMPlayerView: UIView {
    //歌曲相关
    open var track:XMTrack?
    open var trackList:Array<XMTrack>?
    
    open var radio:XMRadio?
    open var programList:Array<XMRadio>?
    open var radioSchedule:XMRadioSchedule?
    
    lazy var link:CADisplayLink = {
        let temLink:CADisplayLink = CADisplayLink(target: self, selector: #selector(rotation(_:)))
        temLink.add(to: RunLoop.current, forMode: .commonModes)
        return temLink
    }()

    lazy var contentImg:UIImageView = {
        let img:UIImageView = UIImageView()
        img.bk_addObserver(forKeyPath: "image", options: .new, task: { (obj, dict) in
            self.link.isPaused = false
            self.stopImg.isHidden = true
        })
        img.layer.cornerRadius = 22;
        img.clipsToBounds = true;
        img.isUserInteractionEnabled = true
        return img
    }()
    
    lazy var stopImg:UIImageView = {
        let img = UIImageView(image: UIImage(named: "tabbar_np_play"));
        self.contentImg.addSubview(img)
        img.snp.makeConstraints({ (make) in
            make.edges.equalTo(0)
        })
        img.isUserInteractionEnabled = true
        
        XMSDKPlayer.shared().bk_addObserver(forKeyPath: "playerState", options: .new, task: { (obj, dict) in
            fmPrint("\(dict)")
        })
        XMSDKPlayer.shared().bk_addObserver(forKeyPath: "livePlayerState", options: .new, task: { (obj, dict) in
            fmPrint("\(dict)")
        })
        
        return img
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    fileprivate func setUI() -> Void {
        let backgroundImg = UIImageView(image: UIImage(named: "tabbar_np_normal"))
        backgroundImg.isUserInteractionEnabled = true
        addSubview(backgroundImg)
        backgroundImg.snp.makeConstraints { (make) in
            make.edges.equalTo(0)
        }
        backgroundImg.addSubview(contentImg)
        contentImg.snp.makeConstraints({ (make) in
            make.centerX.equalTo(backgroundImg)
            make.top.equalTo(5)
            make.width.equalTo(44)
            make.height.equalTo(44)
        })
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(_:)))
        stopImg.addGestureRecognizer(tap)
        
    }
    
    
    fileprivate func degreeToRadian(angle:Double) -> Double {
        return angle / 180 * M_PI
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
}

//MARK:-Selector
extension FMPlayerView {
    @objc fileprivate func rotation(_ link:CADisplayLink) -> Void {
        self.contentImg.layer.transform = CATransform3DRotate(self.contentImg.layer.transform, CGFloat(degreeToRadian(angle: 72 / 60)), 0, 0, 1)
    }
    
    
    @objc fileprivate func tap(_ gesture:UITapGestureRecognizer) -> Void {
        if trackList != nil && trackList?.count != 0 {
            XMSDKPlayer.shared().setPlayMode(.track)
            XMSDKPlayer.shared().setTrackPlayMode(.XMTrackPlayerModeList)
            XMSDKPlayer.shared().play(with: track, playlist: trackList)
            gesture.view?.isHidden = true
        }else if self.radio != nil {
            XMSDKPlayer.shared().setPlayMode(.live)
            XMSDKPlayer.shared().startLivePlay(with: radio)
            gesture.view?.isHidden = true
        }else if radioSchedule != nil {
            XMSDKPlayer.shared().setPlayMode(.live)
            XMSDKPlayer.shared().startHistoryLivePlay(with: nil, withProgram: radioSchedule, inProgramList: programList)
            gesture.view?.isHidden = true
        }
    }
    
}
