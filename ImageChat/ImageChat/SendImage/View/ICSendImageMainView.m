//
//  ICSendImageMainView.m
//  ImageChat
//
//  Created by FigureWang on 17/1/17.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
#import "ICSendImageMainView.h"
#import "UIButton+ICHelper.h"
#import "UIColor+ICHex.h"
#import "UIView+ICDebug.h"

static const CGFloat KButtonFontSize = 18;
static const CGFloat kButtonFontColor = 0x999999;
static const CGFloat kImageScale = 1;
static const CGFloat kButtonInner = 25;

@interface ICSendImageMainView ()

@property (nonatomic, strong) UIImageView *cameraIconImageView;
@property (nonatomic, strong) UIView *buttonGroupView;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UIButton *photographButton;
@property (nonatomic, strong) UIButton *photoAlbumButton;

@end

@implementation ICSendImageMainView

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configurateSubviews];
        [self makeConstraint];
    }
    return self;
}

- (void)configurateSubviews {
    self.cameraIconImageView = [UIImageView new];
    self.camPreviewView = [ICSendImagePreviewView new];
    self.buttonGroupView = [UIView new];
    self.closeButton = [UIButton new];
    self.photographButton = [UIButton new];
    self.photoAlbumButton = [UIButton new];
    
    [self addSubview:self.cameraIconImageView];
    [self addSubview:self.camPreviewView];
    [self addSubview:self.buttonGroupView];
    [self.buttonGroupView addSubview:self.closeButton];
    [self.buttonGroupView addSubview:self.photographButton];
    [self.buttonGroupView addSubview:self.photoAlbumButton];
    
    self.cameraIconImageView.image = [UIImage imageNamed:@"camera_icon"];
    [self.photographButton setImage:[UIImage imageNamed:@"photography_button"] forState:UIControlStateNormal];
    self.camPreviewView.backgroundColor = [UIColor whiteColor];
    [self hidePreviewView];
    
    [self.closeButton setTitleColor:[UIColor ic_colorWithHex:kButtonFontColor] forState:UIControlStateNormal];
    self.closeButton.titleLabel.font = [UIFont systemFontOfSize:KButtonFontSize];
    [self.closeButton setImage:[UIImage imageNamed:@"close_button"] forState:UIControlStateNormal];
    [self.closeButton setTitle:@"关闭" forState:UIControlStateNormal];
    [self.closeButton ic_imagePosition:ImagePositionTop];
    
    [self.photoAlbumButton setTitleColor:[UIColor ic_colorWithHex:kButtonFontColor] forState:UIControlStateNormal];
    self.photoAlbumButton.titleLabel.font = [UIFont systemFontOfSize:KButtonFontSize];
    [self.photoAlbumButton setImage:[UIImage imageNamed:@"album_button"] forState:UIControlStateNormal];
    [self.photoAlbumButton setTitle:@"相册" forState:UIControlStateNormal];
    [self.photoAlbumButton ic_imagePosition:ImagePositionTop];
    
    [self.closeButton addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.photographButton addTarget:self action:@selector(photograph) forControlEvents:UIControlEventTouchUpInside];
    [self.photoAlbumButton addTarget:self action:@selector(openPhotoAlbum) forControlEvents:UIControlEventTouchUpInside];
}

- (void)makeConstraint {
    [self.cameraIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(self.cameraIconImageView.mas_width).multipliedBy(kImageScale);
    }];
    [self.camPreviewView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(self.cameraIconImageView.mas_height);
    }];
    [self.buttonGroupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.cameraIconImageView.mas_bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
    
    NSArray *buttons = @[self.closeButton, self.photographButton, self.photoAlbumButton];
    CGFloat contentLength;
    CGFloat distributeSpace;
    for (UIButton *button in buttons) {
        contentLength += button.ic_intrinsicWidth;
    }
    distributeSpace = (SCREEN_WIDTH - contentLength - 50)/4;
    
    [buttons mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:distributeSpace leadSpacing:kButtonInner tailSpacing:kButtonInner];
    [buttons mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(0);
    }];
}

- (void)hidePreviewView {
    self.camPreviewView.hidden = YES;
}

- (void)showPreviewView {
    self.camPreviewView.hidden = NO;
}

#pragma mark - Button Action

- (void)close {
    if (self.delegate) {
        [self.delegate SendImageMainView:self buttonActionType:SendImageButtonTypeClose];
    }
}

- (void)photograph {
    if (self.delegate) {
        [self.delegate SendImageMainView:self buttonActionType:SendImageButtonTypeCapture];
    }
}

- (void)openPhotoAlbum {
    if (self.delegate) {
        [self.delegate SendImageMainView:self buttonActionType:SendImageButtonTypeAlbum];
    }
}

@end
