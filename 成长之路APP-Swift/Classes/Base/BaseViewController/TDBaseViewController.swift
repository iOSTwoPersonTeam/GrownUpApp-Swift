//
//  TDBaseViewController.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/6.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

class TDBaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
        automaticallyAdjustsScrollViewInsets = false
        //设置背景颜色
        view.backgroundColor = UIColor.hexInt(0xf3f3f3)
        
        //设置视图控制器默认背景色
        self.view.backgroundColor = UIColor.lightGray
        
        //自定义导航栏按钮
        let leftBtn = UIButton.init(frame:CGRect.init(x: 0, y: 0, width: 20, height: 20))
        leftBtn.setImage(UIImage(named:"btn_back_n"), for: UIControlState.normal)
        leftBtn.addTarget(self, action: #selector(TDBaseViewController.back), for: UIControlEvents.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftBtn)
    }
    
    //视图将要出现
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        navigationController?.navigationBar.isTranslucent = false
    }
    
    //MARK: - Event Response  点击事件
    @objc func back(){
        self.navigationController?.popViewController(animated: true)
    }



}
