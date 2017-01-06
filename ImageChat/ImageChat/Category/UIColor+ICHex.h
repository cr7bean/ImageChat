//
//  UIColor+ICHex.h
//  ImageChat
//
//  Created by FigureWang on 17/1/2.
//  Copyright © 2017年 Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ICHex)

+ (UIColor *)ic_colorWithHex:(NSUInteger)hex;
+ (UIColor *)ic_colorWithHex:(NSUInteger)hex
                       alpha:(CGFloat)alpha;
@end
