//
//  HJReadDataManager.swift
//  DZMeBookRead
//
//  Created by hehuajun on 2017/7/18.
//  Copyright © 2017年 DZM. All rights reserved.
//

import UIKit

class HJReadDataManager: NSObject {
    
    /// 请求小说的目录结构
    ///
    /// - Parameters:
    ///   - withBookID: 小说ID
    ///   - callback: 回调
    class func reqChapters(withBookID:String,callback : @escaping (_ result:String) -> ()){
        DispatchQueue.global().async {
            usleep(500)
            DispatchQueue.main.async {
                callback("第一章 白发 \r\n 第二章 黑发 \r\n 第三章 宏发  ")
            }
        }
    }
    
    /// 请求小说内容
    ///
    /// - Parameters:
    ///   - withChapterID: 章节ID
    ///   - bookID: 小说ID
    ///   - callback: 回调
    /// - Returns: 是否已经存在本地数据
    class func reqChapterContent(withChapterID:String,bookID:String,callback : @escaping(_ result:String)->()) -> Bool{
        let model = ReadKeyedUnarchiver(bookID, fileName: withChapterID) as? HJReadChapterModel
        DispatchQueue.global().async {
            usleep(500)
            DispatchQueue.main.async {
                if model != nil && model?.chapterContent.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
                    callback((model?.chapterContent)!)
                }else{
                    callback("我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好我很好")
                }
            }
        }
        if model != nil && model?.chapterContent.trimmingCharacters(in: .whitespacesAndNewlines) != ""{
            return true
        }else{
            return false
        }

    }
}
