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
static const CGFloat kButtonsLength = 200;

@interface ICImageInfoToolbarView ()

@property (nonatomic, strong) ICImageInfoMenuButton *collectButton;
@property (nonatomic, strong) ICImageInfoMenuButton *downloadButton;
@property (nonatomic, strong) ICImageInfoMenuButton *deleteButton;
@property (nonatomic, strong) UIButton *shareButton;
@property (nonatomic, copy) NSArray *buttons;

@property (nonatomic, strong) UIImageView *lineImageView;



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
    self.collectButton = [ICImageInfoMenuButton initWithTitle:@"收藏" image:[UIImage imageNamed:@"collect"]];
    self.downloadButton = [ICImageInfoMenuButton initWithTitle:@"下载" image:[UIImage imageNamed:@"download"]];
    self.deleteButton = [ICImageInfoMenuButton initWithTitle:@"删除" image:[UIImage imageNamed:@"delete"]];
    self.shareButton = [UIButton new];
    [self.shareButton setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
    self.buttons = @[self.collectButton, self.downloadButton, self.deleteButton, self.shareButton];
    self.lineImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg2"]];
    [self addSubview:self.lineImageView];
    
    [self.collectButton addTarget:self action:@selector(collect:) forControlEvents:UIControlEventTouchUpInside];
    [self.downloadButton addTarget:self action:@selector(download:) forControlEvents:UIControlEventTouchUpInside];
    [self.deleteButton addTarget:self action:@selector(delete:) forControlEvents:UIControlEventTouchUpInside];
    [self.shareButton addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)makeConstraint {
    CGFloat distributeSpace;
    for (UIButton *button in self.buttons) {
        [self addSubview:button];
    }
    distributeSpace = (SCREEN_WIDTH - kButtonsLength - kSpace*2)/3;
    [self.buttons mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:distributeSpace leadSpacing:kSpace tailSpacing:kSpace];
    [self.buttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
    }];
    [self.lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}

#pragma mark - Button Action

- (void)collect:(UIButton *)button {
    if (self.delegate) {
        [self.delegate ICImageInfoToolbarView:self didTouched:ImageInfoToolbarActionTypeCollect];
    }
}
- (void)download:(UIButton *)button {
    if (self.delegate) {
       [self.delegate ICImageInfoToolbarView:self didTouched:ImageInfoToolbarActionTypeDownload];
    }
}
- (void)delete:(UIButton *)button {
    if (self.delegate) {
        [self.delegate ICImageInfoToolbarView:self didTouched:ImageInfoToolbarActionTypeDelete];
    }
}
- (void)share:(UIButton *)button {
    if (self.delegate) {
        [self.delegate ICImageInfoToolbarView:self didTouched:ImageInfoToolbarActionTypeShare];
    }
}






@end
