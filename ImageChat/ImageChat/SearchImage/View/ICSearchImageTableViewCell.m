//
//  ICSearchImageTableViewCell.m
//  ImageChat
//
//  Created by FigureWang on 17/1/13.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
#import "ICSearchImageTableViewCell.h"
#import "UIColor+ICHex.h"

static const NSUInteger kTextColor = 0xACACAC;
static const CGFloat kTextFontSize = 13;
static const CGFloat kImageLeft = 27;
static const CGFloat kSceneLabelLeft = 21;
static const CGFloat kCityLabelLeft = 15;
static const CGFloat kImageTop = 15;
static const CGFloat kImageBottom = -5;
static const CGFloat kSeparatorLeft = 27+20;

@interface ICSearchImageTableViewCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *sceneLabel;
@property (nonatomic, strong) UILabel *cityLabel;

@end

@implementation ICSearchImageTableViewCell

#pragma mark - init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configurateSubviews];
        [self makeConstraint];
        
        self.iconImageView.image = [UIImage imageNamed:@"map1"];
        self.sceneLabel.text = @"大雁塔";
        self.cityLabel.text = @"西安";
    }
    return self;
}


- (void)configurateSubviews {
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    self.tintColor = [UIColor ic_colorWithHex:kTextColor];
    self.separatorInset = UIEdgeInsetsMake(0, kSeparatorLeft, 0, 0);
    
    self.iconImageView = [UIImageView new];
    self.sceneLabel = [UILabel new];
    self.cityLabel = [UILabel new];
    
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.sceneLabel];
    [self.contentView addSubview:self.cityLabel];
    
    self.sceneLabel.textColor = [UIColor ic_colorWithHex:kTextColor];
    self.sceneLabel.font = [UIFont systemFontOfSize:kTextFontSize];
    self.cityLabel.textColor = [UIColor ic_colorWithHex:kTextColor];
    self.cityLabel.font = [UIFont systemFontOfSize:kTextFontSize];
}

- (void)makeConstraint {
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kImageLeft);
        make.bottom.mas_equalTo(kImageBottom);
    }];
    [self.sceneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).offset(kSceneLabelLeft);
        make.centerY.mas_equalTo(self.iconImageView.mas_centerY);
    }];
    [self.cityLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.sceneLabel.mas_right).offset(kCityLabelLeft);
        make.centerY.mas_equalTo(self.iconImageView.mas_centerY);
    }];
}


@end
