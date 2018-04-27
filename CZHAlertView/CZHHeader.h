//
//  CZHHeader.h
//  CZHAlertView
//
//  Created by 程召华 on 2018/4/27.
//  Copyright © 2018年 程召华. All rights reserved.
//

#ifndef CZHHeader_h
#define CZHHeader_h

#ifdef __OBJC__

#import "UIView+Extension.h"
#import "NSString+Extension.h"

#endif


/**屏幕宽度*/
#define ScreenWidth ([UIScreen mainScreen].bounds.size.width)
/**屏幕高度*/
#define ScreenHeight ([UIScreen mainScreen].bounds.size.height)


///weakSelf
#define CZHWeakSelf(type)  __weak typeof(type) weak##type = type;
#define CZHStrongSelf(type)  __strong typeof(type) type = weak##type;

/**全局字体*/
#define CZHGlobleFont(__VA_ARGS__)  ([UIFont fontWithName:@"PingFang-SC-Medium" size:CZH_ScaleFont(__VA_ARGS__)])
#define CZHGlobelBoldFont(__VA_ARGS__) ([UIFont boldSystemFontOfSize:CZH_ScaleFont(__VA_ARGS__)])
#define CZHGlobelNormalFont(__VA_ARGS__) ([UIFont systemFontOfSize:CZH_ScaleFont(__VA_ARGS__)])

/**宽度比例*/
#define CZH_ScaleWidth(__VA_ARGS__)  ([UIScreen mainScreen].bounds.size.width/375)*(__VA_ARGS__)

/**高度比例*/
#define CZH_ScaleHeight(__VA_ARGS__)  ([UIScreen mainScreen].bounds.size.height/667)*(__VA_ARGS__)

/**字体比例*/
#define CZH_ScaleFont(__VA_ARGS__)  ([UIScreen mainScreen].bounds.size.width/375)*(__VA_ARGS__)

#define CZHColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define CZHRGBColor(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:a]

#define CZHThemeColor CZHColor(0xff4636)

#endif /* CZHHeader_h */
