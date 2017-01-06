//
//  UIView+ICDebug.h
//  ImageChat
//
//  Created by FigureWang on 17/1/4.
//  Copyright © 2017年 Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ICDebug)

- (CGSize)ic_size;
- (CGPoint)ic_origin;
- (CGFloat)ic_height;
- (CGFloat)ic_width;
- (CGFloat)ic_x;
- (CGFloat)ic_y;

- (CGFloat)ic_intrinsicHeight;
- (CGFloat)ic_intrinsicWidth;

- (void)setIc_size:(CGSize)size;

@end
