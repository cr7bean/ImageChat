//
//  ICImageInfoMenuButton.m
//  ImageChat
//
//  Created by FigureWang on 17/1/5.
//  Copyright © 2017年 Long. All rights reserved.
//

#import "ICImageInfoMenuButton.h"
#import "UIColor+ICHex.h"
#import "UIButton+ICHelper.h"

static const NSUInteger kTitleFontSize = 13;
static const NSUInteger kTitleColor = 0x999999;
static const NSUInteger kTitleColorHighlighted = 0x87541E;

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
        [self ic_imagePosition:ImagePositionLeft];
//        [self.titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisHorizontal];
        
    }
    return self;
}

+ (instancetype)initWithTitle:(NSString *)title
                        image:(UIImage *)image {
    return [[self alloc] initWithTitle:title image:image];
}

@end
