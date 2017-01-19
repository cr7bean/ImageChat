//
//  ICMeFeedbackViewController.m
//  ImageChat
//
//  Created by FigureWang on 17/1/19.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
#import "ICMeFeedbackViewController.h"
#import "UIColor+ICHex.h"
#import "UIViewController+ICTitleView.h"


static const NSUInteger kTextColor = 0x999999;
static const CGFloat kTitleFontSize = 13;
static const CGFloat kLabelTop = 30;
static const CGFloat kGeneralSpace = 15;
static const CGFloat kButtonTop = 30;
static const CGFloat kTextViewHeight = 120;
static const CGSize kButtonSize = {88, 36};

@interface ICMeFeedbackViewController ()<UITextViewDelegate>

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UIButton *sendButton;

@end

@implementation ICMeFeedbackViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurateSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)configurateSubviews {
    [self ic_titleViewWithText:@"反馈"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.textView];
    [self.view addSubview:self.sendButton];
    [self makeConstraint];
}

- (void)makeConstraint {
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kGeneralSpace);
        make.top.mas_equalTo(kLabelTop);
    }];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kGeneralSpace);
        make.right.mas_equalTo(-kGeneralSpace);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(kGeneralSpace);
        make.height.mas_equalTo(kTextViewHeight);
    }];
    [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-kGeneralSpace);
        make.top.mas_equalTo(self.textView.mas_bottom).offset(kButtonTop);
        make.width.mas_equalTo(88);
        make.size.mas_equalTo(kButtonSize);
    }];
}

#pragma Getter

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.text = @"写点什么给我们";
        _titleLabel.textColor = [UIColor ic_colorWithHex:kTextColor];
        _titleLabel.font = [UIFont systemFontOfSize:kTitleFontSize];
    }
    return _titleLabel;
}

- (UITextView *)textView {
    if (!_textView) {
        _textView = [UITextView new];
        _textView.textColor = [UIColor ic_colorWithHex:kTextColor];
        _textView.delegate = self;
        _textView.layer.cornerRadius = 8;
        _textView.layer.borderWidth = 1;
        _textView.layer.borderColor = [UIColor ic_colorWithHex:0x979797 alpha:0.2].CGColor;
    }
    return _textView;
}

- (UIButton *)sendButton {
    if (!_sendButton) {
        _sendButton = [UIButton new];
        [_sendButton setTitle:@"发送" forState:UIControlStateNormal];
        [_sendButton setBackgroundImage:[UIImage imageNamed:@"feedback_button"] forState:UIControlStateNormal];
        [_sendButton addTarget:self action:@selector(sendFeedback) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendButton;
}

#pragma mark - Button Action

//TODO: <#TODO#>
- (void)sendFeedback {
    
}


@end
