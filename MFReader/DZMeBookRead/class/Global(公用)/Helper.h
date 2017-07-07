//
//  Helper.h
//  Monopoly
//
//  Created by zyz on 16/6/23.
//  Copyright © 2016年 zyz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"

@interface Helper : NSObject

+ (UIColor *) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor *) colorWithHex:(NSInteger)hexValue;
+ (NSString *) hexFromUIColor: (UIColor*) color;
+ (UIColor *) colorWithHexString: (NSString *) stringToConvert;

@end
