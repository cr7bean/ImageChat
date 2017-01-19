//
//  ICSendImageEditViewController.m
//  ImageChat
//
//  Created by FigureWang on 17/1/17.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
@import SDVersion;
#import "ICSendImageEditViewController.h"
#import "UIColor+ICHex.h"
#import "UIButton+ICHelper.h"
#import "UIView+ICDebug.h"
#import "UIViewController+ICTitleView.h"

static const NSUInteger kTextColor = 0x999999;
static const NSUInteger kLineViewColor = 0x979797;
static const CGFloat kTextFontSize = 16;
static CGFloat kImageScale = 0.7;
static const CGFloat kLineViewTop = 10;
static const CGFloat kTextFieldInner = 5;
static const CGFloat kTextFiedlLeft = 15;
static const CGFloat kTextFieldRight = -15;
static CGFloat kDescriptiveTextFieldHeight = 60;

static const CGFloat kButtonLeft = 30;
static const CGFloat kButtonRight = -30;
static CGFloat kButtonBottom = -20;


@interface ICSendImageEditViewController ()<UITextFieldDelegate, UITextViewDelegate>

@property (nonatomic, strong) UIImageView *sceneImageView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UITextField *cityTextField;
@property (nonatomic, strong) UIView *cityLineView;
@property (nonatomic, strong) UITextField *sceneTextField;
@property (nonatomic, strong) UIView *sceneLineView;
@property (nonatomic, strong) UILabel *descriptiveLabel;
@property (nonatomic, strong) UITextView *descriptiveTextView;
@property (nonatomic, strong) UIButton  *backButton;
@property (nonatomic, strong) UIButton *sendButton;

@property (nonatomic, strong) UIImage *sceneImage;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, strong) UISwipeGestureRecognizer *swipGesture;
@property (nonatomic, strong) UIView *activeView;

@end

@implementation ICSendImageEditViewController

#pragma mark - Life Cycle

- (instancetype)initWithImage:(UIImage *)image {
    self = [self init];
    if (self) {
        _sceneImage = image;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurateSubviews];
    [self registerKeyboradNotification];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Configure Subviews

- (void)configurateSubviews {
    self.view.backgroundColor = [UIColor whiteColor];
    [self ic_titleViewWithText:@"编辑"];
    
    [self.view addSubview:self.sceneImageView];
    [self.view addSubview:self.lineView];
    [self.view addSubview:self.cityTextField];
    [self.view addSubview:self.cityLineView];
    [self.view addSubview:self.sceneTextField];
    [self.view addSubview:self.sceneLineView];
    [self.view addSubview:self.descriptiveLabel];
    [self.view addSubview:self.descriptiveTextView];
    [self.view addSubview:self.backButton];
    [self.view addSubview:self.sendButton];
    [self makeConstraint];
}

- (void)makeConstraint {
    // 针对4s 屏幕调整
    if ([SDVersion deviceSize] == Screen3Dot5inch) {
        kImageScale = 0.5;
//        kDescriptiveTextFieldHeight = 30;
        kButtonBottom = -10;
    }
    
    
    [_sceneImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.height.mas_equalTo(_sceneImageView.mas_width).multipliedBy(kImageScale);
    }];
    [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.top.mas_equalTo(self.sceneImageView.mas_bottom).offset(kLineViewTop);
        make.left.right.mas_equalTo(0);
    }];
    [_cityTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.lineView.mas_bottom).offset(kTextFieldInner);
        make.left.mas_equalTo(kTextFiedlLeft);
        make.right.mas_equalTo(kTextFieldRight);
    }];
    [_cityLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.centerX.mas_equalTo(0);
        make.width.mas_equalTo(self.cityTextField.mas_width);
        make.top.mas_equalTo(self.cityTextField.mas_bottom).offset(kTextFieldInner);
    }];
    [_sceneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.cityLineView.mas_bottom).offset(kTextFieldInner);
        make.left.mas_equalTo(kTextFiedlLeft);
        make.right.mas_equalTo(kTextFieldRight);
    }];
    [_sceneLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.sceneTextField.mas_bottom).offset(kTextFieldInner);
        make.centerX.mas_equalTo(0);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(self.sceneTextField.mas_width);
    }];
    [_descriptiveLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kTextFiedlLeft);
        make.top.mas_equalTo(self.sceneLineView.mas_bottom).offset(kTextFieldInner);
    }];
    [_descriptiveTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.descriptiveLabel.mas_bottom).offset(kTextFieldInner);
        make.left.mas_equalTo(kTextFiedlLeft);
        make.right.mas_equalTo(kTextFieldRight);
        make.height.mas_equalTo(kDescriptiveTextFieldHeight);
    }];
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(kButtonLeft);
        make.bottom.mas_equalTo(kButtonBottom);
    }];
    [_sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(kButtonRight);
        make.bottom.mas_equalTo(kButtonBottom);
    }];
}

