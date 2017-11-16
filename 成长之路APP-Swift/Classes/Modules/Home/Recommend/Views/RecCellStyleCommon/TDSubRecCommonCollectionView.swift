//
//  TDSubRecCommonCollectionView.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/14.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit
import SDWebImage

class TDsubRecCommonCollectionCell: UICollectionViewCell {
    
    lazy var topImageView: UIImageView = {
        let tempImageView = UIImageView.init()
        addSubview(tempImageView)
        return tempImageView
    }()
    
    lazy var titleLabel: UILabel = {
        let tempLabel = UILabel.init()
        tempLabel.font = UIFont.systemFont(ofSize: 13)
        tempLabel.numberOfLines = 0
        tempLabel.textAlignment = NSTextAlignment.center
        addSubview(tempLabel)
        return tempLabel
    }()
    
    lazy var detailLabel: UILabel = {
        let tempLabel = UILabel.init()
        tempLabel.font = UIFont.systemFont(ofSize: 12)
        tempLabel.textAlignment = NSTextAlignment.center
        tempLabel.textColor = UIColor.gray
        addSubview(tempLabel)
        return tempLabel
    }()
    
    
    func getDateWithModel(model: GeneralRecommenModel?) {
        
        self.topImageView.sd_setImage(with: URL.init(string: (model?.coverLarge)!), placeholderImage: nil)
        self.titleLabel.text = model?.intro
        self.detailLabel.text = model?.title
        
        self.updateConstraintsIfNeeded()
        self.setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.topImageView.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.width.equalTo(110)
            make.height.equalTo(100)
        }
        self.titleLabel.snp.makeConstraints { (make) in
        make.top.equalTo(self.topImageView.snp.bottom).offset(3)
            make.left.equalTo(self.topImageView.snp.left)
            make.right.equalTo(self.topImageView.snp.right)
            make.height.equalTo(40)
        }
        self.detailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(3)
            make.left.equalTo(self.titleLabel.snp.left)
            make.right.equalTo(self.titleLabel.snp.right)
            make.height.equalTo(15)
        }
    }
    
}







class TDSubRecCommonCollectionView: UICollectionView {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.delegate = self
        self.dataSource = self
    self.register(TDsubRecCommonCollectionCell.classForCoder(), forCellWithReuseIdentifier: "cell")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var modelList: EditorRecommendModel?
    // Model赋值
    func getDateWithModel(model: EditorRecommendModel?) {
        modelList = model
        self.reloadData()
    }

}

// MARK: 代理方法的实现
extension TDSubRecCommonCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelList?.list?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:TDsubRecCommonCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TDsubRecCommonCollectionCell
        cell.backgroundColor = UIColor.orange
        cell.getDateWithModel(model: modelList?.list?[indexPath.row])
         return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        DLog(message: "点击的是个")
    }
    
    
}








