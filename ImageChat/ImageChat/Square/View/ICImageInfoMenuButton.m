//
//  ICImageInfoMenuButton.m
//  ImageChat
//
//  Created by FigureWang on 17/1/5.
//  Copyright © 2017年 Long. All rights reserved.
//

#import "ICImageInfoMenuButton.h"
#import "UIColor+ICHex.h"

static const NSUInteger kTitleFontSize = 13;
static const CGSize kImageSize = {18,18};
static const NSUInteger kTitleColor = 0x999999;
static const CGFloat kInnerSpace = 5;

@implementation ICImageInfoMenuButton


- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image {
    self = [super init];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setImage:image forState:UIControlStateNormal];
        self.imageView.size = kImageSize;
        self.titleLabel.textColor = [UIColor ic_colorWithHex:kTitleColor];
        self.titleLabel.font = [UIFont systemFontOfSize:kTitleFontSize];
    }
    return self;
}

- (void)layoutSubviews {
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -kInnerSpace, 0, kInnerSpace);
    self.contentEdgeInsets = UIEdgeInsetsMake(0, kInnerSpace, 0, 0);
}

@end
