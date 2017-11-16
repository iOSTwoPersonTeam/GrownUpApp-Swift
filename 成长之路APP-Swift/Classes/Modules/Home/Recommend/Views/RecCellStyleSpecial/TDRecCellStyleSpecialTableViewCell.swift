//
//  TDRecCellStyleSpecialTableViewCell.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/13.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

class TDRecCellStyleSpecialTableViewCell: UITableViewCell {

    /// 标题文字
    lazy var titleLabel: UILabel = {
        let tempLabel = UILabel.init()
        tempLabel.font = UIFont.systemFont(ofSize: 15)
        tempLabel.backgroundColor = UIColor.red
        addSubview(tempLabel)
        return tempLabel
    }()
    /// 下方展示区域
    lazy var specialTableView: TDSubRecSpecialTableView = {
        let tempTableView = TDSubRecSpecialTableView.init(frame: CGRect.init(x: 0, y: 40, width: SCREENWITH, height: 200), style: UITableViewStyle.plain)
        addSubview(tempTableView)
        return tempTableView
    }()
    
    func getDateWithModel(model: SpecialRecommendModel?) {
        
        self.titleLabel.text = model?.title
        self.specialTableView.getDataWithModel(model: model)
        self.specialTableView.reloadData()
        
        self.updateConstraintsIfNeeded()
        self.setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(0)
            make.width.equalTo(SCREENWITH/2)
            make.height.equalTo(40)
        }
        
        self.specialTableView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(40)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(200)
        }
        
    }
    
  
}
