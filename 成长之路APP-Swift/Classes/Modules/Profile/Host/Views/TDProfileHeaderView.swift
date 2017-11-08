//
//  TDProfileHeaderView.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/8.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

class TDProfileHeaderView: UIView {

    //MARK: -懒加载属性
    //背景视图
    lazy var backImageView: UIImageView = {
        let imgView = UIImageView.init(image: UIImage.init(named: "find_radio_default"))
        imgView.contentMode = .scaleAspectFill
        imgView.layer.masksToBounds = true
        self.addSubview(imgView)
        return imgView
    }()
    
    //背景图片上方的一层蒙版
    lazy var alphaView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.hexInt(0x000000)
        view.alpha = 0.3
        self.addSubview(view)
        return view
    }()
    
    //设置的小按钮
    lazy var settingBtn: UIButton = {
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.setImage(UIImage.init(named: "icon_setting"), for: UIControlState.normal)
        self.addSubview(btn)
        return btn
    }()
    
    //头像视图
    lazy var avatarImageView: UIImageView = {
        let headerImgView = UIImageView.init(image: UIImage.init(named: "find_radio_default"))
        headerImgView.layer.cornerRadius = 45.0
        headerImgView.layer.masksToBounds = true
        headerImgView.layer.borderColor = UIColor.white.cgColor
        headerImgView.layer.borderWidth = 2.0
       // shouldRasterize = true 会使视图渲染内容被缓存起来，下次绘制的时候可以直接显示缓存，当然要在视图内容不改变的情况下
        headerImgView.layer.rasterizationScale = UIScreen.main.scale
        headerImgView.layer.shouldRasterize = true
        self.addSubview(headerImgView)
        return headerImgView
    }()
    
    //用户名按钮
    lazy var userNameBtn: UIButton = {
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.setTitle("点击登录", for: UIControlState.normal)
        self.addSubview(btn)
        return btn
    }()
    
    //子标题
    lazy var subTitleLabel: UILabel = {
        let subLabel = UILabel()
        subLabel.textColor = UIColor.white
        subLabel.font = UIFont.systemFont(ofSize: 13)
        subLabel.textAlignment = NSTextAlignment.center
        subLabel.text = "1秒登录,专享个性化服务"
        self.addSubview(subLabel)
        return subLabel
    }()
    
    //节目管理按钮
    lazy var managerBtn: UIButton = {
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.setTitle("节目管理", for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.setTitleColor(RGBA(r: 0.36, g: 0.36, b: 0.36, a: 1.0), for: UIControlState.normal)
        btn.backgroundColor = UIColor.white.withAlphaComponent(0.8)
        btn.layer.cornerRadius = 5.0
        btn.layer.masksToBounds = true
        self.addSubview(btn)
        return btn
    }()
    
    //录音按钮
    lazy var recordbtn: UIButton = {
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.setTitle("录音", for: UIControlState.normal)
        btn.setTitleColor(UIColor.white, for: UIControlState.normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.setImage(UIImage.init(named: "ic_rec_w"), for: UIControlState.normal)
        btn.backgroundColor = UIColor.orange.withAlphaComponent(0.8)
        btn.layer.masksToBounds = true
        btn.layer.cornerRadius = 5.0
        self.addSubview(btn)
        return btn
    }()
    
    
    //MARK: --加载视图布局
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let margin: CGFloat = 10.0
        let hspace: CGFloat = (self.width - SCREENWITH) * 0.5
        
        //背景视图
        backImageView.frame = CGRect.init(x: hspace, y: 0, width: SCREENWITH, height: self.height)
        alphaView.frame = backImageView.frame
        
        //节目管理
        let MRBtnW: CGFloat = 104.0
        let MRBtnH:CGFloat = 37.0
        managerBtn.snp.makeConstraints { (make) in
            make.right.equalTo(self.snp.centerX).offset(-margin)
            make.bottom.equalTo(self.snp.bottom).offset(-36.0)
            make.width.equalTo(MRBtnW)
            make.height.equalTo(MRBtnH)
        }
        
        //录音
        recordbtn.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.centerX).offset(margin)
            make.bottom.equalTo(managerBtn.snp.bottom)
            make.width.equalTo(MRBtnW)
            make.height.equalTo(MRBtnH)
        }
        
        //子标题
        let subTitleH:CGFloat = 15.0
        subTitleLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.left.right.equalTo(self)
            make.bottom.equalTo(recordbtn.snp.top).offset(-24.0)
            make.height.equalTo(subTitleH)
        }
        
        //点击登录按钮
        let userNameBtnH:CGFloat = 18.0
        userNameBtn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.snp.centerX)
            make.left.right.equalTo(self)
            make.bottom.equalTo(subTitleLabel.snp.top).offset(-margin)
            make.height.equalTo(userNameBtnH)
        }
        
        //头像
        let avatarWH:CGFloat = 90.0
        avatarImageView.snp.makeConstraints { (make) in
            make.width.height.equalTo(avatarWH)
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(userNameBtn.snp.top).offset(-margin)
        }
        
        //设置按钮
        let settingBtnWH:CGFloat = 20
        settingBtn.snp.makeConstraints { (make) in
            make.left.equalTo(hspace + 12)
            make.top.equalTo(backImageView.snp.top).offset(2 * margin)
            make.width.height.equalTo(settingBtnWH)
        }
        
    }
    


}
