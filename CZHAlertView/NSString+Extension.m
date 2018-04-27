

#import "NSString+Extension.h"
@implementation NSString (Extension)



- (CGSize)sizeWithFont:(UIFont *)font maxH:(CGFloat)maxH
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(MAXFLOAT, maxH);
    
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW
{
  
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, MAXFLOAT);
    
    
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

- (CGSize)sizeWithFont:(UIFont *)font
{
    return [self sizeWithFont:font maxW:MAXFLOAT];
}


- (NSString *)czh_interceptFrontPartWithtRangeString:(NSString *)rangeString {

    if ([self containsString:rangeString]) {
        NSRange range = [self rangeOfString:rangeString];
        NSUInteger location = range.location;
        
        if (location != NSNotFound) {
            return [self substringToIndex:location];
        } else {
            return self;
        }
    } else {
        return self;
    }
}



@end
