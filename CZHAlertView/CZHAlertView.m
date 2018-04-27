//
//  CZHAlertView.m
//  SexChat
//
//  Created by 程召华 on 2018/4/4.
//  Copyright © 2018年 程召华. All rights reserved.
//

#import "CZHAlertView.h"
#import "CZHHeader.h"
@interface CZHAlertButton : UIButton

///
@property (nonatomic, copy) void (^buttonHandler)(CZHAlertButton *button);

+ (instancetype)czh_alertbuttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont backgroundColor:(UIColor *)backgroundColor buttonHandler:(void (^)(CZHAlertButton *button))buttonHandler;

@end


@implementation CZHAlertButton

+ (instancetype)czh_alertbuttonWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont backgroundColor:(UIColor *)backgroundColor buttonHandler:(void (^)(CZHAlertButton *))buttonHandler {
    
    return [[CZHAlertButton alloc] initWithTitle:title titleColor:titleColor titleFont:titleFont backgroundColor:backgroundColor buttonHandler:buttonHandler];
    
}

- (instancetype)initWithTitle:(NSString *)title titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont backgroundColor:(UIColor *)backgroundColor buttonHandler:(void (^)(CZHAlertButton *))buttonHandler {
    
    if (self = [super init]) {
        
        [self setTitle:title forState:UIControlStateNormal];
        [self setTitleColor:titleColor forState:UIControlStateNormal];
        self.titleLabel.font = titleFont;
        self.backgroundColor = backgroundColor;
        
        self.buttonHandler = buttonHandler;
        
        [self addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)buttonClick {
    
    if (self.buttonHandler) {
        self.buttonHandler(self);
    }
}

@end


@implementation CZHAlertItem



+ (instancetype)czh_itemWithTitle:(NSString *)title style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *))handler {
    
    return [self czh_itemWithTitle:title titleFont:CZHGlobelNormalFont(18) titleColor:CZHThemeColor backgroundColor:CZHColor(0xffffff) style:style handler:handler];
}

/**
 *  传入title，字体大小 背景颜色 style:类型
 */
+ (instancetype)czh_itemWithTitle:(NSString *)title backgroundColor:(UIColor *)backgroundColor style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *item))handler {
    return [self czh_itemWithTitle:title titleFont:CZHGlobelNormalFont(18) titleColor:CZHThemeColor backgroundColor:backgroundColor style:style handler:handler];
}

+ (instancetype)czh_itemWithTitle:(NSString *)title titleFont:(UIFont *)titleFont style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *))handler {
    
    return [self czh_itemWithTitle:title titleFont:titleFont titleColor:CZHThemeColor backgroundColor:CZHColor(0xffffff) style:style handler:handler];
    
}

+ (instancetype)czh_itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *))handler {
    
    return [self czh_itemWithTitle:title titleFont:CZHGlobelNormalFont(18) titleColor:titleColor backgroundColor:CZHColor(0xffffff) style:style handler:handler];
    
}

+ (instancetype)czh_itemWithTitle:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *))handler {
    
    return [self czh_itemWithTitle:title titleFont:titleFont titleColor:titleColor backgroundColor:CZHColor(0xffffff) style:style handler:handler];
    
}

/**
 *  传入title 字体颜色 背景颜色 style:类型
 */
+ (instancetype)czh_itemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *item))handler {
    return [self czh_itemWithTitle:title titleFont:CZHGlobelNormalFont(18) titleColor:titleColor backgroundColor:backgroundColor style:style handler:handler];
}

/**
 *  传入title，字体大小 背景颜色 style:类型
 */
+ (instancetype)czh_itemWithTitle:(NSString *)title titleFont:(UIFont *)titleFont backgroundColor:(UIColor *)backgroundColor style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *item))handler {
    return [self czh_itemWithTitle:title titleFont:titleFont titleColor:CZHThemeColor backgroundColor:backgroundColor style:style handler:handler];
}

+ (instancetype)czh_itemWithTitle:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *item))handler {
    
    if (style == CZHAlertItemStyleCancel) {//如果是取消，默认字体
        titleFont = CZHGlobleFont(18);
    }
    
    CZHAlertItem *item = [[CZHAlertItem alloc] initWithTitle:title titleFont:titleFont titleColor:titleColor backgroundColor:backgroundColor style:style handler:handler];
    
    return item;
    
}

