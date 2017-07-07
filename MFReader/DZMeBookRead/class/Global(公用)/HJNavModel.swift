//
//  HJNavModel.swift
//  DZMeBookRead
//
//  Created by zyz on 17/1/9.
//  Copyright © 2017年 DZM. All rights reserved.
//

import Foundation
//频道实体
public class ChannelModel: NSObject {
    var id:NSNumber? = 0
    var title:NSString = ""
}
//图像实体
public class Image: NSObject {
    var src:NSString!
    var width:NSNumber!
    var height:CGFloat!
    var ext:NSString!
}
//章节实体
public class ChapterModel: NSObject {
    var id:NSNumber!                        //ID 编号
    var title:NSString!                     //标题
}
//小说实体
public class BookModel: NSObject {
    var id:NSNumber!                        //ID编号
    var title:NSString!                     //书名
    var desc:NSString!                      //描述
    var cover:NSString!                     //封面
    var contentType:NSString!               //类型
    let bookType:HJBookType = HJBookType.novel      //书名的类型：小说、漫画
    
    var author:NSString!                    //作者
    var channels:[ChannelModel]!            //所属频道
    var currentChannel:ChannelModel!        //当前频道
    var lastestChapterList:[ChapterModel]!  //服务器上的最新的差异目录
    var localChapterList:[ChapterModel]!    //本地目录
    var currentChapter:ChapterModel!        //当前章节
    var currentChapterContent:NSString!     //当前章节内容
}
public class HJNavModel: NSObject {
    class var sharedInstance : HJNavModel {
        struct Static {
            static let instance : HJNavModel = HJNavModel()
        }
        return Static.instance
    }
    var _novelChannels:[ChannelModel]?
    
    var novelChannels:[ChannelModel]                    //频道列表
    {
        get{
            if _novelChannels == nil {
                let m1:ChannelModel? = ChannelModel()
                m1?.id = 1
                m1?.title = "推荐"
                let m2:ChannelModel? = ChannelModel()
                m2?.id = 2
                m2?.title = "男生"
                let m3:ChannelModel? = ChannelModel()
                m3?.id = 3
                m3?.title = "女生"
                let m4:ChannelModel? = ChannelModel()
                m4?.id = 4
                m4?.title = "热更"
                let m5:ChannelModel? = ChannelModel()
                m5?.id = 5
                m5?.title = "排行"
                let m6:ChannelModel? = ChannelModel()
                m6?.id = 6
                m6?.title = "完本"
                
                _novelChannels = [m1!,m2!,m3!,m4!,m5!,m6!]
            }
            return _novelChannels!
        }
        set{
            _novelChannels = newValue
        }
    }
    var novelScrollList:[Image]!                        //书城中的滚动列表数据源
    var novelScrollChangeTimeInterval:NSNumber = 2      //书城中的滚动列表切换时间差
    var broadcastList:[BookModel]!                      //书城中的广播列表
    var broadcastChangeTimeInterval:NSNumber! = 2       //书城中的广告切换时间差
    
}
