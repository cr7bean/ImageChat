//
//  ICMeTableHeadView.m
//  ImageChat
//
//  Created by FigureWang on 17/1/18.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
#import "ICMeTableHeadView.h"
#import "UIColor+ICHex.h"

static const NSUInteger kMainViewColor = 0x607D8B;
static const NSUInteger kTextColor = 0xACACAC;
static const NSUInteger kLineViewColor = 0x979797;
static const CGFloat kTextFontSize = 13;
static const CGFloat kMainViewScale = 0.5;
static const CGFloat kButtonFontSize = 18;
static const CGFloat kLabelTop = 15;

@interface ICMeTableHeadView ()

@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIView *loginBlankView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation ICMeTableHeadView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configurateSubviews];
        [self makeConstraint];
    }
    return self;
}

- (void)configurateSubviews {
    self.loginButton = [UIButton new];
    self.loginBlankView = [UIView new];
    self.avatarImageView = [UIImageView new];
    self.userNameLabel = [UILabel new];
    self.lineView = [UIView new];
    
    [self addSubview:self.loginButton];
    [self addSubview:self.loginBlankView];
    [self.loginBlankView addSubview:self.avatarImageView];
    [self.loginBlankView addSubview:self.userNameLabel];
    [self.loginBlankView addSubview:self.lineView];
    
    self.loginBlankView.hidden = YES;
    
    self.backgroundColor = [UIColor ic_colorWithHex:kMainViewColor];
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*kMainViewScale);
    
    [self.loginButton setTitle:@"登录/注册" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.loginButton.titleLabel.font = [UIFont systemFontOfSize:kButtonFontSize];
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"login_button"] forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(loginButtonAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.loginBlankView.backgroundColor = [UIColor whiteColor];
    self.avatarImageView.image = [UIImage imageNamed:@"login_avatar"];
    self.userNameLabel.text = @"weixinyi1991";
    self.userNameLabel.font = [UIFont systemFontOfSize:kTextFontSize];
    self.userNameLabel.textColor = [UIColor ic_colorWithHex:kTextColor];
    self.lineView.backgroundColor = [UIColor ic_colorWithHex:kLineViewColor alpha:0.2];
}

- (void)makeConstraint {
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(CGPointZero);
    }];
    [self.loginBlankView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(self.mas_height).multipliedBy(0.5);
    }];
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.mas_centerX);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.top.mas_equalTo(self.avatarImageView.mas_bottom).offset(kLabelTop);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}

- (void)switchToLoginState {
    self.loginBlankView.hidden = NO;
    self.loginButton.hidden = YES;
}

- (void)loginButtonAction {
    [self.delegate ICMeTableHeadView:self buttonAction:self.loginButton];
}




@end
