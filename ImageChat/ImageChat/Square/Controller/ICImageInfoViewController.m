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
#import "UIViewController+ICTitleView.h"

static NSString *kTitle = @"详情";
static const CGFloat kToolbarHeight = 49;

@interface ICImageInfoViewController ()<ICImageInfoToolbarViewDelegate>

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
//TODO: scrollview
- (void)configurateSubviews {
    [self ic_titleViewWithText:kTitle];
    self.mainView = [ICImageInfoMainView new];
    self.toolbarView = [ICImageInfoToolbarView new];
    self.toolbarView.delegate = self;
    [self.view addSubview:self.mainView];
    [self.view addSubview:self.toolbarView];
    [self.toolbarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(kToolbarHeight);
    }];
}



#pragma mark - ICImageInfoToolbarViewDelegate

- (void)ICImageInfoToolbarView:(ICImageInfoToolbarView *)toolbarView didTouched:(ImageInfoToolbarActionType)actionType {
    switch (actionType) {
        case ImageInfoToolbarActionTypeCollect: {
            [self collect];
            break;
        }
        case ImageInfoToolbarActionTypeDownload: {
            [self download];
            break;
        }
        case ImageInfoToolbarActionTypeDelete: {
            [self delete];
            break;
        }
        case ImageInfoToolbarActionTypeShare: {
            [self share];
            break;
        }
    }
}

# pragma mark - Toolbar Action

//TODO: action

- (void)collect {
    
}
- (void)download {
    
}
- (void)delete {
    
}
- (void)share {
    
}


@end
