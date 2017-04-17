//
//  FMRecommendCell.swift
//  喜马拉雅FM
//
//  Created by vcyber on 17/4/14.
//  Copyright © 2017年 vcyber. All rights reserved.
//

import UIKit
import SDWebImage



class FMRecommendCell: UITableViewCell {
    
    var btnClickCallBack: ((Int)->Void)?
    
    private lazy var whiteCircel:UIView = UIView()
    private lazy var coverImg:UIImageView = UIImageView()
    private lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.fmFont(16)
        label.numberOfLines = 2
        return label
    }()
    private lazy var albumTitleLabel:UILabel = {
        let label = UILabel()
        label.font = UIFont.fmFont(12)
        label.numberOfLines = 2
        return label
    }()
    private lazy var playBtn:UIButton = {
        let btn = UIButton(type: .custom)
        btn.setBackgroundImage(UIImage(named: "playCoverBtn_n"), for: .normal)
        btn.setBackgroundImage(UIImage(named: "playCoverBtn_s"), for: .selected)
        btn.addTarget(self, action: #selector(play(_:)), for: .touchUpInside)
        return btn
    }()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(whiteCircel)
        whiteCircel.isUserInteractionEnabled = true
        whiteCircel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(10)
            make.width.equalTo(50)
            make.height.equalTo(50)
        }
        
        whiteCircel.addSubview(coverImg)
        coverImg.isUserInteractionEnabled = true
        coverImg.snp.makeConstraints { (make) in
            make.center.equalTo(whiteCircel)
            make.width.equalTo(46)
            make.height.equalTo(46)
        }
        
        coverImg.addSubview(playBtn)
        playBtn.snp.makeConstraints { (make) in
            make.center.equalTo(coverImg)
            make.width.equalTo(36)
            make.height.equalTo(36)
        }
        
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(whiteCircel)
            make.left.equalTo(whiteCircel.snp.right).offset(10)
            make.right.equalTo(-40)
        }
        
        addSubview(albumTitleLabel)
        albumTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(titleLabel)
            make.right.equalTo(-20)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configCell(model:FMRecommendModel, indexPath:IndexPath) -> Void {
        playBtn.tag = indexPath.section
        coverImg.sd_setImage(with: URL(string: (model.album?.cover_path)!))
        if model.rec_type == "track" {
            whiteCircel.layer.cornerRadius = 25
            whiteCircel.layer.masksToBounds = true
            coverImg.layer.cornerRadius = 23
            coverImg.layer.masksToBounds = true
            titleLabel.text = model.track?.title
            albumTitleLabel.text = "专辑：\(model.album?.title)"
        }else {
            whiteCircel.layer.cornerRadius = 0
            coverImg.layer.cornerRadius = 0
            titleLabel.text = model.album?.title
            albumTitleLabel.text = model.album?.info
        }
        whiteCircel.layer.shadowOpacity = 0.65;
        whiteCircel.layer.shadowOffset = CGSize(width: 0, height: 0)
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

// MARK: -Selector
extension FMRecommendCell {
    func play(_ btn:UIButton) -> Void {
        if btnClickCallBack != nil {
            btnClickCallBack!(btn.tag)
        }
    }
}

