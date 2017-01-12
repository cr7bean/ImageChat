//
//  UIButton+ICHelper.h
//  ImageChat
//
//  Created by FigureWang on 17/1/12.
//  Copyright © 2017年 Long. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ImagePosition) {
    ImagePositionLeft = 0,
    ImagePositionRight,
    ImagePositionTop,
    ImagePositionBottom
};

@interface UIButton (ICHelper)

- (void)ic_imagePosition:(ImagePosition)position;
- (void)ic_imagePosition:(ImagePosition)position
                   space:(CGFloat)space;

@end
