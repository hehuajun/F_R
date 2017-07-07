//
//  HJGlobalColor.swift
//  DZMeBookRead
//
//  Created by zyz on 17/1/19.
//  Copyright © 2017年 DZM. All rights reserved.
//

import Foundation

public class HJConst{
    public static let kIOS7 = Double(UIDevice.current.systemVersion.floatValue())>=7.0 ? 1 :0
    public static let kIOS8 = Double(UIDevice.current.systemVersion.floatValue())>=8.0 ? 1 :0
    
    public static let kScreenHeight = UIScreen.main.bounds.size.height
    public static let kScreenWidth = UIScreen.main.bounds.size.width
    
    public static let kTabBarColr = Helper.color(withHexString: "#d81e06")
    public static let kThemeColr = Helper.color(withHexString: "#d81e06")
    
    
    //swift中的写法
    public static func RGBCOLOR(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor
    {
        return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
    }
}
