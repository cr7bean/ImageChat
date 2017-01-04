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



@end
