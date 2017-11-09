//
//  TDBaseNavigationViewController.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/6.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

class TDBaseNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
   
        navigationItem.hidesBackButton = true
        
        let attributes = [
            NSAttributedStringKey.foregroundColor : UIColor.hexInt(0x333333),
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)
        ]
        UINavigationBar.appearance().titleTextAttributes = attributes
        UINavigationBar.appearance().tintColor = UIColor.hexInt(0x333333)
        
    }

}
