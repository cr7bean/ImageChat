//
//  ICImageInfoViewController.m
//  ImageChat
//
//  Created by FigureWang on 17/1/2.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
#import "ICImageInfoViewController.h"
#import "ICImageInfoMainView.h"
#import "ICImageInfoToolbarView.h"

static NSString *kTitle = @"详情";

@interface ICImageInfoViewController ()

@property (nonatomic, strong)  ICImageInfoMainView *mainView;
@property (nonatomic, strong) ICImageInfoToolbarView *toolbarView;

@end

@implementation ICImageInfoViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurateSubviews];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

#pragma mark - Configurate Subviews

- (void)configurateSubviews {
    self.mainView = [ICImageInfoMainView new];
    self.toolbarView = [ICImageInfoToolbarView new];
    [self.view addSubview:self.mainView];
    [self.view addSubview:self.toolbarView];
    
    [self.toolbarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(49);
    }];
}



@end
