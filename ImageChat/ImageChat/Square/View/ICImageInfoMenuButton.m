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
static const CGSize kImageSize = {16,16};
static const NSUInteger kTitleColor = 0x999999;
static const NSUInteger kTitleColorHighlighted = 0x87541E;
static const CGFloat kInnerSpace = 5;

@implementation ICImageInfoMenuButton


- (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image {
    self = [super init];
    if (self) {
        [self setTitle:title forState:UIControlStateNormal];
        [self setImage:image forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:kTitleFontSize];
        [self setTitleColor:[UIColor ic_colorWithHex:kTitleColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor ic_colorWithHex:kTitleColorHighlighted] forState:UIControlStateHighlighted];
    }
    return self;
}

+ (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image {
    return [[self alloc] initWithTitle:title image:image];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView.ic_size = kImageSize;
    self.imageEdgeInsets = UIEdgeInsetsMake(0, -kInnerSpace, 0, kInnerSpace);
    self.contentEdgeInsets = UIEdgeInsetsMake(0, kInnerSpace, 0, 0);
}

@end