- (instancetype)initWithTitle:(NSString *)title titleFont:(UIFont *)titleFont titleColor:(UIColor *)titleColor backgroundColor:(UIColor *)backgroundColor style:(CZHAlertItemStyle)style handler:(void (^)(CZHAlertItem *item))handler {
    
    if (self = [super init]) {
        self.title = title;
        self.titleFont = titleFont;
        self.titleColor = titleColor;
        self.backgroundColor = backgroundColor;
        self.style = style;
        self.handler = handler;
    }
    
    return self;
}


@end


@interface CZHAlertView ()

/** 存放按钮 */
@property (nonatomic, strong) NSMutableArray *cancelItemArray;
///
@property (nonatomic, strong) NSMutableArray *itemArray;
/** 整体容器视图 */
@property (nonatomic, weak) UIView *wholeContainerView;
/** 标题 */
@property (nonatomic, weak) UILabel *titleLabel;
/** 消息描述 */
@property (nonatomic, weak) UILabel *messageLabel;
/** 在sheet模式下除了cancel以外的容器视图, alert模式下大小跟 wholeContainerView*/
@property (nonatomic, weak) UIView *buttonContainerView;


@end

@implementation CZHAlertView

- (NSMutableArray *)itemArray {
    if (!_itemArray) {
        _itemArray = [NSMutableArray array];
    }
    return _itemArray;
}

- (NSMutableArray *)cancelItemArray {
    if (!_cancelItemArray) {
        _cancelItemArray = [NSMutableArray array];
    }
    return _cancelItemArray;
}

+ (void)initialize {
    if (self != [CZHAlertView class]) return;
    
    CZHAlertView *appearance = [self appearance]; // 设置整体默认外观
    appearance.viewBackgroundColor = CZHColor(0xffffff);
    appearance.titleColor = CZHColor(0x333333);
    appearance.messageColor = CZHColor(0x666666);
    appearance.titleFont = CZHGlobelNormalFont(17);
    appearance.messageFont = CZHGlobelNormalFont(13);
//    appearance.attributedArray = nil;
    
}

+ (instancetype)czh_alertViewWithPreferredStyle:(CZHAlertViewStyle)preferredStyle {
    return [self czh_alertViewWithTitle:nil message:nil preferredStyle:preferredStyle animationStyle:CZHAlertViewAnimationStyleDefault];
}

+(instancetype)czh_alertViewWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(CZHAlertViewStyle)preferredStyle {
    return [self czh_alertViewWithTitle:title message:message preferredStyle:preferredStyle animationStyle:CZHAlertViewAnimationStyleDefault];
}

+ (instancetype)czh_alertViewWithPreferredStyle:(CZHAlertViewStyle)preferredStyle animationStyle:(CZHAlertViewAnimationStyle)animationStyle {
    
    return [self czh_alertViewWithTitle:nil message:nil preferredStyle:preferredStyle animationStyle:animationStyle];
    
}

+ (instancetype)czh_alertViewWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(CZHAlertViewStyle)preferredStyle animationStyle:(CZHAlertViewAnimationStyle)animationStyle {
    
    CZHAlertView *alertView = [[CZHAlertView alloc] initWithTitle:title message:message preferredStyle:preferredStyle animationStyle:animationStyle];
    
    return alertView;
    
}

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(CZHAlertViewStyle)preferredStyle animationStyle:(CZHAlertViewAnimationStyle)animationStyle {
    
    if (self = [super init]) {
        
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        
        self.title = title;
        self.message = message;
        self.preferredStyle = preferredStyle;
        self.animationStyle = animationStyle;
        
        [self czh_setUpView];
    }
    
    return self;
}

- (void)czh_setUpView {
    
    UIView *wholeContainerView = [[UIView alloc] init];
    wholeContainerView.backgroundColor = [UIColor clearColor];
    [self addSubview:wholeContainerView];
    self.wholeContainerView = wholeContainerView;
    
    
    UIView *buttonContainerView = [[UIView alloc] init];
    buttonContainerView.backgroundColor = self.viewBackgroundColor;
    [wholeContainerView addSubview:buttonContainerView];
    self.buttonContainerView = buttonContainerView;
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = self.titleColor;
    titleLabel.text = self.title;
    titleLabel.font = self.titleFont;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.numberOfLines = 0;
    [buttonContainerView addSubview:titleLabel];
    self.titleLabel = titleLabel;
    
    UILabel *messageLabel = [[UILabel alloc] init];
    messageLabel.text = self.message;
    messageLabel.textColor = self.messageColor;
    messageLabel.font = self.messageFont;
    messageLabel.numberOfLines = 0;
    messageLabel.textAlignment = NSTextAlignmentCenter;
    [buttonContainerView addSubview:messageLabel];
    self.messageLabel = messageLabel;
    
}


