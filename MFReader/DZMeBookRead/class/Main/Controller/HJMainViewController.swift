//
//  HJMainViewController.swift
//  DZMeBookRead
//
//  Created by 邓泽淼 on 16/8/31.
//  Copyright © 2016年 DZM. All rights reserved.
//

import UIKit
import SnapKit
import WMPageController
import LLCycleScrollView


class HJMainViewController: UITabBarController,MBProgressHUDDelegate{
    var wmpcHome:WMPageController!
    var wmpcBookCity:WMPageController!
    var vcHome:MyCenterViewController!
    var vcBookCity:BookCityViewController!
    
    // MARK: -- 成员变量
    var readVC:HJReadPageController!
    // MARK: -- 页面管理
//    init() {
//        super.init(nibName: nil, bundle: nil)
//    }
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        let navHomeVC = getHomeVC()
//        let navBookCityVC = getBookCity()
//        self.viewControllers = NSArray.init(objects: navHomeVC,navBookCityVC) as? [UIViewController]
        UITabBar.appearance().tintColor =  HJConst.kThemeColr
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: -- 默认控制器
//    func getDefaultViewController() -> UITabBarController{
////        let mainVC = HJMainViewController()
//        let navHomeVC = self.getHomeVC()
//        let navBookCityVC = self.getBookCity()
//        
//        let tabVC = UITabBarController.init()
//        tabVC.viewControllers = NSArray.init(objects: navHomeVC,navBookCityVC) as? [UIViewController]
//        UITabBar.appearance().tintColor =  HJConst.kThemeColr
//        return tabVC
//    }
//    private func getHomeVC() -> UINavigationController{
//        vcHome = MyCenterViewController.init()
//        let navVC = vcHome.getHomeVC()
//        return navVC
//    }
//    func getBookCity() -> UINavigationController{
//        vcBookCity = BookCityViewController.init()
//        let navVC = vcBookCity.getBookCity()
//        return navVC
//    }
}
