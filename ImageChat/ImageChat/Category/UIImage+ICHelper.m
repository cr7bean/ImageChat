//
//  UIImage+ICHelper.m
//  ImageChat
//
//  Created by FigureWang on 17/1/17.
//  Copyright © 2017年 Long. All rights reserved.
//

#import "UIImage+ICHelper.h"

@implementation UIImage (ICHelper)

+ (UIImage *)ic_imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