- (void)czh_addAlertItem:(CZHAlertItem *)alertItem {

    if (self.preferredStyle == CZHAlertViewStyleActionSheet) {//sheet类型
        
        if (alertItem.style == CZHAlertItemStyleCancel) {//取消类型
            [self.cancelItemArray addObject:alertItem];
        } else {//默认类型
            [self.itemArray addObject:alertItem];
        }
        
        if (self.cancelItemArray.count > 0) {//如果取消类型的按钮大于1个,保留最后一个放在取消类型数组，其他的移到默认类型
            
            NSMutableArray *templeArray = [NSMutableArray array];
            
            [templeArray addObjectsFromArray:self.cancelItemArray];
            
            for (NSInteger i = 0; i < self.cancelItemArray.count; i++) {
                
                if (templeArray.count - 1 != i) {//
                    
                    CZHAlertItem *item = templeArray[i];
                    
                    [self.cancelItemArray removeObject:item];
                    
                    [self.itemArray addObject:item];
                    
                }
            }
        }
        
    } else {
        [self.itemArray addObject:alertItem];
    }
    
}

- (void)setTitleColor:(UIColor *)titleColor {
    _titleColor = titleColor;
    self.titleLabel.textColor = titleColor;
}

- (void)setTitleFont:(UIFont *)titleFont {
    _titleFont = titleFont;
    self.titleLabel.font = titleFont;
}

- (void)setMessageColor:(UIColor *)messageColor {
    _messageColor = messageColor;
    self.messageLabel.textColor = messageColor;
}

- (void)setMessageFont:(UIFont *)messageFont {
    _messageFont = messageFont;
    self.messageLabel.font = messageFont;
}

- (void)setViewBackgroundColor:(UIColor *)viewBackgroundColor {
    _viewBackgroundColor = viewBackgroundColor;
    self.buttonContainerView.backgroundColor = viewBackgroundColor;
}



- (void)czh_showView {
    
//    NSAssert(self.title.length>0 || self.message.length >0 || self.itemArray.count > 0 || self.cancelItemArray.count > 0, @"please add a title or a message or a item");
    
    if (self.title.length <= 0 && self.message.length <= 0 && self.itemArray.count <=0 && self.cancelItemArray.count <=0) {

        NSLog(@"please add a title or a message or a item");

        return;
    }
    
    [self czh_calculateFrame];
    

    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    if (self.animationStyle == CZHAlertViewAnimationStyleDefault) {
        
        self.backgroundColor = CZHRGBColor(0x000000, 0.3);
        
    } else if (self.animationStyle == CZHAlertViewAnimationStyleTransparent) {
        
        self.backgroundColor = [UIColor clearColor];
        self.wholeContainerView.alpha = 0;
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundColor = CZHRGBColor(0x000000, 0.3);
            self.wholeContainerView.alpha = 1;
        }];
        
        
    }  else if (self.animationStyle == CZHAlertViewAnimationStyleSlideFromBottom) {
        
        self.backgroundColor = [UIColor clearColor];
        
        self.wholeContainerView.czh_y = ScreenHeight;
        
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundColor = CZHRGBColor(0x000000, 0.3);
            
            if (self.preferredStyle == CZHAlertViewStyleActionSheet) {
                self.wholeContainerView.czh_y = self.czh_height - self.wholeContainerView.czh_height;
            } else if (self.preferredStyle == CZHAlertViewStyleAlert) {
                self.wholeContainerView.czh_y = (self.czh_height - self.wholeContainerView.czh_height)*0.5;
            }
            
        }];
    }
}



