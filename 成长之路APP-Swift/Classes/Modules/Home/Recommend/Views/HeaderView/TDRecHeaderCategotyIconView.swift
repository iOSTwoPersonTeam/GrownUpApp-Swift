//
//  TDRecHeaderCategotyIconView.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/13.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

// MARK:  自定义cell
class TDcateCollectionViewCell: UICollectionViewCell {
    
    lazy var topImageView: UIImageView = {
        let iconView = UIImageView.init()
        iconView.layer.masksToBounds = true
        iconView.layer.cornerRadius = 30
        self.addSubview(iconView)
        return iconView
    }()
    
    lazy var bottomLabel: UILabel = {
        let tempLabel = UILabel.init()
        tempLabel.font = UIFont.systemFont(ofSize: 12)
        tempLabel.textAlignment = NSTextAlignment.center
        self.addSubview(tempLabel)
        return tempLabel
    }()
    
    func getDateWithModel(model: String) {
        
        self.topImageView.image = UIImage.init(named: "find_usercover")
        self.bottomLabel.text = "热门分享"
        
        self.setNeedsUpdateConstraints()
        self.updateConstraintsIfNeeded()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.topImageView.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.right.right.equalTo(self.snp.right).offset(0)
            make.height.equalTo(60)
        }
        
        self.bottomLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.snp.left)
            make.top.equalTo(self.topImageView.snp.bottom)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(20)
        }
        
        
    }
    
    
}


class TDRecHeaderCategotyIconView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
            self.dataSource = self
            self.delegate = self
            self.register(TDcateCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TDRecHeaderCategotyIconView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 12
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TDcateCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TDcateCollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.getDateWithModel(model: "hahha")
        return cell
    }
 
}











