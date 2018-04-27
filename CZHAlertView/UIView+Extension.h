//
//  UIView+Extension.h


#import <UIKit/UIKit.h>

@interface UIView (Extension)



@property (nonatomic, assign) CGFloat czh_top;
@property (nonatomic, assign) CGFloat czh_bottom;
@property (nonatomic, assign) CGFloat czh_left;
@property (nonatomic, assign) CGFloat czh_right;
@property (nonatomic, assign) CGFloat czh_x;
@property (nonatomic, assign) CGFloat czh_y;
@property (nonatomic, assign) CGFloat czh_centerX;
@property (nonatomic, assign) CGFloat czh_centerY;
@property (nonatomic, assign) CGFloat czh_width;
@property (nonatomic, assign) CGFloat czh_height;
@property (nonatomic, assign) CGSize czh_size;
@property (nonatomic, assign) CGPoint czh_origin;


- (BOOL)intersectWithView:(UIView *)view;

//找到view的父控制器
- (UIViewController *)czh_findViewController;
/**
 *  给view切圆角
 *  corners : 哪个角
 *  cornerRadii : 圆角size
 */
- (instancetype)cornerByRoundingCorners:(UIRectCorner)corners cornerRadius:(CGFloat)cornerRadius;
/**
 *  给view所有角切圆角
 *  cornerRadii : 圆角size
 */
- (instancetype)cornerAllCornersWithCornerRadius:(CGFloat)cornerRadius;


@end