#pragma mark - Keyborad height manager

- (void)registerKeyboradNotification {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboradWillShow:) name: UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)keyboradWillShow:(NSNotification *)sender {
    CGRect keyboradFrame = [sender.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardOriginY = keyboradFrame.origin.y;
    CGFloat moveHeight;
    UIView *adjustView = [self findAdjustView];
    moveHeight = adjustView.ic_y + adjustView.ic_height - keyboardOriginY + 64;
    if (moveHeight > 0) {
        self.view.frame = CGRectMake(0, -moveHeight, SCREEN_WIDTH, SCREEN_HEIGHT);
    } else {
        [self restoreViewFrame];
    }
    [self.view addGestureRecognizer:self.swipGesture];
    
}

- (void)keyboardWillHide:(NSNotification *)sender {
    [self restoreViewFrame];
    [self.view removeGestureRecognizer:self.swipGesture];
}

- (void)restoreViewFrame {
    self.view.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64);
}

- (UIView *)findAdjustView {
    NSArray *adjustViews = @[self.cityLineView, self.sceneLineView, self.descriptiveTextView];
    UIView *adjustView = adjustViews[self.activeView.tag-1];
    return adjustView;
}

#pragma mark - UITextFiedl Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.activeView = textField;
    DDLogDebug(@"active view :%d", self.activeView.tag);
}

#pragma mark - UITextView Delegate

- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.activeView = textView;
    DDLogDebug(@"active view :%d", self.activeView.tag);
}



#pragma mark - Getter

- (UIImageView *)sceneImageView {
    if (!_sceneImageView) {
        _sceneImageView = [[UIImageView alloc] initWithImage:self.sceneImage];
    }
    return _sceneImageView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor ic_colorWithHex:kLineViewColor alpha:0.2];
    }
    return _lineView;
}

- (UITextField *)cityTextField {
    if (!_cityTextField) {
        _cityTextField = [UITextField new];
        _cityTextField.borderStyle = UITextBorderStyleNone;
        _cityTextField.font = [UIFont systemFontOfSize:kTextFontSize];
        _cityTextField.textColor = [UIColor ic_colorWithHex:kTextColor];
        _cityTextField.delegate = self;
        _cityTextField.tag = 1;
        
        UILabel *label = [UILabel new];
        label.text = @"拍摄城市： ";
        label.textColor = [UIColor ic_colorWithHex:kTextColor];
        label.font = [UIFont systemFontOfSize:kTextFontSize];
        label.ic_size = label.intrinsicContentSize;
        _cityTextField.leftViewMode = UITextFieldViewModeAlways;
        _cityTextField.leftView = label;
    }
    return _cityTextField;
}

- (UIView *)cityLineView {
    if (!_cityLineView) {
        _cityLineView = [UIView new];
        _cityLineView.backgroundColor = [UIColor ic_colorWithHex:kLineViewColor alpha:0.2];
    }
    return _cityLineView;
}

