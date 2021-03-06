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


static const NSUInteger kTitleFontSize = 22;
static const NSUInteger kSubtitleFontSize = 13;
static const NSUInteger kDateFontSize = 13;

static const NSUInteger kDateFontColor = 0xFEAE53;
static const NSUInteger kSubtitleColor = 0xB1B1B1;
static const NSUInteger kBackgroundColor = 0xE7E7E7;

static const CGFloat kTop = 10;
static const CGFloat kLeft = 8.5;
static const CGFloat kRight = -8.5;
static const CGFloat kImageScale = 0.47;
static const CGFloat kLabelLeft = 20;
static const CGFloat kTitleBottom = -10;
static const CGFloat kSubtitleBottom = -15;
static const CGFloat kLabelInerSpace = 10;

@interface ICImageCardTableViewCell ()

@property (nonatomic, strong) UIView *groupView;
@property (nonatomic, strong) UIView *shadowView;
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
    self.shadowView = [UIView new];
    self.cardImageView = [UIImageView new];
    self.blankView = [UIView new];
    self.titleLable = [UILabel new];
    self.dateLable = [UILabel new];
    self.subtitleLabel = [UILabel new];
    
    [self.contentView addSubview:self.shadowView];
    [self.shadowView addSubview:self.groupView];
    [self.groupView addSubview:self.cardImageView];
    [self.groupView addSubview:self.blankView];
    [self.cardImageView addSubview:self.titleLable];
    [self.blankView addSubview:self.dateLable];
    [self.blankView addSubview:self.subtitleLabel];
    
    self.backgroundColor = [UIColor ic_colorWithHex:kBackgroundColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.groupView.layer.cornerRadius = 5;
    self.groupView.layer.masksToBounds = YES;
    
    self.shadowView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.shadowView.layer.shadowOpacity = 0.3;
    self.shadowView.layer.shadowRadius = 5;
//    self.shadowView.layer.shadowOffset = CGSizeMake(0, -1);
    self.shadowView.layer.shouldRasterize = YES;
    self.shadowView.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    self.blankView.backgroundColor = [UIColor whiteColor];
    
    self.titleLable.textColor = [UIColor whiteColor];
    self.titleLable.font = [UIFont systemFontOfSize:kTitleFontSize];
    self.dateLable.textColor = [UIColor ic_colorWithHex:kDateFontColor];
    self.dateLable.font = [UIFont systemFontOfSize:kDateFontSize];
    self.subtitleLabel.textColor = [UIColor ic_colorWithHex:kSubtitleColor];
    self.subtitleLabel.font = [UIFont systemFontOfSize:kSubtitleFontSize];
}

#pragma mark - Constraints

- (void)makeConstraints {
    
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kTop);
        make.left.mas_equalTo(kLeft);
        make.right.mas_equalTo(kRight);
        make.bottom.mas_equalTo(0);
    }];
    [self.groupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
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

- (void)layoutSubviews {
    [super layoutSubviews];
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:self.groupView.bounds];
    self.groupView.layer.shadowPath = path.CGPath;
}

#pragma mark - Cell content

- (void)configurateCellContent {
    self.cardImageView.image = [UIImage imageNamed:@"pho-2"];
    self.titleLable.text = @"澳大利亚十大海滩";
    self.dateLable.text = @"Number 10";
    self.subtitleLabel.text = @"Whitehaven Beach";
}

@end
