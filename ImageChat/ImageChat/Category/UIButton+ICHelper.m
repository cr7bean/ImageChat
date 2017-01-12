//
//  UIButton+ICHelper.m
//  ImageChat
//
//  Created by FigureWang on 17/1/12.
//  Copyright © 2017年 Long. All rights reserved.
//



#import "UIButton+ICHelper.h"

static const CGFloat kDefaultSpace = 5.0f;

@implementation UIButton (ICHelper)

- (void)ic_imagePosition:(ImagePosition)position space:(CGFloat)space {
    
    CGFloat imageWidth = self.imageView.ic_intrinsicWidth;
    CGFloat imageHeight = self.imageView.ic_intrinsicHeight;
    CGFloat labelWidth = self.titleLabel.ic_intrinsicWidth;
    CGFloat labelHeight = self.titleLabel.ic_intrinsicHeight;
    
    CGFloat offsetX = imageWidth/2+labelWidth/2;
    CGFloat offsetY = imageHeight/2 + labelHeight/2+space;
    CGFloat differentialHeight = (imageHeight-labelHeight) ?:0;
    
    switch (position) {
        case ImagePositionLeft: {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, -space, 0, space);
            self.contentEdgeInsets = UIEdgeInsetsMake(0, space, 0, 0);
            break;
        }
        case ImagePositionRight: {
            self.imageEdgeInsets = UIEdgeInsetsMake(0, space+labelWidth+imageWidth, 0, -(space+labelWidth+imageWidth));
            self.contentEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, space+imageWidth);
            break;
        }
        case ImagePositionTop: {
            self.imageEdgeInsets = UIEdgeInsetsMake(-offsetY, offsetX, offsetY, -offsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(imageHeight+space-differentialHeight/2, -imageWidth, -differentialHeight/2, 0);
            break;
        }
        case ImagePositionBottom: {
            self.imageEdgeInsets = UIEdgeInsetsMake(offsetY, offsetX, -offsetY, -offsetX);
            self.contentEdgeInsets = UIEdgeInsetsMake(-differentialHeight/2, -imageWidth, imageHeight+space-differentialHeight/2, 0);
            break;
        }
    };
}


- (void)ic_imagePosition:(ImagePosition)position {
    [self ic_imagePosition:position space:kDefaultSpace];
}

@end
