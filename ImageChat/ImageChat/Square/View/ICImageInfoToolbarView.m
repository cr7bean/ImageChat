//
//  ICImageInfoToolbarView.m
//  ImageChat
//
//  Created by FigureWang on 17/1/5.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
#import "ICImageInfoToolbarView.h"
#import "ICImageInfoMenuButton.h"

static const CGFloat kSpace = 15;

@interface ICImageInfoToolbarView ()

@property (nonatomic, strong) ICImageInfoMenuButton *collectButton;
@property (nonatomic, strong) ICImageInfoMenuButton *downloadButton;
@property (nonatomic, strong) ICImageInfoMenuButton *deleteButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, copy) NSArray *buttons;

@end

@implementation ICImageInfoToolbarView


- (instancetype)init {
    self = [super init];
    if (self) {
        [self configurateSubviews];
        [self makeConstraint];
    }
    return self;
}

- (void)configurateSubviews {
    self.collectButton = [[ICImageInfoMenuButton alloc] initWithTitle:@"收藏" image:[UIImage imageNamed:@"collection"]];
    self.downloadButton = [[ICImageInfoMenuButton alloc] initWithTitle:@"下载" image:[UIImage imageNamed:@"download"]];
    self.deleteButton = [[ICImageInfoMenuButton alloc] initWithTitle:@"删除" image:[UIImage imageNamed:@"delete"]];
    self.shareButton = [UIButton new];
    [self.shareButton setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    
    self.buttons = @[self.collectButton, self.downloadButton, self.deleteButton, self.shareButton];
}

- (void)makeConstraint {
    CGFloat distributeSpace;
    CGFloat contentWidth;
    
    for (UIButton *button in self.buttons) {
        [self addSubview:button];
        contentWidth += button.ic_intrinsicWidth;
    }
    distributeSpace = (SCREEN_WIDTH - kSpace*2 - contentWidth)/3;
    [self.buttons mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:distributeSpace leadSpacing:kSpace tailSpacing:kSpace];
    [self.buttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
    }];
}




@end
