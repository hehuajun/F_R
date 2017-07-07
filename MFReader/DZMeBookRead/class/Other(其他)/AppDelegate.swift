//
//  AppDelegate.swift
//  DZMeBookRead
//
//  Created by 邓泽淼 on 16/8/31.
//  Copyright © 2016年 DZM. All rights reserved.
//

import UIKit
import WMPageController

@objc protocol HJAppDelegate:NSObjectProtocol {
    
    /// 程序即将退出
    @objc optional func applicationWillTerminate(_ application: UIApplication)
    
    /// 内存警告可能要终止程序
    @objc optional func applicationDidReceiveMemoryWarning(_ application: UIApplication)
    
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var delegate:HJAppDelegate?
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // 允许获取电量
        UIDevice.current.isBatteryMonitoringEnabled = true
        
        // 显示状态栏
        application.setStatusBarHidden(false, with: UIStatusBarAnimation.fade)
        
        window = UIWindow(frame:UIScreen.main.bounds)
        
        window!.makeKeyAndVisible()
        let isNotFirstLaunch = UserDefaults.standard.bool(forKey: "isNotFirstLaunch")
        // 如果是第一次安装打开App --- 显示引导页面
        if isNotFirstLaunch {
            let leadController = ZJLeadingPageController.init(pagesCount: 2, setupCellHandler: {(cell, indexPath) -> () in
                
                // 设置图片
                let imageName = NSString.init(format: "%ld.jpg", (indexPath?.row)!+1)
                cell?.imageView.image = UIImage.init(named: imageName as String)
                cell?.finishBtn.setTitle("立即体验", for: UIControlState.normal)
                cell?.finishBtn.setTitleColor(UIColor.green, for: UIControlState.normal)
                cell?.finishBtn.size = CGSize(width: 100, height: (cell?.finishBtn.frame.size.width)! as CGFloat)
                cell?.finishBtn.origin.y -= 40
                cell?.finishBtn.layer.cornerRadius = 50
                cell?.finishBtn.clipsToBounds = true
            }, finishHandler: {(finishBtn :UIButton?) -> Void in
                let mainVC = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "MainVC")
                self.window!.rootViewController = mainVC
                UserDefaults.standard.setValue(true, forKey: "isNotFirstLaunch")
            })
            leadController?.pageControl.pageIndicatorTintColor = UIColor.yellow;
            leadController?.pageControl.currentPageIndicatorTintColor = UIColor.purple;
            
            window!.rootViewController = leadController
        }else {
            let mainVC = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "MainVC")
            self.window!.rootViewController = mainVC
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    /// 程序即将退出
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        delegate?.applicationWillTerminate?(application)
    }
    
    /// 内存警告可能要终止程序
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        
        delegate?.applicationDidReceiveMemoryWarning?(application)
    }

}

