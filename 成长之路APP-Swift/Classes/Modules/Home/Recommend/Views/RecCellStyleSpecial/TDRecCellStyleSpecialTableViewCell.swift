//
//  TDRecCellStyleSpecialTableViewCell.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/13.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

class TDRecCellStyleSpecialTableViewCell: UITableViewCell {

    lazy var specialTableView: TDSubRecSpecialTableView = {
        let tempTableView = TDSubRecSpecialTableView.init(frame: CGRect.init(x: 0, y: 40, width: SCREENWITH, height: 200), style: UITableViewStyle.plain)
        addSubview(tempTableView)
        return tempTableView
    }()
    
    func getDateWithModel(model: String) {
        
        
        self.updateConstraintsIfNeeded()
        self.setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.specialTableView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(40)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(200)
        }
        
    }
    
  
}