- (UITextField *)sceneTextField {
    if (!_sceneTextField) {
        _sceneTextField = [UITextField new];
        _sceneTextField.borderStyle = UITextBorderStyleNone;
        _sceneTextField.font = [UIFont systemFontOfSize:kTextFontSize];
        _sceneTextField.textColor = [UIColor ic_colorWithHex:kTextColor];
        _sceneTextField.delegate = self;
        _sceneTextField.tag = 2;
        
        UILabel *label = [UILabel new];
        label.text = @"拍摄景点： ";
        label.textColor = [UIColor ic_colorWithHex:kTextColor];
        label.font = [UIFont systemFontOfSize:kTextFontSize];
        label.ic_size = label.intrinsicContentSize;
        _sceneTextField.leftViewMode = UITextFieldViewModeAlways;
        _sceneTextField.leftView = label;
    }
    return _sceneTextField;
}

- (UIView *)sceneLineView {
    if (!_sceneLineView) {
        _sceneLineView = [UIView new];
        _sceneLineView.backgroundColor = [UIColor ic_colorWithHex:kLineViewColor alpha:0.2];
    }
    return _sceneLineView;
}

- (UILabel *)descriptiveLabel {
    if (!_descriptiveLabel) {
        _descriptiveLabel = [UILabel new];
        _descriptiveLabel.text = @"添加描述:";
        _descriptiveLabel.textColor = [UIColor ic_colorWithHex:kTextColor];
        _descriptiveLabel.font = [UIFont systemFontOfSize:kTextFontSize];
    }
    return _descriptiveLabel;
}

- (UITextView *)descriptiveTextView {
    if (!_descriptiveTextView) {
        _descriptiveTextView = [UITextView new];
        _descriptiveTextView.delegate = self;
        _descriptiveTextView.tag = 3;
        _descriptiveTextView.layer.borderColor = [UIColor ic_colorWithHex:kLineViewColor alpha:0.2].CGColor;
        _descriptiveTextView.layer.borderWidth = 1;
        _descriptiveTextView.layer.cornerRadius = 5;
        _descriptiveTextView.layer.masksToBounds = YES;
        _descriptiveTextView.textColor = [UIColor ic_colorWithHex:kTextColor];
        _descriptiveTextView.font = [UIFont systemFontOfSize:kTextFontSize];
    }
    return _descriptiveTextView;
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton new];
        [_backButton setTitleColor:[UIColor ic_colorWithHex:kTextColor] forState:UIControlStateNormal];
        [_backButton setTitle:@"返回" forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"back_button"] forState:UIControlStateNormal];
        [_backButton ic_imagePosition:ImagePositionTop];
        [_backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

- (UIButton *)sendButton {
    if (!_sendButton) {
        _sendButton = [UIButton new];
        [_sendButton setTitleColor:[UIColor ic_colorWithHex:kTextColor] forState:UIControlStateNormal];
        [_sendButton setTitle:@"发布" forState:UIControlStateNormal];
        [_sendButton setImage:[UIImage imageNamed:@"send_button"] forState:UIControlStateNormal];
        [_sendButton addTarget:self action:@selector(sendAction) forControlEvents:UIControlEventTouchUpInside];
        [_sendButton ic_imagePosition:ImagePositionTop];
    }
    return _sendButton;
}

- (UITapGestureRecognizer *)tapGesture {
    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    }
    return _tapGesture;
}

- (UISwipeGestureRecognizer *)swipGesture {
    if (!_swipGesture) {
        _swipGesture = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction)];
        _swipGesture.direction = UISwipeGestureRecognizerDirectionUp | UISwipeGestureRecognizerDirectionDown;
    }
    return _swipGesture;
}


#pragma mark - Button Action

- (void)backAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)sendAction {
    
}

- (void)tapAction {
    [self restoreViewFrame];
    [self.activeView resignFirstResponder];
}

- (void)swipeAction {
    [self restoreViewFrame];
    [self.activeView resignFirstResponder];
}

@end
