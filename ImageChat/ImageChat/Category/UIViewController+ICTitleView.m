//
//  UIViewController+ICTitleView.m
//  ImageChat
//
//  Created by FigureWang on 17/1/6.
//  Copyright © 2017年 Long. All rights reserved.
//

#import "UIViewController+ICTitleView.h"
#import "UIColor+ICHex.h"
#import "UIButton+ICHelper.h"
static const NSUInteger kFontSize = 18;

@implementation UIViewController (ICTitleView)

- (void)ic_titleViewWithText:(NSString *)text {
    UILabel *label = [UILabel new];
    label.text = text;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:kFontSize];
    label.ic_size = label.intrinsicContentSize;
    self.navigationItem.titleView = label;
}

- (void)ic_titleViewWithImage:(UIImage *)image text:(NSString *)text {
    UIButton *button = [UIButton new];
    button.userInteractionEnabled = NO;
    [button setImage:image forState:UIControlStateNormal];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:kFontSize];
    [button ic_imagePosition:ImagePositionLeft];
    button.ic_size = button.intrinsicContentSize;
    self.navigationItem.titleView = button;
}

@end
