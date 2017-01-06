//
//  UIColor+ICHex.m
//  ImageChat
//
//  Created by FigureWang on 17/1/2.
//  Copyright © 2017年 Long. All rights reserved.
//

#import "UIColor+ICHex.h"

@implementation UIColor (ICHex)

+ (UIColor *)ic_colorWithHex:(NSUInteger)hex {
    return [UIColor ic_colorWithHex:hex alpha:1.0];
}

+ (UIColor *)ic_colorWithHex:(NSUInteger)hex
                    alpha:(CGFloat)alpha {
    CGFloat red, green, blue;
    red = ((CGFloat)((hex >> 16) & 0xFF)) / ((CGFloat)0xFF);
    green = ((CGFloat)((hex >> 8) & 0xFF)) / ((CGFloat)0xFF);
    blue = ((CGFloat)((hex >> 0) & 0xFF)) / ((CGFloat)0xFF);
    return [UIColor colorWithRed: red green:green blue:blue alpha:alpha];
}

@end
