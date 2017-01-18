//
//  ICMeViewController.m
//  ImageChat
//
//  Created by FigureWang on 17/1/12.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
#import "ICMeViewController.h"
#import "ICMeTableHeadView.h"
#import "UIColor+ICHex.h"
#import "UIViewController+ICTitleView.h"

static NSString *const cellIentify = @"Cellidentity";
static const NSUInteger kTextColor = 0x888888;
static const NSUInteger kLineViewColor = 0x979797;
static const CGFloat kTextFontSize = 15;

@interface ICMeViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ICMeTableHeadView *headView;
@property (nonatomic, copy) NSArray *titles;
@property (nonatomic, strong) NSArray *images;

@end

@implementation ICMeViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurateSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)configurateSubviews {
    self.titles = @[@"我的发布:", @"我的收藏:", @"我的偏好:", @"邀请好友:"];
    self.images = @[[UIImage imageNamed:@"me_send"],
                    [UIImage imageNamed:@"me_collect"],
                    [UIImage imageNamed:@"me_lover"],
                    [UIImage imageNamed:@"me_friend"]];
    [self ic_titleViewWithText:@"我的"];
    self.headView = [ICMeTableHeadView new];
    self.tableView.tableHeaderView = self.headView;
    
    [self.headView switchToLoginState];
}

#pragma mark - Getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.layoutMargins = UIEdgeInsetsZero;
        _tableView.separatorInset = UIEdgeInsetsZero;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorColor = [UIColor ic_colorWithHex:kLineViewColor alpha:0.2];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIentify];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }
    return  _tableView;
}


#pragma UITableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIentify];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIentify];
    }
    cell.separatorInset = UIEdgeInsetsZero;
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.textLabel.text = self.titles[indexPath.row];
    cell.textLabel.textColor = [UIColor ic_colorWithHex:kTextColor];
    cell.textLabel.font = [UIFont systemFontOfSize:kTextFontSize];
    cell.imageView.image = self.images[indexPath.row];
    return cell;
}

#pragma mark UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
