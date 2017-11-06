//
//  AppDelegate.swift
//  GrownUpApp-Swift
//
//  Created by mac on 2017/11/2.
//  Copyright © 2017年 hui. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    /*
      1.在swift中 文件可以不引入而是直接使用,因为编译器已经帮助引入了文件
      2.一个类如果遵循了一个协议,只需要在自己所继承的父类后面写上遵循的协议名称并以逗号","隔开,如果没有继承,那么直接在冒号后面写上协议名称即可
    */
    var window: UIWindow?
    var mainTabBarVC: TDBaseTabBarController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //1.创建APP窗口
        self.window = UIWindow(frame: UIScreen.main.bounds)
        //2.设置窗口颜色
        self.window?.backgroundColor = UIColor.orange
        //3.设置窗口跟控制器
        self.mainTabBarVC = TDBaseTabBarController()
        self.window?.rootViewController = self.mainTabBarVC
        //显示窗口
         self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

