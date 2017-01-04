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
static const NSUInteger kSubtitleFontSize = 15;
static const NSUInteger kDateFontSize = 13;

static const NSUInteger kDateFontColor = 0xFEAE53;
static const NSUInteger kSubtitleColor = 0xB1B1B1;
static const NSUInteger kBackgroundColor = 0xE7E7E7;

static const CGFloat kTop = 15;
static const CGFloat kLeft = 10;
static const CGFloat kRight = -10;
static const CGFloat kImageScale = 0.5;
static const CGFloat kLabelLeft = 20;
static const CGFloat kTitleBottom = -10;
static const CGFloat kSubtitleBottom = -20;
static const CGFloat kLabelInerSpace = 15;

@interface ICImageCardTableViewCell ()

@property (nonatomic, strong) UIView *groupView;
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
        [self makeConstraints];
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
    self.groupView = [UIView new];
    self.cardImageView = [UIImageView new];
    self.blankView = [UIView new];
    self.titleLable = [UILabel new];
    self.dateLable = [UILabel new];
    self.subtitleLabel = [UILabel new];
    
    [self.contentView addSubview:self.groupView];
    [self.groupView addSubview:self.cardImageView];
    [self.groupView addSubview:self.blankView];
    [self.cardImageView addSubview:self.titleLable];
    [self.blankView addSubview:self.dateLable];
    [self.blankView addSubview:self.subtitleLabel];
    
    self.backgroundColor = [UIColor colorWithHex:kBackgroundColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.groupView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.groupView.layer.shadowOffset = CGSizeMake(1, 1);
    self.groupView.layer.shadowRadius = 4.0;
    self.groupView.layer.cornerRadius = 10;
    self.groupView.layer.masksToBounds = YES;
    self.blankView.backgroundColor = [UIColor whiteColor];
    
    self.titleLable.textColor = [UIColor whiteColor];
    self.titleLable.font = [UIFont systemFontOfSize:kTitleFontSize];
    self.dateLable.textColor = [UIColor colorWithHex:kDateFontColor];
    self.dateLable.font = [UIFont systemFontOfSize:kDateFontSize];
    self.subtitleLabel.textColor = [UIColor colorWithHex:kSubtitleColor];
    self.subtitleLabel.font = [UIFont systemFontOfSize:kSubtitleFontSize];
}

#pragma mark - Constraints

- (void)makeConstraints {
    
    [self.groupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kTop);
        make.left.mas_equalTo(kLeft);
        make.right.mas_equalTo(kRight);
        make.bottom.mas_equalTo(0);
    }];
    [self.cardImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(self.cardImageView.mas_width).multipliedBy(kImageScale);
    }];
    [self.titleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kLabelLeft);
        make.bottom.mas_equalTo(kTitleBottom);
    }];
    
    [self.blankView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(self.cardImageView.mas_bottom);
    }];
    [self.dateLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kLabelInerSpace);
        make.left.mas_equalTo(kLabelLeft);
    }];
    [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.dateLable.mas_bottom).offset(kLabelInerSpace);
        make.left.mas_equalTo(kLabelLeft);
        make.bottom.mas_equalTo(kSubtitleBottom);
    }];
    
}

#pragma mark - Cell content

- (void)configurateCellContent {
    self.cardImageView.image = [UIImage imageNamed:@"pho-2"];
    self.titleLable.text = @"澳大利亚十大海滩";
    self.dateLable.text = @"Number 10";
    self.subtitleLabel.text = @"Whitehaven Beach";
}

@end
