//
//  ICImageCardTableViewCell.m
//  ImageChat
//
//  Created by FigureWang on 17/1/3.
//  Copyright © 2017年 Long. All rights reserved.
//

//@import Masonry;
#import <Masonry/Masonry.h>
#import "ICImageCardTableViewCell.h"
#import "UIColor+ICHex.h"


static const NSUInteger kTitleFontSize = 20;
static const NSUInteger kSubtitleFontSize = 13;
static const NSUInteger kDateFontSize = 15;

static const NSUInteger kDateFontColor = 0xFEAE53;
static const NSUInteger kSubtitleColor = 0xB1B1B1;

static const CGFloat kTop = 15;
static const CGFloat kBottom = 0;
static const CGFloat kLeft = 10;
static const CGFloat kRight = -10;
static const CGFloat kImageScale = 0.5;
static const CGFloat kLabelLeft = 20;
static const CGFloat kTitleBottom = 10;
static const CGFloat kSubtitleBottom = 25;
static const CGFloat kLabelInerSpace = 15;

@interface ICImageCardTableViewCell ()

@property (nonatomic, strong) UIImageView *cardImageView;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UIView *blankView;
@property (nonatomic, strong) UILabel *dateLable;
@property (nonatomic, strong) UILabel *subtitleLabel;

@end

@implementation ICImageCardTableViewCell

#pragma mark - init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configurateSubviews];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

#pragma mark - configurate

- (void)configurateSubviews {
    self.cardImageView = [UIImageView new];
    self.blankView = [UIView new];
    self.titleLable = [UILabel new];
    self.dateLable = [UILabel new];
    self.subtitleLabel = [UILabel new];
    
    [self.contentView addSubview:self.cardImageView];
    [self.contentView addSubview:self.blankView];
    [self.cardImageView addSubview:self.titleLable];
    [self.blankView addSubview:self.dateLable];
    [self.blankView addSubview:self.subtitleLabel];
    
    self.cardImageView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.titleLable.textColor = [UIColor whiteColor];
    self.titleLable.font = [UIFont systemFontOfSize:kTitleFontSize];
    self.dateLable.textColor = [UIColor colorWithHex:kDateFontColor];
    self.dateLable.font = [UIFont systemFontOfSize:kDateFontSize];
    self.subtitleLabel.textColor = [UIColor colorWithHex:kSubtitleColor];
    self.subtitleLabel.font = [UIFont systemFontOfSize:kSubtitleFontSize];
    
}

#pragma mark - Constraints

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (void)updateConstraints {
    [self.cardImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kTop);
        make.left.mas_equalTo(kLeft);
        make.right.mas_equalTo(kRight);
        make.height.mas_equalTo(self.cardImageView.mas_width).multipliedBy(kImageScale);
    }];
    [self.titleLable mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kLabelLeft);
        make.bottom.mas_equalTo(kTitleBottom);
    }];
    
    [self.blankView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.cardImageView.mas_bottom);
        make.left.mas_equalTo(kLeft);
        make.right.mas_equalTo(kRight);
    }];
    [self.dateLable mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kLabelInerSpace);
        make.left.mas_equalTo(kLabelLeft);
    }];
    [self.subtitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.dateLable.mas_bottom).offset(kLabelInerSpace);
        make.left.mas_equalTo(kLabelLeft);
        make.bottom.mas_equalTo(kSubtitleBottom);
    }];
    [super updateConstraints];
}

@end
