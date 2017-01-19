//
//  ICMeSaveImageTableViewCell.m
//  ImageChat
//
//  Created by FigureWang on 17/1/18.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
#import "ICMeSettingTableViewCell.h"
#import "UIColor+ICHex.h"

static const CGFloat kTitleLabelLeft = 25;
static const CGFloat kSubtitleLabelRight = -10;
static const CGFloat kSwitchRight = -15;
static const NSUInteger kTextColor = 0x888888;
static const CGFloat kTextFontSize = 15;
static const NSUInteger kSwitchColor = 0xFE8E1F;


@interface ICMeSettingTableViewCell ()

@property (nonatomic, strong) UISwitch *saveImageSwitch;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;

@end



@implementation ICMeSettingTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configurateSubviews];
        [self makeConstraint];
    }
    return self;
}

- (void)configurateSubviews {
    self.layoutMargins = UIEdgeInsetsZero;
    self.separatorInset = UIEdgeInsetsZero;
    
    self.saveImageSwitch = [UISwitch new];
    self.titleLabel = [UILabel new];
    self.subTitleLabel = [UILabel new];
    
    [self.contentView addSubview:self.saveImageSwitch];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.subTitleLabel];
    
    self.titleLabel.textColor = [UIColor ic_colorWithHex:kTextColor];
    self.titleLabel.font = [UIFont systemFontOfSize:kTextFontSize];
    self.subTitleLabel.textColor = self.titleLabel.textColor;
    self.subTitleLabel.font  = self.titleLabel.font;
    self.saveImageSwitch.onTintColor = [UIColor ic_colorWithHex:kSwitchColor];
}

- (void)makeConstraint {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kTitleLabelLeft);
        make.centerY.mas_equalTo(0);
    }];
    [self.saveImageSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(kSwitchRight);
            make.centerY.mas_equalTo(0);
        }];
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(kSubtitleLabelRight);
            make.centerY.mas_equalTo(0);
        }];
}

- (void)configureViewContentAtIndexPath:(NSIndexPath*)indexPath
                              subtitles:(NSMutableArray*)subtitles
                             isSwitchOn:(BOOL)switchState {
    NSArray *titles = @[@"保存用户名:", @"意见反馈:", @"保存原始图片:", @"清除缓存:"];
    self.titleLabel.text = titles[indexPath.row];
    self.saveImageSwitch.on = switchState;
    if (indexPath.row == 2) {
        self.subTitleLabel.hidden = YES;
        self.saveImageSwitch.hidden = NO;
    }else {
        self.subTitleLabel.hidden = NO;
        self.saveImageSwitch.hidden = YES;
        self.subTitleLabel.text = subtitles[indexPath.row];
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.tintColor = [UIColor ic_colorWithHex:kTextColor];
    }
}



@end
