//
//  ICImageInfoMainView.m
//  ImageChat
//
//  Created by FigureWang on 17/1/5.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
#import "ICImageInfoMainView.h"
#import "UIColor+ICHex.h"
#import "ICImageInfoToolbarView.h"

static const NSUInteger kTextColor = 0x999999;
static const NSUInteger kNameColor = 0xACACAC;
static const NSUInteger kTextFontSize = 13;

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
@property (nonatomic, strong) UILabel *commentLabel;
@property (nonatomic, strong) ICImageInfoToolbarView *toolbarView;

@end

@implementation ICImageInfoMainView

#pragma mark - init

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
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
    self.promptView = [UIView new];
    self.commentLabel = [UILabel new];
    self.toolbarView = [ICImageInfoToolbarView new];
    
    [self addSubview:self.headBlankView];
    [self addSubview:self.sceneImageView];
    [self addSubview:self.locationBlankView];
    [self addSubview:self.commentBlankView];
    [self addSubview:self.toolbarView];
    
    [self.headBlankView addSubview:self.avatarImageView];
    [self.headBlankView addSubview:self.nameLabel];
    [self.locationBlankView addSubview:self.locationLabel];
    [self.locationBlankView addSubview:self.separatorLineView];
    [self.commentBlankView addSubview:self.promptView];
    [self.commentBlankView addSubview:self.commentLabel];
    
    self.nameLabel.textColor = [UIColor colorWithHex:kNameColor];
    self.nameLabel.font = [UIFont systemFontOfSize:kTextFontSize];
    self.locationLabel.textColor = [UIColor colorWithHex:kTextColor];
    self.locationLabel.font = [UIFont systemFontOfSize:kTextFontSize];
}


#pragma mark - Constraints

#pragma mark - View Content

#pragma Getter






@end
