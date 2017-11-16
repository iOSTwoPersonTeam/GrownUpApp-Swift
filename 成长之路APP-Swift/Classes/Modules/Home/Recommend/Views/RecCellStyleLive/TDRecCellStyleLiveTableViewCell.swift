//
//  TDRecCellStyleLiveTableViewCell.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/13.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit
import SDCycleScrollView

class TDRecCellStyleLiveTableViewCell: UITableViewCell {

    // MARK: 懒加载属性
    // 上方的标识标题
    lazy var markLabel: UILabel = {
        let tempLabel = UILabel.init()
        tempLabel.font = UIFont.systemFont(ofSize: 15)
        tempLabel.text = "现场直播"
        tempLabel.backgroundColor = UIColor.white
        addSubview(tempLabel)
        return tempLabel
    }()
    
    /// 轮播图视图
    lazy var cycleImageView: SDCycleScrollView = {
        let tempView = SDCycleScrollView.init()
        tempView.backgroundColor = UIColor.white
        tempView.showPageControl = false
        tempView.delegate = self
        addSubview(tempView)
        return tempView
    }()
    
    /// 轮播图下方的标题
    lazy var titilelabel: UILabel = {
        let tempLabel = UILabel.init()
        tempLabel.font = UIFont.systemFont(ofSize: 14)
        tempLabel.textColor = UIColor.black
        tempLabel.textAlignment = NSTextAlignment.left
        addSubview(tempLabel)
        return tempLabel
    }()
    
    /// 轮播图下方的详情
    lazy var detailLabel: UILabel = {
        let tempLabel = UILabel.init()
        tempLabel.font = UIFont.systemFont(ofSize: 12)
        tempLabel.textColor = UIColor.gray
        tempLabel.textAlignment = NSTextAlignment.left
        addSubview(tempLabel)
        return tempLabel
    }()
    
    // MARK:- 定义属性
    // 图片数组
    var urlPics: [String] = [String]()
    // model
    var modelList = Array<LiveRecommendModel>()
    
    func getDateWithModel(model: Array<LiveRecommendModel?>) {
       
        urlPics.removeAll()
        
        for item in model {
            DLog(message: item?.coverPath);
            urlPics.append(item?.coverPath ?? "")
        }
        self.cycleImageView.imageURLStringsGroup = urlPics
        self.modelList = model as! [LiveRecommendModel]
        
        self.updateConstraintsIfNeeded()
        self.setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.markLabel.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(0)
            make.width.equalTo(SCREENWITH/2)
            make.height.equalTo(40)
        }
        
        self.cycleImageView.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(self.snp.right).offset(-10)
            make.top.equalTo(40)
            make.height.equalTo(110)
        }
        self.titilelabel.snp.makeConstraints { (make) in
        make.top.equalTo(self.cycleImageView.snp.bottom).offset(0)
         make.left.equalTo(self.cycleImageView.snp.left)
            make.right.equalTo(self.cycleImageView.snp.right)
            make.height.equalTo(20)
        }
        
        self.detailLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.titilelabel.snp.left)
            make.right.equalTo(self.titilelabel.snp.right)
            make.top.equalTo(self.titilelabel.snp.bottom)
            make.height.equalTo(20)
        }
        
    }
    
}


// MARK: --代理方法实现
extension TDRecCellStyleLiveTableViewCell: SDCycleScrollViewDelegate {
    
    // 点击图片的回调
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didSelectItemAt index: Int) {
        
    }
    
    // 图片滚动的方法的回调
    func cycleScrollView(_ cycleScrollView: SDCycleScrollView!, didScrollTo index: Int) {
        
        self.titilelabel.text = self.modelList[index].name
        self.detailLabel.text = self.modelList[index].shortDescription
    }
    
    
}















