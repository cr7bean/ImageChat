//
//  ICImageInfoMainView.m
//  ImageChat
//
//  Created by FigureWang on 17/1/5.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
@import SDVersion;
#import "ICImageInfoMainView.h"
#import "UIColor+ICHex.h"

static const NSUInteger kTextColor = 0x999999;
static const NSUInteger kNameColor = 0xACACAC;
static const NSUInteger kTextFontSize = 13;
static const NSUInteger kLineViewColor = 0x979797;

static const CGFloat kAvatarLeft = 15;
static const CGSize kAvatarSize = {32,32};
static CGFloat kAvatarTop = 15;
static const CGFloat kNameLabelLeft = 10;
static const CGFloat kLocationLabelRight = -12;
static const CGFloat kLocationLabelTop = 15;
static const CGFloat kLineViewHeight = 1;
static const CGFloat kPromptViewSpace = 15;


static CGFloat kImageScale = 0.85;

@interface ICImageInfoMainView ()

@property (nonatomic, strong) UIView *headBlankView;
@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIImageView *sceneImageView;
@property (nonatomic, strong) UIView *locationBlankView;
@property (nonatomic, strong) UILabel *locationLabel;
@property (nonatomic, strong) UIView *separatorLineView;
@property (nonatomic, strong) UIView *commentBlankView;
@property (nonatomic, strong) UIView *promptView;
@property (nonatomic, strong) UILabel *promptLabel;
@property (nonatomic, strong) UILabel *commentLabel;

@end

@implementation ICImageInfoMainView

#pragma mark - init

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configurateSubviews];
        [self makeConstraint];
        
        [self configurateViewContent];
    }
    return self;
}

#pragma mark - Configurate Subiews

- (void)configurateSubviews {
    self.headBlankView = [UIView new];
    self.avatarImageView = [UIImageView new];
    self.nameLabel = [UILabel new];
    self.sceneImageView = [UIImageView new];
    self.locationBlankView = [UIView new];
    self.locationLabel = [UILabel new];
    self.separatorLineView = [UIView new];
    self.commentBlankView = [UIView new];
    self.commentLabel = [UILabel new];
    
    [self addSubview:self.headBlankView];
    [self addSubview:self.sceneImageView];
    [self addSubview:self.locationBlankView];
    [self addSubview:self.commentBlankView];
    
    [self.headBlankView addSubview:self.avatarImageView];
    [self.headBlankView addSubview:self.nameLabel];
    [self.locationBlankView addSubview:self.locationLabel];
    [self.locationBlankView addSubview:self.separatorLineView];
    [self.commentBlankView addSubview:self.promptView];
    [self.commentBlankView addSubview:self.commentLabel];
    
    self.separatorLineView.backgroundColor = [UIColor ic_colorWithHex:kLineViewColor alpha:0.2];
    self.nameLabel.textColor = [UIColor ic_colorWithHex:kNameColor];
    self.nameLabel.font = [UIFont systemFontOfSize:kTextFontSize];
    self.locationLabel.textColor = [UIColor ic_colorWithHex:kTextColor];
    self.locationLabel.font = [UIFont systemFontOfSize:kTextFontSize];
    self.commentLabel.textColor = [UIColor ic_colorWithHex:kTextColor];
    self.commentLabel.font = [UIFont systemFontOfSize:kTextFontSize];
    self.headBlankView.backgroundColor = [UIColor whiteColor];
    self.locationBlankView.backgroundColor = [UIColor whiteColor];
    self.commentBlankView.backgroundColor = [UIColor whiteColor];
}


#pragma mark - Constraints

- (void)makeConstraint {
    // 针对4s 单独设置
    if ([SDVersion deviceSize] == Screen3Dot5inch) {
        kImageScale = 0.55;
        kAvatarTop = 7.5;
    }
    
    
    [self.headBlankView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(0);
    }];
    [self.avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kAvatarLeft);
        make.size.mas_equalTo(kAvatarSize);
        make.top.mas_equalTo(kAvatarTop);
        make.centerY.mas_equalTo(0);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatarImageView.mas_right).offset(kNameLabelLeft);
        make.centerY.mas_equalTo(0);
    }];
    [self.sceneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.headBlankView.mas_bottom);
        make.height.mas_equalTo(self.sceneImageView.mas_width).multipliedBy(kImageScale);
    }];
    [self.locationBlankView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.sceneImageView.mas_bottom);
    }];
    [self.locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(kLocationLabelRight);
        make.top.mas_equalTo(kLocationLabelTop);
        make.centerY.mas_equalTo(0);
    }];
    [self.separatorLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(kLineViewHeight);
    }];
    [self.commentBlankView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.locationBlankView.mas_bottom);
    }];
    [self.promptView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(kPromptViewSpace);
        make.right.mas_equalTo(-kPromptViewSpace);
    }];
    [self.commentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.promptView.mas_bottom).offset(kPromptViewSpace);
        make.left.mas_equalTo(kPromptViewSpace*2);
        make.right.mas_equalTo(-kPromptViewSpace);
        make.bottom.mas_equalTo(0).priorityHigh();
    }];
    
    
    
    [self.locationLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.commentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [self.promptLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

- (UIView *)promptView {
    if (!_promptView) {
        _promptView = [UIView new];
    
        self.promptLabel = [UILabel new];
        self.promptLabel.textColor = [UIColor whiteColor];
        self.promptLabel.font = [UIFont systemFontOfSize:11];
        self.promptLabel.backgroundColor = [UIColor ic_colorWithHex:0x7ED321];
        self.promptLabel.textAlignment = NSTextAlignmentCenter;
        self.promptLabel.layer.cornerRadius = 9;
        self.promptLabel.layer.masksToBounds = YES;
        
        UIImageView *leftImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"左边"]];
        UIImageView *rightImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"右边"]];
        [_promptView addSubview:leftImageView];
        [_promptView addSubview:rightImageView];
        [_promptView addSubview:self.promptLabel];
        
        [leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
        }];
        [self.promptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftImageView.mas_right).offset(5);
            make.top.mas_equalTo(0);
            make.centerX.mas_equalTo(0);
            make.centerY.mas_equalTo(0);
            make.height.mas_equalTo(18);
            make.width.mas_equalTo(75);
        }];
        [rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(0);
            make.left.mas_equalTo(self.promptLabel.mas_right).offset(5);
            make.centerY.mas_equalTo(0);
        }];
        
        
    }
    return _promptView;
}

#pragma mark - View Content

- (void)configurateViewContent {
    self.avatarImageView.image = [UIImage imageNamed:@"用户头像"];
    self.nameLabel.text = @"weixiny1991";
    self.sceneImageView.image = [UIImage imageNamed:@"pic"];
    self.locationLabel.text = @"内蒙古自治区  巴丹吉林沙漠";
    self.promptLabel.text = @"推荐理由";
    self.commentLabel.text = @"这里的风景真的很不错";
}






@end
