//
//  ICImageInfoViewController.m
//  ImageChat
//
//  Created by FigureWang on 17/1/2.
//  Copyright © 2017年 Long. All rights reserved.
//

#import "ICImageInfoViewController.h"
#import "ICImageInfoMainView.h"
#import "ICImageInfoToolbarView.h"

@interface ICImageInfoViewController ()

@end

@implementation ICImageInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ICImageInfoMainView *mainView = [ICImageInfoMainView new];
    [self.view addSubview:mainView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
