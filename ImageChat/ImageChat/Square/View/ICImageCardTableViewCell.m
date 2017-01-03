//
//  ICImageCardTableViewCell.m
//  ImageChat
//
//  Created by FigureWang on 17/1/3.
//  Copyright © 2017年 Long. All rights reserved.
//

#import "ICImageCardTableViewCell.h"
#import <Masonry/Masonry.h>
#import "UIColor+ICHex.h"


static const NSUInteger kTitleFontSize = 20;
static const NSUInteger kSubtitleFontSize = 13;
static const NSUInteger kDateFontSize = 15;

static const NSUInteger kDateFontColor = 0xFEAE53;
static const NSUInteger kSubtitleColor = 0xB1B1B1;

@interface ICImageCardTableViewCell ()

@property (nonatomic, strong) UIImageView *cardImageView;
@property (nonatomic, strong) UILabel *titleLable;
@property (nonatomic, strong) UILabel *dateLable;
@property (nonatomic, strong) UILabel *subtitleLabel;

@end

@implementation ICImageCardTableViewCell

#pragma mark - init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
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
    self.cardImageView.layer.shadowColor = [UIColor blackColor].CGColor;
    
    self.titleLable = [UILabel new];
    self.titleLable.textColor = [UIColor whiteColor];
    self.titleLable.font = [UIFont systemFontOfSize:kTitleFontSize];
    
    self.dateLable = [UILabel new];
    self.dateLable.textColor = [UIColor colorWithHex:kDateFontColor];
    self.dateLable.font = [UIFont systemFontOfSize:kDateFontSize];
    
    self.subtitleLabel = [UILabel new];
    self.subtitleLabel.textColor = [UIColor colorWithHex:kSubtitleColor];
    self.subtitleLabel.font = [UIFont systemFontOfSize:kSubtitleFontSize];
    
}

@end
