//
//  TDRecHeaderCategotyIconView.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/13.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit
import SDWebImage

// MARK:  自定义cell
class TDcateCollectionViewCell: UICollectionViewCell {
    
    lazy var topImageView: UIImageView = {
        let iconView = UIImageView.init()
        iconView.layer.masksToBounds = true
        iconView.layer.cornerRadius = 25
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
    
    func getDateWithModel(model: CategoryListRecommendModel?) {
        
        self.topImageView.sd_setImage(with: URL.init(string: (model?.coverPath)!), placeholderImage: nil)
        self.bottomLabel.text = model?.title
        
        self.setNeedsUpdateConstraints()
        self.updateConstraintsIfNeeded()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        
        self.topImageView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(5)
            make.width.equalTo(50)
            make.height.equalTo(50)
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
    
    var modelList = Array<CategoryListRecommendModel>()

    func getdateWithModel(model: Array<CategoryListRecommendModel?>) {
        
        self.modelList = model as! [CategoryListRecommendModel]
    }
    
    

}

extension TDRecHeaderCategotyIconView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.modelList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TDcateCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TDcateCollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.getDateWithModel(model: self.modelList[indexPath.row])
        return cell
    }
 
}











