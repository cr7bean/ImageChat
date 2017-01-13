//
//  ICSendImageViewController.m
//  ImageChat
//
//  Created by FigureWang on 17/1/12.
//  Copyright © 2017年 Long. All rights reserved.
//

#import "ICSendImageViewController.h"
#import "UIViewController+ICTitleView.h"

@interface ICSendImageViewController ()

@end

@implementation ICSendImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ic_titleViewWithImage:[UIImage imageNamed:@"上传"] text:@"发布"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
