//
//  ICMeLoginViewController.m
//  ImageChat
//
//  Created by FigureWang on 17/1/19.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
#import "ICMeLoginViewController.h"
#import "ICMeLoginTextField.h"
#import "UIView+ICDebug.h"
#import "UIColor+ICHex.h"

static const CGFloat kBackButtonSpace = 20;
static const CGFloat kUserNameTextFiedlTop = 100;
static const CGFloat kTextFiedlSpace = 31;
static const CGFloat kPasswordTextFiedlTop = 15;
static const CGFloat kLoginButtonRight = -20;
static const CGFloat kRegisterButtonBottom = -30;
static const CGFloat kTextColor = 0x888888;


@interface ICMeLoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) ICMeLoginTextField *userNameTextField;
@property (nonatomic, strong) ICMeLoginTextField *passwordTextField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, strong) UIButton *registerButton;
@property (nonatomic, strong) UIImageView *registerImageView;
@property (nonatomic, strong) UIButton *backButton;

@end

@implementation ICMeLoginViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurateSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - configure subviews
- (void)configurateSubviews {
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.userNameTextField];
    [self.view addSubview:self.passwordTextField];
    [self.view addSubview:self.loginButton];
    [self.view addSubview:self.registerButton];
    [self.view addSubview:self.registerImageView];
    [self.view addSubview:self.backButton];
    [self makeConstraint];
}

- (void)makeConstraint {
    [self.backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kBackButtonSpace);
        make.right.mas_equalTo(-kBackButtonSpace);
    }];
    [self.userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kUserNameTextFiedlTop);
        make.left.mas_equalTo(kTextFiedlSpace);
        make.right.mas_equalTo(-kTextFiedlSpace);
        make.height.mas_equalTo(kTextFiedlSpace);
    }];
    [self.passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userNameTextField.mas_bottom).offset(kPasswordTextFiedlTop);
        make.left.mas_equalTo(kTextFiedlSpace);
        make.right.mas_equalTo(-kTextFiedlSpace);
        make.height.mas_equalTo(kTextFiedlSpace);
    }];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(kLoginButtonRight);
        make.centerY.mas_equalTo(self.passwordTextField.mas_centerY);
        make.height.mas_equalTo(kTextFiedlSpace);
        make.width.mas_equalTo(12);
    }];
    [self.registerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(kRegisterButtonBottom);
    }];
    [self.registerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(0);
        make.bottom.mas_equalTo(self.registerButton.mas_top).offset(-20);
    }];
}

#pragma Getter 

- (ICMeLoginTextField *)userNameTextField {
    if (!_userNameTextField) {
        _userNameTextField = [ICMeLoginTextField new];
        _userNameTextField.delegate = self;
        _userNameTextField.placeholder = @"邮箱";
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_mail"]];
        imageView.ic_size = imageView.intrinsicContentSize;
        _userNameTextField.leftView = imageView;
    }
    return  _userNameTextField;
}

- (ICMeLoginTextField *)passwordTextField {
    if (!_passwordTextField) {
        _passwordTextField = [ICMeLoginTextField new];
        _passwordTextField.delegate = self;
        _passwordTextField.placeholder = @"密码";
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"login_password"]];
        imageView.ic_size = imageView.intrinsicContentSize;
        _passwordTextField.leftView = imageView;
    }
    return _passwordTextField;
}

- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton new];
        [_loginButton setImage:[UIImage imageNamed:@"login_indicator"] forState:UIControlStateNormal];
        [_loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (UIButton *)registerButton {
    if (!_registerButton) {
        _registerButton = [UIButton new];
        [_registerButton setTitle:@"使用电子邮件注册" forState:UIControlStateNormal];
        [_registerButton addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
        [_registerButton setTitleColor:[UIColor ic_colorWithHex:kTextColor] forState:UIControlStateNormal];
    }
    return _registerButton;
}

- (UIImageView *)registerImageView {
    if (!_registerImageView) {
        _registerImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"register_indicator"]];
    }
    return _registerImageView;
}

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton new];
        [_backButton setImage:[UIImage imageNamed:@"login_back"] forState:UIControlStateNormal];
        [_backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}

#pragma mark - Button Action

//TODO: <#TODO#>
- (void)loginAction {
    
}

- (void)registerAction {
    
}

- (void)backAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
