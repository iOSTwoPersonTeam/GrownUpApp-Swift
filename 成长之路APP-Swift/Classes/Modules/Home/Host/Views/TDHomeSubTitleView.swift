//
//  TDHomeSubTitleView.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/10.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

let kSysTemOriginColor = UIColor.init(red: 0.96, green: 0.39, blue: 0.26, alpha: 1.0)
let kSystemBlackColor = UIColor.init(red: 0.38, green: 0.39, blue: 0.40, alpha: 1.0)

//MARK: --协议代理
protocol TDHomeSubTitleViewDelagate: NSObjectProtocol {
    //当前选中第index个标题的代理销毁
    func homeSubTitleViewDidSelected(_ titleView: TDHomeSubTitleView, atIndex: NSInteger, title: String)
}

// MAKR: --class声明的类 可提供外部调用
class TDHomeSubTitleView: UIView {

    //MARK: --代理
    weak var delegate: TDHomeSubTitleViewDelagate?
    
    //MARK: --自定义属性
    var subTitleBtnArray: [UIButton] = [UIButton]()
    var currentSelectedBtn: UIButton!
    
    var titileArray: [String] = [] {
        didSet{
            //配置子标题
         configSubTitles()
        }
    }
    
    //MARK: --懒加载属性
    //下方的滑块指示器
    lazy var sliderView: UIView = {
        let view = UIView()
        view.backgroundColor = kSysTemOriginColor
        self.addSubview(view)
        view.snp.makeConstraints({ (make) in
            make.size.equalTo(CGSize.init(width: 30, height: 2))
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self.snp.left).offset(5)
        })
        return view
    }()
    
    //MARK: --生命周期
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundColor = UIColor.white
    }

}

//MARK: --跳转
extension TDHomeSubTitleView {
    func jumpShow(at index: NSInteger) {
        if index < 0 || index >= subTitleBtnArray.count {
            return
        }
        let btn = subTitleBtnArray[index]
        selectedAtBtn(btn, isfirstStart: false)
    }
}

//MARK:-- 配置子标题
extension TDHomeSubTitleView {
   fileprivate func configSubTitles() {
    //每一个titleBtn的宽度
    let btnW = SCREENWITH / CGFloat(titileArray.count)
    //循环遍历
    for index in 0..<titileArray.count {
        let title = titileArray[index]
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.setTitle(title, for: UIControlState.normal)
        btn.setTitleColor(kSystemBlackColor, for: UIControlState.normal)
        btn.setTitleColor(kSysTemOriginColor, for: UIControlState.selected)
        btn.setTitleColor(kSysTemOriginColor, for: [UIControlState.highlighted, UIControlState.selected])
        btn.frame = CGRect.init(x: CGFloat(index
        ) * btnW, y: 0, width: btnW, height: 38)
       btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.adjustsImageWhenDisabled  = false
        btn.addTarget(self, action: #selector(subTitleClick(_ :)), for: UIControlEvents.touchUpInside)
        subTitleBtnArray.append(btn)
        addSubview(btn)
    }
    
    guard let firstBtn = subTitleBtnArray.first else {
        return
    }
    selectedAtBtn(firstBtn, isfirstStart: true)

  }
    ///当前选中某一个按钮
   fileprivate func selectedAtBtn(_ btn: UIButton, isfirstStart: Bool) {
        btn.isSelected = true
        currentSelectedBtn = btn
    //MARK: -- 注意:这里重新更新frame时候要用updateConstraints
        self.sliderView.snp.updateConstraints { (make) in
            make.left.equalTo(self.snp.left).offset(btn.x + btn.width * 0.5 - 15)
        }
        if !isfirstStart {
            UIView.animate(withDuration: 0.25, animations: {
                self.layoutIfNeeded()
            })
        }
        unSelectedAllBtn(btn: btn)
    }
    
    //对所有非选中的按钮执行反选操作
    func unSelectedAllBtn(btn: UIButton) {
        for sbtn in subTitleBtnArray {
            if sbtn == btn {
                continue
            }
            sbtn.isSelected = false
        }
    }
    
}

//MARK: --事件监听
extension TDHomeSubTitleView {
   @objc func subTitleClick(_ btn: UIButton) {
        if btn == currentSelectedBtn {
            return
        }
        //实际上 代替了 responsed
    delegate?.homeSubTitleViewDidSelected(self, atIndex: subTitleBtnArray.index(of: btn)!, title: btn.titleLabel?.text ?? "")
    selectedAtBtn(btn, isfirstStart: false)
    }
}
































