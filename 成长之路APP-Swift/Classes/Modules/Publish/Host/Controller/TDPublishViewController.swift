//
//  TDPublishViewController.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/6.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

class TDPublishViewController: TDBaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //作为导航控制器的的根视图控制器不需要父类中的返回按钮
//        self.navigationItem.leftBarButtonItem = nil;
        
        view.backgroundColor = UIColor.purple
       
       // 设置导航栏
        configNavigatiobBar()
        
    }

}

extension TDPublishViewController {
    func configNavigatiobBar() {
        //左侧按钮
        let leftBtn = UIButton.init(type: UIButtonType.custom)
        leftBtn.frame = CGRect.init(x: 0, y: 0, width: 44, height: 44)
        leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0)
        leftBtn.setImage(UIImage.init(named: "navidrop_arrow_down_h"), for: UIControlState.normal)
        leftBtn.addTarget(self, action: #selector(backBtnClick(_ :)), for: UIControlEvents.touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: leftBtn)
        
        //右侧按钮
        let rightBtn = UIButton.init(type: UIButtonType.custom)
        rightBtn.frame = CGRect.init(x: 0, y: 0, width: 44, height: 44)
        rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -20)
        rightBtn.setImage(UIImage.init(named: "icon_share_h"), for: UIControlState.normal)
        rightBtn.addTarget(self, action: #selector(shareBtnClick(_ :)), for: UIControlEvents.touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: rightBtn)

    }
    
}

// MARK: 事件监听
extension TDPublishViewController {
    // MARK: 导航栏左侧按钮
    @objc func backBtnClick(_ btn: UIButton) {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: 导航栏右侧按钮
    @objc func shareBtnClick(_ btn: UIButton) {
        DLog(message: "shareBtnClick:")
    }
    
    
}











