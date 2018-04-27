
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSString (Extension)


- (CGSize)sizeWithFont:(UIFont *)font maxH:(CGFloat)maxH;
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW;
- (CGSize)sizeWithFont:(UIFont *)font;


@end
