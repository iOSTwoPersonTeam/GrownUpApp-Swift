//
//  TDPageViewController.swift
//  成长之路APP-Swift
//
//  Created by mac on 2017/11/10.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

// MARK: --代理协议
protocol TDPageViewControllerDelegate: NSObjectProtocol {
    // MARK: 获取当前子控制器的角标
    func tdPageCurrentSubControlerIndex(index: NSInteger, pageViewController: TDPageViewController)
}

class TDPageViewController: UIViewController {
    
    // MARK: --设置代理属性
    weak var delegate:  TDPageViewControllerDelegate?
    
    // MARK: --定义属性
    /// 所有子控制器 --定义变量
    var controllers: [UIViewController] = [UIViewController]()
    /// 父控制器   ---定义变量
    var superController: UIViewController!
    var pageVC: UIPageViewController!
    
    // MARK: -init
    init(superController: UIViewController, controllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        // 存储数据
        self.controllers = controllers
        self.superController = superController
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: --生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        //初始化
        // 初始化
        setup()
    }

}

//MARK: ---初始化
extension TDPageViewController {
    
    ///初始化page控制器
    fileprivate func setup() {
        if controllers.count == 0 {
            return
        }
        let options: [String : Any] = [UIPageViewControllerOptionSpineLocationKey: NSNumber(integerLiteral: UIPageViewControllerSpineLocation.none.rawValue)]
        // 初始化UIPageViewController
        let page = UIPageViewController.init(transitionStyle: UIPageViewControllerTransitionStyle.scroll, navigationOrientation: UIPageViewControllerNavigationOrientation.horizontal, options: options)
        page.delegate = self
        page.dataSource = self
        page.setViewControllers([controllers.first!], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
        page.view.frame = self.view.frame
        pageVC = page
        
        self.view.addSubview(page.view)
    
    }
}

// MARK: --向外提供的方法
extension TDPageViewController {
    // MARK: 设置当子控制器
    func setCurrnetSubControllerWith(index: NSInteger) {
        pageVC.setViewControllers([controllers[index]], direction: UIPageViewControllerNavigationDirection.forward, animated: false, completion: nil)
    }
}


// MARK: --UIPageViewController代理与数据源
extension TDPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    ///前一个控制器
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?  {
        guard let index = controllers.index(of: viewController) else {
            return nil
        }
        if index == 0 || index == NSNotFound {
            return nil
        }
        return controllers[index - 1]
    }

    /// 后一个控制器
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = self.controllers.index(of: viewController) else {
            return nil
        }
        if index == NSNotFound || index == controllers.count - 1 {
            return nil
        }
        
        return controllers[index + 1]
    }
    
    /// 返回控制器数量
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    /// 跳转到另一个控制器界面时调用
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let vc = pageViewController.viewControllers?[0] else {
            return
        }
        let index = indexForViewController(controller: vc)
        //代理方法
        delegate?.tdPageCurrentSubControlerIndex(index: index, pageViewController: self)
        
    }
    
    /// 当前子控制器的角标
    func indexForViewController(controller: UIViewController) -> NSInteger {
        return controllers.index(of: controller)!
    }
    
}

















