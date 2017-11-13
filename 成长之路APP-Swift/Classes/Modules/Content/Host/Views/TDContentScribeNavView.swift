//
//  TDContentScribeNavView.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/11.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

// MARK: --定义颜色
fileprivate let kTitleColorNormal = UIColor.init(red: 0.40, green: 0.40, blue: 0.41, alpha: 1.0)
fileprivate let kTitleColorSelect = UIColor.init(red: 0.86, green: 0.39, blue: 0.30, alpha: 1.0)


class TDContentScribeNavView: UIView {

    // MARK: --回调属性
    var subScribeNavViewDidSubClick: ((_ view: TDContentScribeNavView, _ index: NSInteger) -> ())?
    
    // MARK: --定义属性
    /// 标题数组  set方法调用
    var titles: [String] = [String](){
        didSet{
            // 配置子视图
            configsubView()
        }
    }
    
    // MARK: --懒加载属性
    /// 小滑块
    lazy var sliderView: UIView = {
        let  with = SCREENWITH / CGFloat(self.titles.count)
        let view = UIView()
        view.frame = CGRect.init(x: 2, y: self.height - 2.0, width: with, height: 2)
        view.backgroundColor = kTitleColorSelect
        self.addSubview(view)
        return view
    }()

}

// MARK: -创建方法  初始化创建方法
extension TDContentScribeNavView {
   class func createWith(titles: [String]) -> TDContentScribeNavView {
        let view = TDContentScribeNavView.init(frame: CGRect.init(x: 0, y: 0, width: SCREENWITH, height: 44))
        view.titles  = titles
        return view
    }
}

// MARK: --配置子视图
extension TDContentScribeNavView {
   fileprivate func configsubView() {
    if titles.count == 0 {
        return
    }
    
    let with = SCREENWITH / CGFloat(titles.count)
    for index in 0..<titles.count {
        let title = titles[index]
        let btn = UIButton.init(type: UIButtonType.custom)
        btn.frame = CGRect.init(x: CGFloat(index) * with, y: 0, width: with, height: 44)
        btn.setTitleColor(kTitleColorNormal, for: UIControlState.normal)
        btn.setTitleColor(kTitleColorSelect, for: UIControlState.selected)
        btn.setTitleColor(kTitleColorSelect, for: [UIControlState.highlighted, UIControlState.selected])
        btn.setTitle(title, for: UIControlState.normal)
        if index == 0 {
            btn.isSelected = true
        }
        btn.addTarget(self, action: #selector(subBtnSelected(_ :)), for: UIControlEvents.touchUpInside)
        btn.tag = 100 + index
        self.addSubview(btn)
     }
      // 初始化小滑块
    sliderView.layoutSubviews()
   }
}

// MARK: -事件监听
extension TDContentScribeNavView {
    // MARK: --点击事件处理
    @objc func subBtnSelected(_ btn: UIButton) {
        btn.isSelected = true
        unSelectedAllBtn(except: btn)
        slideViewAnimation(with: btn)
        
        // 回调闭包
        if subScribeNavViewDidSubClick != nil {
            subScribeNavViewDidSubClick!(self, btn.tag - 100)
        }
    }
    
    // MARK: 取消其它按键的选中装填
    func unSelectedAllBtn(except btn: UIButton) {
        for view in subviews {
            if view.classForCoder == UIButton.classForCoder() && btn != view {
                (view as! UIButton).isSelected = false
            }
        }
    }
    
    // MARK: 小滑块的动画
    func slideViewAnimation(with btn: UIButton) {
        UIView.animate(withDuration: 0.25) {
            var frame = self.sliderView.frame
            frame.origin.x = btn.frame.origin.x + 2
            self.sliderView.frame = frame
        }
    }
    
}

// MARK: --对外提供方法
extension TDContentScribeNavView {
    
    // MARK: 设置当前滑块的位置
    func scrollToController(at index: NSInteger) {
        let btn = self.viewWithTag(index + 100) as! UIButton
        btn.isSelected = true
        unSelectedAllBtn(except: btn)
        slideViewAnimation(with: btn)
    }
}










