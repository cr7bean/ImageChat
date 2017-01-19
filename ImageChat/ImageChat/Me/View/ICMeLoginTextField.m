//
//  ICMeLoginTextField.m
//  ImageChat
//
//  Created by FigureWang on 17/1/19.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
#import "ICMeLoginTextField.h"
#import "UIColor+ICHex.h"

static const CGFloat kInnerSpace = 45;

@interface ICMeLoginTextField ()

@property (nonatomic, strong) UIView *bottomLineView;

@end

@implementation ICMeLoginTextField

- (instancetype)init {
    if (self=[super init]) {
        [self configurateSubviews];
    }
    return self;
}

- (void)configurateSubviews {
    self.borderStyle = UITextBorderStyleNone;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.bottomLineView = [UIView new];
    [self addSubview:self.bottomLineView];
    self.bottomLineView.backgroundColor = [UIColor ic_colorWithHex:0x979797 alpha:0.2];
    
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}

- (CGRect)placeholderRectForBounds:(CGRect)bounds {
    [super placeholderRectForBounds:bounds];
    return [self resizeRect:bounds];
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    [super editingRectForBounds:bounds];
    return [self resizeRect:bounds];
}

- (CGRect)textRectForBounds:(CGRect)bounds {
    [super textRectForBounds:bounds];
    return [self resizeRect:bounds];
}

- (CGRect)resizeRect:(CGRect)bounds {
    bounds.origin.x += kInnerSpace;
    bounds.size.width -= kInnerSpace;
    return bounds;
}



@end
