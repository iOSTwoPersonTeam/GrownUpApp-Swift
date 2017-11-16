//
//  TDRecCellStyleCommonTableViewCell.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/13.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

class TDRecCellStyleCommonTableViewCell: UITableViewCell {

    // MARK:  懒加载属性
    /// 标题文字
    lazy var titleLabel: UILabel = {
        let tempLabel = UILabel.init()
        tempLabel.font = UIFont.systemFont(ofSize: 15)
        tempLabel.backgroundColor = UIColor.red
        addSubview(tempLabel)
        return tempLabel
    }()
    
    /// 下部的展示区域
    lazy var commonCollectionView: TDSubRecCommonCollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.itemSize = CGSize.init(width: 110, height: 160)
        let tempCollectionView = TDSubRecCommonCollectionView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWITH, height: 160), collectionViewLayout: layout)
        tempCollectionView.backgroundColor = UIColor.cyan
        self.addSubview(tempCollectionView)
        return tempCollectionView
    }()
    
    func getDateWithModel(model: EditorRecommendModel?) {
        
        self.titleLabel.text = model?.title
        self.commonCollectionView.getDateWithModel(model: model)
       
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
        
        self.commonCollectionView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(40)
            make.width.equalTo(SCREENWITH)
            make.height.equalTo(160)
        }
    }

}
