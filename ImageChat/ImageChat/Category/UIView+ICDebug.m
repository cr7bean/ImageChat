//
//  UIView+ICDebug.m
//  ImageChat
//
//  Created by FigureWang on 17/1/4.
//  Copyright © 2017年 Long. All rights reserved.
//

#import "UIView+ICDebug.h"

@implementation UIView (ICDebug)

- (NSString *)debugFrame {
    
    NSString *frameString = [NSString stringWithFormat:@"%@:%@", NSStringFromClass([self class]), NSStringFromCGRect(self.frame)];
    return frameString;
}
- (NSString *)debugSize {
    NSString *sizeString = [NSString stringWithFormat:@"%@:%@", NSStringFromClass([self class]), NSStringFromCGSize(self.frame.size)];
    DDLogDebug(@"size: %@", sizeString);
    return sizeString;
}
- (NSString *)debugIntrinsicSize {
    NSString *intrinsicSizeString = [NSString stringWithFormat:@"%@:%@", NSStringFromClass([self class]), NSStringFromCGSize(self.intrinsicContentSize)];
    DDLogDebug(@"intrinsicSize: %@", intrinsicSizeString);
    return intrinsicSizeString;
}


- (CGPoint)origin {
    return self.frame.origin;
}
- (CGFloat)x {
    return self.origin.x;
}
- (CGFloat)y {
    return self.origin.y;
}


- (CGSize)size {
    return self.frame.size;
}

- (CGFloat)height {
    return self.size.height;
}
- (CGFloat)width {
    return self.size.width;
}

- (CGFloat)ic_intrinsicHeight {
    return self.intrinsicContentSize.height;
}
- (CGFloat)ic_intrinsicWidth {
    return self.intrinsicContentSize.width;
}


- (void)setSize:(CGSize)size {
    self.frame = CGRectMake(self.x, self.y, size.width, size.height);
}


@end
