//
//  TDBaseTabBarController.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/6.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

//tag的累积值
let kTagPlus: NSInteger = 100
//TabBar的高度
let kTabBarH: CGFloat = 49

class TDBaseTabBarController: UITabBarController {

    //初始化数组
    var tarbarConfigArr:[Dictionary<String,String>]! //标签栏配置数组，从Plist文件中读取

    //MARK: -普通属性
    //后方的背景的图片
    lazy var bgImageView: UIImageView = {
        let img = UIImageView()  //初始化成为一个常量对象
        img.frame = CGRect.init(x: 0, y: SCREENHEIGHT - kTabBarH, width: SCREENWITH, height: kTabBarH) //设置frame
        img.image = UIImage.init(named: "tabbar_bg")  //设置图片
        img.isUserInteractionEnabled = true //可以交互
        return img
    }()
    
    //MARK: -懒加载
    //按钮正常状态下的图片数组
    lazy var normalImageArray:[UIImage] = {
        var tempArray: [UIImage] = [UIImage]()
        //本地数组获取数据
        for dictionary in self.tarbarConfigArr {
            tempArray.append(UIImage.init(named: dictionary["NormalImg"]!)!)
        }
        DLog(message: tempArray)
        return tempArray
    }()
    
    //按钮选中状态下的图片数组
    lazy var selectImageArray: [UIImage] = {
        var tempArray: [UIImage] = [UIImage]()
        //从本地获取数据
        for dictionary in self.tarbarConfigArr {
            tempArray.append(UIImage.init(named: dictionary["SelectedImg"]!)!)
        }
        return tempArray
    }()
    
    //MARK: Private Methods  获取本地plist文件中的数据
    func getConfigArrFromPlistFile() -> ([NSDictionary]?){
        let filePath:String? = Bundle.main.path(forResource: "TabBarConfig", ofType: "plist")
        let plistData = NSDictionary.init(contentsOfFile: filePath ?? "")
        let configArr = plistData?.object(forKey: "Tabbars") as? [Dictionary<String,String>]
        return configArr! as [NSDictionary]
    }
    
    //MARK: -生命周期
    override func viewDidLoad() {  //override重载方法的标识符
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //读取plist文件,初始化标签栏配置数组
        self.tarbarConfigArr = self.getConfigArrFromPlistFile() as? [Dictionary<String, String>]
        //自定义tabBar
        createCustomTabBar()
        //配置子控件
        configSubControllers()
    }

    //TODO --注意在ios11之后 要在viewDidAppear 视图加载完成的方法中 隐藏并删除系统自带Tabbar*******
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //在自定义tabBar之前 应该先隐藏原有TabBar 删除TabBar
        self.tabBar.isHidden = true;
        tabBar.removeFromSuperview()
    }
    
}

//MARK: -初始化  extension 扩展类方法
extension TDBaseTabBarController {  //extension 扩展类方法 写在class方法外部

    //MARK: 自定义tabBar
    func createCustomTabBar()  {
        //添加TabBar背景图
        view.addSubview(bgImageView)
        
        let with: CGFloat = SCREENWITH / 5.0
        for index in 0..<5 {
            let btn = UIButton.init(type: UIButtonType.custom)
            if index == 2 {
                btn.frame = CGRect.init(x: SCREENWITH * 0.5 - kTabBarH * 0.5, y: -10, width: kTabBarH + 10, height: kTabBarH + 10)
            } else {
                btn.frame = CGRect.init(x: with * CGFloat(index), y: 0, width: with, height: kTabBarH)
            }
            btn.tag = kTagPlus + index
            btn.adjustsImageWhenHighlighted = false
            btn.setImage(normalImageArray[index], for: UIControlState.normal)
            btn.setImage(selectImageArray[index], for: UIControlState.selected)
            btn.addTarget(self, action: #selector(TDBaseTabBarController.tabBarItemSelected(_:)), for: .touchUpInside)
            //添加到相应控件上
            bgImageView.addSubview(btn)
        }
        //设置中间按钮的阴影
        guard let playBtn = bgImageView.viewWithTag(102) else {
            return
        }
        let img = UIImageView.init(image: UIImage.init(named: "tabbar_np_shadow"))
        let btnW: CGFloat = playBtn.frame.size.width + 6
        img.frame = CGRect.init(x: -3, y: -3, width: btnW, height: btnW * 13.0 / 15.0)
        playBtn.addSubview(img)
        
        //设置默认选中第一个
      tabBarItemSelected(bgImageView.viewWithTag(kTagPlus) as! UIButton)
    }
    
    //MARK: 配置子控制器
    func configSubControllers() {
        tabBar.isHidden = true
        
        var tempArr: [TDBaseNavigationViewController] = [TDBaseNavigationViewController]()
        //首页
        let homeVC = navigationControllerWith(TDHomeViewController())
        tempArr.append(homeVC)
        //内容
        let contentVC = navigationControllerWith(TDContentViewController())
        tempArr.append(contentVC)
        //发布
        let publishVC = navigationControllerWith(TDPublishViewController())
        tempArr.append(publishVC)
        //社区
        let communityVC = navigationControllerWith(TDCommunityViewController())
        tempArr.append(communityVC)
        //我的
        let profileVC = navigationControllerWith(TDProfileTableViewController())
        tempArr.append(profileVC)
        
        viewControllers = tempArr
        
    }
    
    //控制器添加导航栏的函数
    func navigationControllerWith(_ VC: UIViewController) -> TDBaseNavigationViewController {
        let nav = TDBaseNavigationViewController.init(rootViewController: VC)
        nav.delegate = self
        return nav
    }
    
    
}


//MARK: -NavigationCOntroller代理
extension TDBaseTabBarController : UINavigationControllerDelegate {
   
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController.hidesBottomBarWhenPushed {
            bgImageView.isHidden = true
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if !viewController.hidesBottomBarWhenPushed {
            bgImageView.isHidden = false
        }
    }

}


//MARK: -事件监听
extension TDBaseTabBarController {
    @objc func tabBarItemSelected(_ btn: UIButton){
        
        btn.isSelected = true
        btn.isUserInteractionEnabled = false
        for sbtn in bgImageView.subviews {
            guard let xbtn = sbtn as? UIButton else{
                continue
            }
            if xbtn.tag == btn.tag {
                continue
            }
            xbtn.isSelected = false
            xbtn.isUserInteractionEnabled = true
        }
        let btnTag = btn.tag - kTagPlus   //当前选中按钮的tag
        if versionTabBarSelectedIndex(btnTag) { //播放按钮
            selectedIndex = btnTag
        } else {                                //非播放按钮
            btn.isSelected = false
            btn.isUserInteractionEnabled = true
        }
        
    }
    
    func versionTabBarSelectedIndex(_ index: NSInteger) -> Bool {
        if index == 2 {  //是播放界面
             //播放界面模态展示
            let playVC = TDPublishViewController()
            let navi = TDBaseNavigationViewController.init(rootViewController: playVC)
            present(navi, animated: true, completion: nil)
            
            return false
        }
        return true
    }
    
}


















