//
//  UIViewController+ICTitleView.h
//  ImageChat
//
//  Created by FigureWang on 17/1/6.
//  Copyright © 2017年 Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (ICTitleView)

- (void)ic_titleViewWithText:(NSString *)text;
- (void)ic_titleViewWithImage:(UIImage *)image
                         text:(NSString *)text;

@end
