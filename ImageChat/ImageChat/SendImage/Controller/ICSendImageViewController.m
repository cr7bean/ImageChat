//
//  ICSendImageViewController.m
//  ImageChat
//
//  Created by FigureWang on 17/1/12.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
@import AVFoundation;
#import "ICSendImageViewController.h"
#import "UIViewController+ICTitleView.h"
#import "ICSendImageMainView.h"

@interface ICSendImageViewController ()<ICSendImageMainViewDelegate>

@property (nonatomic, strong)  ICSendImageMainView *mainView;

@end

@implementation ICSendImageViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurateSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma Configure Subviews

- (void)configurateSubviews {
    [self ic_titleViewWithImage:[UIImage imageNamed:@"上传"] text:@"发布"];
    self.mainView = [ICSendImageMainView new];
    self.mainView.delegate = self;
    [self.view addSubview:self.mainView];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}



#pragma mark - ICSendImageMainView Delegate

- (void)SendImageMainView:(ICSendImageMainView *)view buttonActionType:(SendImageButtonType)actionType {
    switch (actionType) {
        case SendImageButtonTypeClose: {
            [self close];
            break;
        }
        case SendImageButtonTypeCapture: {
            [self capture];
            break;
        }
        case SendImageButtonTypeAlbum: {
            [self album];
            break;
        }
    }
}

// Actions
- (void)close {
    self.tabBarController.selectedIndex = 0;
}

- (void)capture {
    
}

- (void)album {
    
}

@end
