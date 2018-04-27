//
//  CZHAlertView.h
//  SexChat
//
//  Created by 程召华 on 2018/4/4.
//  Copyright © 2018年 程召华. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CZHAlertItemStyle) {
    ///默认类型
    CZHAlertItemStyleDefault = 0,
    ///取消类型
    CZHAlertItemStyleCancel
};

typedef NS_ENUM(NSInteger, CZHAlertViewStyle) {
    ///底部
    CZHAlertViewStyleActionSheet = 0,
    ///弹窗
    CZHAlertViewStyleAlert
};

typedef NS_ENUM(NSInteger, CZHAlertViewAnimationStyle) {
    //没有动画直接显示
    CZHAlertViewAnimationStyleDefault = 0,
    ///渐变显示
    CZHAlertViewAnimationStyleTransparent,
    ///从下往上显示
    CZHAlertViewAnimationStyleSlideFromBottom
};

@interface CZHAlertItem : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIFont *titleFont;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, strong) UIColor *backgroundColor;
@property (nonatomic, assign) CZHAlertItemStyle style;
@property (nonatomic, copy) void (^handler)(CZHAlertItem *item);

/**
 *  传入title style:类型
 */
+ (instancetype)czh_itemWithTitle:(NSString *)title style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *item))handler;

/**
 *  传入title，字体大小 背景颜色 style:类型
 */
+ (instancetype)czh_itemWithTitle:(NSString *)title backgroundColor:(UIColor *)backgroundColor style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *item))handler;

/**
 *  传入title，字体大小 style:类型
 */
+ (instancetype)czh_itemWithTitle:(NSString *)title titleFont:(UIFont *)titleFont style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *item))handler;

/**
 *  传入title  字体颜色 style:类型
 */
+ (instancetype)czh_itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *item))handler;

/**
 *  传入title，字体大小 字体颜色 style:类型
 */
+ (instancetype)czh_itemWithTitle:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *item))handler;
/**
 *  传入title 字体颜色 背景颜色 style:类型
 */
+ (instancetype)czh_itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *item))handler;

/**
 *  传入title，字体大小 背景颜色 style:类型
 */
+ (instancetype)czh_itemWithTitle:(NSString *)title titleFont:(UIFont *)titleFont backgroundColor:(UIColor *)backgroundColor style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *item))handler;

/**
 *  传入title，字体大小 字体颜色 背景颜色 style:类型
 */
+ (instancetype)czh_itemWithTitle:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *item))handler;
@end


@interface CZHAlertView : UIView

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *message;
///类型
@property (nonatomic, assign) CZHAlertViewStyle preferredStyle;
///显示类型
@property (nonatomic, assign) CZHAlertViewAnimationStyle animationStyle;
///
@property (nonatomic, strong) UIFont *titleFont;
///
@property (nonatomic, strong) UIFont *messageFont;
///
@property (nonatomic, strong) UIColor *titleColor;
///
@property (nonatomic, strong) UIColor *messageColor;
///
@property (nonatomic, strong) UIColor *viewBackgroundColor;


+ (instancetype)czh_alertViewWithPreferredStyle:(CZHAlertViewStyle)preferredStyle;

+ (instancetype)czh_alertViewWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(CZHAlertViewStyle)preferredStyle;

+ (instancetype)czh_alertViewWithPreferredStyle:(CZHAlertViewStyle)preferredStyle animationStyle:(CZHAlertViewAnimationStyle)animationStyle;

+ (instancetype)czh_alertViewWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(CZHAlertViewStyle)preferredStyle animationStyle:(CZHAlertViewAnimationStyle)animationStyle;


- (void)czh_addAlertItem:(CZHAlertItem *)alertItem;

/**
 *  显示弹窗提示
 */
- (void)czh_showView;
/**
 *  移除视图
 */
- (void)czh_hideView;
@end