- (void)czh_hideView {
    
    if (self.animationStyle == CZHAlertViewAnimationStyleDefault) {
        [self removeFromSuperview];
    } else if (self.animationStyle == CZHAlertViewAnimationStyleTransparent) {
        [UIView animateWithDuration:0.3 animations:^{
            
            self.backgroundColor = [UIColor clearColor];
            
            self.wholeContainerView.alpha = 0;
            
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    } else if (self.animationStyle == CZHAlertViewAnimationStyleSlideFromBottom) {
        [UIView animateWithDuration:0.3 animations:^{
            self.backgroundColor = [UIColor clearColor];
            
            self.wholeContainerView.czh_y = self.czh_height;
            
        } completion:^(BOOL finished) {
            [self removeFromSuperview];
        }];
    }
}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self czh_hideView];
//}



#pragma mark -- 计算
- (void)czh_calculateFrame {
    
    if (self.preferredStyle == CZHAlertViewStyleAlert) {//alert
        [self czh_calculateFrameForAlert];
    } else if (self.preferredStyle == CZHAlertViewStyleActionSheet) {//sheet
        [self czh_calculateFrameForActionSheet];
    }
    
}

- (void)czh_calculateFrameForAlert {
    
    CGFloat marginWidth = CZH_ScaleWidth(20);
    CGFloat marginHeight = CZH_ScaleWidth(15);
    
    CGFloat wholeContainerViewY = 0;
    CGFloat wholeContainerViewW = CZH_ScaleWidth(314);
    CGFloat wholeContainerViewX = (self.czh_width - wholeContainerViewW) * 0.5;
    CGFloat wholeContainerViewH = 0;

    
    CGFloat buttonContainerViewX = 0;
    CGFloat buttonContainerViewY = 0;
    CGFloat buttonContainerViewW = wholeContainerViewW;
    CGFloat buttonContainerViewH = 0;
 
    
    CGFloat titleLabelX = marginWidth;
    CGFloat titleLabelY = marginHeight;
    CGFloat titleLabelW = wholeContainerViewW - titleLabelX * 2;
    CGSize titleLabelSize = [_titleLabel.text sizeWithFont:_titleLabel.font maxW:titleLabelW];
    CGFloat titleLabelH = titleLabelSize.height;
    self.titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
    
    if (_titleLabel.text.length > 0) {
        buttonContainerViewH = CGRectGetMaxY(self.titleLabel.frame) + marginHeight;
    } else {

        if (_messageLabel.text.length > 0) {
            buttonContainerViewH = CZH_ScaleWidth(29);
        } else {
            buttonContainerViewH = 0;
        }
        
    }
    
    
    CGFloat messageLabelX = marginWidth;
    CGFloat messageLabelY = buttonContainerViewH;
    CGFloat messageLabelW = wholeContainerViewW - messageLabelX * 2;
    CGSize messageLabelSize = [_messageLabel.text sizeWithFont:_messageLabel.font maxW:titleLabelW];
    CGFloat messageLabelH = messageLabelSize.height;
    self.messageLabel.frame = CGRectMake(messageLabelX, messageLabelY, messageLabelW, messageLabelH);
    
    if (_messageLabel.text.length > 0) {
        
        buttonContainerViewH = CGRectGetMaxY(self.messageLabel.frame) + CZH_ScaleWidth(20);
        
    } else {
        
        buttonContainerViewH = buttonContainerViewH + 0;
        
    }
    
    
    
    if (self.itemArray.count > 0) {
        
        CALayer *firstLine = [CALayer layer];
        firstLine.backgroundColor = CZHColor(0xdfdfdf).CGColor;
        [_buttonContainerView.layer addSublayer:firstLine];
        
        CGFloat firstLineX = 0;
        CGFloat firstLineY = buttonContainerViewH;
        CGFloat firstLineW = buttonContainerViewW;
        CGFloat firstLineH = 0.5;
        firstLine.frame = CGRectMake(firstLineX, firstLineY, firstLineW, firstLineH);
        
        buttonContainerViewH = CGRectGetMaxY(firstLine.frame);
        
        NSInteger itemCount = self.itemArray.count;
        
        CGFloat buttonHeight = CZH_ScaleWidth(50);
        CGFloat lineHeight = 0.5;
        
        for (NSInteger i = 0; i < itemCount; i++) {
         
            CZHAlertItem *item = self.itemArray[i];
            
            CGFloat buttonX = 0;
            CGFloat buttonY = 0;
            CGFloat buttonW = 0;
            CGFloat buttonH = buttonHeight;
            
            CZHWeakSelf(self);
            CZHAlertButton *button = [CZHAlertButton czh_alertbuttonWithTitle:item.title titleColor:item.titleColor titleFont:item.titleFont backgroundColor:item.backgroundColor buttonHandler:^(CZHAlertButton *button) {
                CZHStrongSelf(self);
                if (item.handler) {
                    item.handler(item);
                }
                [self czh_hideView];
            
            }];
            
            if (itemCount == 2) {//两个按钮一排
                
                buttonW = buttonContainerViewW * 1.0 / 2;
                buttonX = buttonW * i;
                buttonY = buttonContainerViewH;

            } else {
                
                buttonY = buttonContainerViewH + buttonH * i;
                buttonX = 0;
                buttonW = buttonContainerViewW;
                
            }
            
            CGRect buttonF = CGRectMake(buttonX, buttonY, buttonW, buttonH);
            
            button.frame = buttonF;
            
            [_buttonContainerView addSubview:button];
            
            if (itemCount == 2) {
                if (i != itemCount - 1) {
                    CALayer *line = [CALayer layer];
                    line.backgroundColor = CZHColor(0xdfdfdf).CGColor;
                    [_buttonContainerView.layer addSublayer:line];
                    
                    CGFloat lineW = 0.5;
                    CGFloat lineX = buttonW * (i + 1) - lineW *0.5;
                    CGFloat lineY = buttonY;
                    CGFloat lineH = buttonH;
                    line.frame = CGRectMake(lineX, lineY, lineW, lineH);
                }
                
            } else {
                
                if (i != itemCount - 1) {
                    CALayer *line = [CALayer layer];
                    line.backgroundColor = CZHColor(0xdfdfdf).CGColor;
                    [_buttonContainerView.layer addSublayer:line];
                    
                    CGFloat lineW = buttonContainerViewW;
                    CGFloat lineX = 0;
                    CGFloat lineH = lineHeight;
                    CGFloat lineY = buttonY + buttonH - lineH;
                    line.frame = CGRectMake(lineX, lineY, lineW, lineH);
                }
                
            }
            
        }
        
        if (itemCount == 2) {
            buttonContainerViewH = buttonContainerViewH + buttonHeight;
        } else {
            buttonContainerViewH = buttonContainerViewH + (itemCount * (buttonHeight + lineHeight) - lineHeight);
        }
        
        wholeContainerViewH = buttonContainerViewH;
        
    } else {
        wholeContainerViewH = buttonContainerViewH;
    }
    
    
    _buttonContainerView.frame = CGRectMake(buttonContainerViewX, buttonContainerViewY, buttonContainerViewW, buttonContainerViewH);
    [_buttonContainerView cornerAllCornersWithCornerRadius:CZH_ScaleWidth(13)];
    
    wholeContainerViewY = (self.czh_height - wholeContainerViewH) * 0.5;
    _wholeContainerView.frame = CGRectMake(wholeContainerViewX, wholeContainerViewY, wholeContainerViewW, wholeContainerViewH);
    
}

- (void)czh_calculateFrameForActionSheet {
    
    CGFloat marginWidth = CZH_ScaleWidth(20);
    CGFloat marginHeight = CZH_ScaleWidth(15);
    
    CGFloat wholeContainerViewY = 0;
    CGFloat wholeContainerViewW = CZH_ScaleWidth(355);
    CGFloat wholeContainerViewX = (self.czh_width - wholeContainerViewW) * 0.5;
    CGFloat wholeContainerViewH = 0;
    
    
    CGFloat buttonContainerViewX = 0;
    CGFloat buttonContainerViewY = 0;
    CGFloat buttonContainerViewW = wholeContainerViewW;
    CGFloat buttonContainerViewH = 0;
    
    
    CGFloat titleLabelX = marginWidth;
    CGFloat titleLabelY = marginHeight;
    CGFloat titleLabelW = wholeContainerViewW - titleLabelX * 2;
    CGSize titleLabelSize = [_titleLabel.text sizeWithFont:_titleLabel.font maxW:titleLabelW];
    CGFloat titleLabelH = titleLabelSize.height;
    self.titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
    
    if (_titleLabel.text.length > 0) {
        buttonContainerViewH = CGRectGetMaxY(self.titleLabel.frame) + marginHeight;
    } else {
        
        if (_messageLabel.text.length > 0) {
            buttonContainerViewH = CZH_ScaleWidth(29);
        } else {
            buttonContainerViewH = 0;
        }
        
    }
    
    
    CGFloat messageLabelX = marginWidth;
    CGFloat messageLabelY = buttonContainerViewH;
    CGFloat messageLabelW = wholeContainerViewW - messageLabelX * 2;
    CGSize messageLabelSize = [_messageLabel.text sizeWithFont:_messageLabel.font maxW:titleLabelW];
    CGFloat messageLabelH = messageLabelSize.height;
    self.messageLabel.frame = CGRectMake(messageLabelX, messageLabelY, messageLabelW, messageLabelH);
    
    if (_messageLabel.text.length > 0) {
        
        buttonContainerViewH = CGRectGetMaxY(self.messageLabel.frame) + CZH_ScaleWidth(20);
        
    } else {
        
        buttonContainerViewH = buttonContainerViewH + 0;
        
    }
    
    NSInteger itemCount = self.itemArray.count;
    NSInteger cancelItemCount = self.cancelItemArray.count;
    
    if (itemCount + cancelItemCount > 0) {
        

        CGFloat buttonHeight = CZH_ScaleWidth(60);
        CGFloat lineHeight = 0.5;

        for (NSInteger i = 0; i < itemCount; i++) {
            
            CALayer *firstLine = [CALayer layer];
            firstLine.backgroundColor = CZHColor(0xdfdfdf).CGColor;
            [_buttonContainerView.layer addSublayer:firstLine];
            
            CGFloat firstLineX = 0;
            CGFloat firstLineY = buttonContainerViewH;
            CGFloat firstLineW = buttonContainerViewW;
            CGFloat firstLineH = lineHeight;
            firstLine.frame = CGRectMake(firstLineX, firstLineY, firstLineW, firstLineH);
            
            if (i == 0 && buttonContainerViewH == 0) {
                firstLine.hidden = YES;
            } else {
                firstLine.hidden = NO;
            }
            
            buttonContainerViewH = buttonContainerViewH + lineHeight;
            
            CZHAlertItem *item = self.itemArray[i];
            
            CGFloat buttonX = 0;
            CGFloat buttonY = buttonContainerViewH;
            CGFloat buttonW = buttonContainerViewW;
            CGFloat buttonH = buttonHeight;
            
            CGRect buttonF = CGRectMake(buttonX, buttonY, buttonW, buttonH);
            
        
            CZHWeakSelf(self);
            CZHAlertButton *button = [CZHAlertButton czh_alertbuttonWithTitle:item.title titleColor:item.titleColor titleFont:item.titleFont backgroundColor:item.backgroundColor buttonHandler:^(CZHAlertButton *button) {
                CZHStrongSelf(self);
                if (item.handler) {
                    item.handler(item);
                }
                [self czh_hideView];
            }];


            button.frame = buttonF;

            [_buttonContainerView addSubview:button];
            
            buttonContainerViewH = buttonContainerViewH + buttonH;
        }
        
        wholeContainerViewH = buttonContainerViewH;
        
        
        if (cancelItemCount > 0) {
            
            CZHAlertItem *item = [self.cancelItemArray firstObject];
            
            CGFloat buttonX = 0;
            CGFloat buttonY = buttonContainerViewH + CZH_ScaleWidth(10);
            CGFloat buttonW = buttonContainerViewW;
            CGFloat buttonH = buttonHeight;
            CZHWeakSelf(self);
            CZHAlertButton *button = [CZHAlertButton czh_alertbuttonWithTitle:item.title titleColor:item.titleColor titleFont:item.titleFont backgroundColor:item.backgroundColor buttonHandler:^(CZHAlertButton *button) {
                CZHStrongSelf(self);
                if (item.handler) {
                    item.handler(item);
                }
                [self czh_hideView];
            }];
            
            CGRect buttonF = CGRectMake(buttonX, buttonY, buttonW, buttonH);
            button.frame = buttonF;
            
            [_wholeContainerView addSubview:button];
            [button cornerAllCornersWithCornerRadius:CZH_ScaleWidth(13)];
            
            wholeContainerViewH = CGRectGetMaxY(buttonF) + marginHeight;
        } else {
            
            wholeContainerViewH = buttonContainerViewH + marginHeight;
            
        }
        
    } else {
         wholeContainerViewH = buttonContainerViewH;
    }
    
    
    
    _buttonContainerView.frame = CGRectMake(buttonContainerViewX, buttonContainerViewY, buttonContainerViewW, buttonContainerViewH);
    [_buttonContainerView cornerAllCornersWithCornerRadius:CZH_ScaleWidth(13)];
    
    
    wholeContainerViewY = self.czh_height - wholeContainerViewH;
    _wholeContainerView.frame = CGRectMake(wholeContainerViewX, wholeContainerViewY, wholeContainerViewW, wholeContainerViewH);
    
}

@end
