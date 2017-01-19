//
//  ICMeSettingViewController.m
//  ImageChat
//
//  Created by FigureWang on 17/1/18.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
#import "ICMeSettingViewController.h"
#import "ICMeSettingTableViewCell.h"
#import "ICMeFeedbackViewController.h"

static NSString *const cellIdentify = @"cellIdentify";

@interface ICMeSettingViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *subtitles;
@property (nonatomic, copy) NSString *cacheAmountString;

@end

@implementation ICMeSettingViewController

#pragma mark - Life Cycle

- (instancetype)initWithUserName:(NSString *)userName {
    self = [super init];
    if (self) {
        _cacheAmountString = @"43.5MB";
        _subtitles = @[userName, @"",@"",_cacheAmountString].mutableCopy;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[ICMeSettingTableViewCell class] forCellReuseIdentifier:cellIdentify];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - UITableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subtitles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ICMeSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[ICMeSettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    [cell configureViewContentAtIndexPath:indexPath subtitles:self.subtitles isSwitchOn:YES];
    return cell;
}

#pragma mark - UITableView Delegate

//TODO: <#TODO#>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0: {
            [self modifyUserName];
            break;
        }
        case 1: {
            [self feedback];
            break;
        }
        case 2: {
            break;
        }
        case 3: {
            [self clearCache];
            break;
        }
    }
}

#pragma mark - Priviate Method

- (void)modifyUserName {
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"请输入新昵称" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        DDLogDebug(@"new user name: %@", controller.textFields.firstObject.text);
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [controller addTextFieldWithConfigurationHandler:nil];
    [controller addAction:confirmAction];
    [controller addAction:cancelAction];
    [self presentViewController:controller animated:YES completion:nil];
}

- (void)feedback {
    ICMeFeedbackViewController *controller = [ICMeFeedbackViewController new];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)clearCache {
    
}


#pragma mark - Getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.layoutMargins = UIEdgeInsetsZero;
        _tableView.separatorInset = UIEdgeInsetsZero;
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }
    return _tableView;
}



@end
