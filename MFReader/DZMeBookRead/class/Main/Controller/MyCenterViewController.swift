//
//  MyCenterViewController.swift
//  DZMeBookRead
//
//  Created by zyz on 17/3/20.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit
import WMPageController
import LLCycleScrollView

class MyCenterViewController: WMPageController{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
        self.menuViewLayoutMode = WMMenuViewLayoutMode.center
        self.titleColorSelected = HJConst.kThemeColr!
        self.progressColor = HJConst.kThemeColr
        self.menuViewStyle = WMMenuViewStyle.line
        self.view.backgroundColor = UIColor.white
        self.pageAnimatable = true
        self.menuItemWidth = HJConst.kScreenWidth/3;
        self.postNotification = true
        self.bounces = true
        self.title = "书城"
        let selectedImage = UIImage.init(named: "主页(1)")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        self.tabBarItem = UITabBarItem(title: "我的", image: UIImage.init(named: "主页"), selectedImage: selectedImage)
        self.setupNavigation()
    }
    func setupNavigation() {
        let sb = UISearchBar.init(frame: CGRect.init(x: 0, y: 0, width: HJConst.kScreenWidth - 20, height: 44))
        sb.placeholder = "输入搜索关键字"
        sb.showsCancelButton = true
        //        sb.delegate = self
        //找到取消按钮
        let cancelBtn = sb.value(forKey: "cancelButton") as! UIButton
        //修改标题和标题颜色
        cancelBtn.setTitle("取消", for: .normal)
        cancelBtn.setTitleColor(.gray, for: .normal)
        
        let tf = sb.value(forKey: "_searchField") as! UITextField
        tf.layer.borderColor = UIColor.lightGray.cgColor
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 12
        tf.leftViewMode = .never
        var frame = tf.frame
        frame.size.height = 44
        frame.origin.y = 0
        tf.frame = frame
        let bLeft = UIBarButtonItem.init(customView: sb)
        self.navigationItem.leftBarButtonItems = [bLeft]
        sb.becomeFirstResponder()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numbersOfChildControllers(in pageController: WMPageController) -> Int {
        return 4
    }
    override func pageController(_ pageController: WMPageController, viewControllerAt index: Int) -> UIViewController {
        var vc:UIViewController
        switch index {
        case 0:
            vc = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "CollectionViewController")
        case 1:
            vc = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "CollectionViewController")
        case 2:
            vc = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "CollectionViewController")
        default:
            vc = UIStoryboard(name: "Storyboard", bundle: nil).instantiateViewController(withIdentifier: "CollectionViewController")
            }
        return vc;
    }
    override func pageController(_ pageController: WMPageController, titleAt index: Int) -> String {
        if index == 0{
            return "收藏"
        }else if index  == 1 {
            return "历史"
        }else{
            return "下载"
        }
    }
}
