//
//  TDSUbRecSpecialTableView.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/14.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

class TDSubRecSpecialTableViewCell: UITableViewCell {
    
    // MARK: 懒加载属性
    // 头部视图
    lazy var headerImageView: UIImageView = {
        let tempImageView = UIImageView.init()
        tempImageView.backgroundColor = UIColor.red
        addSubview(tempImageView)
        return tempImageView
    }()
    
    // 标题
    lazy var titleLabel: UILabel = {
        let tempLabel = UILabel.init()
        tempLabel.backgroundColor = UIColor.orange
        tempLabel.font = UIFont.systemFont(ofSize: 14)
        addSubview(tempLabel)
        return tempLabel
    }()
    
    // 详情
    lazy var detailLabel: UILabel = {
        let tempLabel = UILabel.init()
        tempLabel.backgroundColor = UIColor.yellow
        tempLabel.font = UIFont.systemFont(ofSize: 12)
        tempLabel.textColor = UIColor.lightGray
        tempLabel.numberOfLines = 0
        addSubview(tempLabel)
        return tempLabel
    }()
    
    func getDateWithModel(model: SpecialDetailRecommendModel?) {
        
        self.titleLabel.text = model?.title
        self.detailLabel.text = model?.subtitle
        self.headerImageView.sd_setImage(with: URL.init(string: model?.coverPath ?? ""), placeholderImage: nil)
        
        self.updateConstraintsIfNeeded()
        self.setNeedsUpdateConstraints()
    }
    
    override func updateConstraints() {
        super.updateConstraints()
        self.headerImageView.snp.makeConstraints { (make) in
            make.left.equalTo(5)
            make.top.equalTo(10)
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        self.titleLabel.snp.makeConstraints { (make) in
        make.left.equalTo(self.headerImageView.snp.right).offset(3)
            make.top.equalTo(self.headerImageView.snp.top)
            make.width.equalTo(SCREENWITH/3 * 2)
            make.height.equalTo(30)
        }
        self.detailLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.titleLabel.snp.left)
            make.top.equalTo(self.titleLabel.snp.bottom).offset(2)
            make.right.equalTo(self.titleLabel.snp.right)
            make.height.equalTo(50)
        }
        
    }
    
    
    
    
}








class TDSubRecSpecialTableView: UITableView {

    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        
        self.delegate = self
        self.dataSource = self
        self.register(TDSubRecSpecialTableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var modelList: [SpecialDetailRecommendModel]?
    
    func getDataWithModel(model: SpecialRecommendModel?) {
    
        self.modelList = model?.list

    }
    
    
}

// MARK: --代理方法实现
extension TDSubRecSpecialTableView: UITableViewDelegate, UITableViewDataSource {

    // MARK: --个section的row的值
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    // MARK: --各section的row的值
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TDSubRecSpecialTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TDSubRecSpecialTableViewCell
        cell.backgroundColor = UIColor.cyan
        cell.getDateWithModel(model: self.modelList?[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}












