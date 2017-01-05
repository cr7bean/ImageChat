//
//  UIView+ICDebug.h
//  ImageChat
//
//  Created by FigureWang on 17/1/4.
//  Copyright © 2017年 Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ICDebug)

- (NSString *)debugFrame;
- (NSString *)debugSize;
- (NSString *)debugIntrinsicSize;

- (CGSize)size;
- (CGPoint)origin;
- (CGFloat)height;
- (CGFloat)width;
- (CGFloat)x;
- (CGFloat)y;

- (CGFloat)intrinsicHeight;
- (CGFloat)intrinsicWidth;

- (void)setSize:(CGSize)size;

@end
