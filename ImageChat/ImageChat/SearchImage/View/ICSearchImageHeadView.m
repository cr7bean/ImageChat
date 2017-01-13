//
//  ICSearchImageHeadView.m
//  ImageChat
//
//  Created by FigureWang on 17/1/13.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
#import "ICSearchImageHeadView.h"
#import "UIColor+ICHex.h"



static const CGFloat kHeight = 26;
static const CGFloat kLeft = 27;
static const CGFloat kLabelLeft = 21;
static const NSUInteger kLineViewColor = 0x979797;
static const NSUInteger kTextColor = 0xACACAC;
static const CGFloat kTextFontSize = 11;

@interface ICSearchImageHeadView ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation ICSearchImageHeadView

- (instancetype)init {
    self = [super init];
    if (self) {
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, kHeight);
        [self configurateSubviews];
        [self makeConstraint];
    }
    return self;
}

- (void)configurateSubviews {
    self.iconImageView = [UIImageView new];
    self.titleLabel = [UILabel new];
    self.lineView = [UIView new];
    
    [self addSubview:self.iconImageView];
    [self addSubview:self.titleLabel];
    [self addSubview:self.lineView];
    
    self.titleLabel.font = [UIFont systemFontOfSize:kTextFontSize];
    self.titleLabel.textColor = [UIColor ic_colorWithHex:kTextColor];
    self.lineView.backgroundColor = [UIColor ic_colorWithHex:kLineViewColor alpha:0.2];
}

- (void)makeConstraint {
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kLeft);
        make.bottom.mas_equalTo(0);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(kLabelLeft);
        make.centerY.mas_equalTo(self.iconImageView.mas_centerY);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.mas_equalTo(self.titleLabel.mas_right);
        make.right.mas_equalTo(0).priorityHigh();
        make.centerY.mas_equalTo(self.iconImageView.mas_centerY);
    }];
}

- (void)setContentType:(ViewContentType)contentType {
    switch (contentType) {
        case ViewContentTypeHistory:
            self.iconImageView.image = [UIImage imageNamed:@"clock"];
            self.titleLabel.text = @"搜索历史";
            break;
            
        case ViewContentTypeSuggestion:
            self.iconImageView.image = [UIImage imageNamed:@"eye"];
            self.titleLabel.text = @"猜你想搜";
            break;
    }
}

@end
