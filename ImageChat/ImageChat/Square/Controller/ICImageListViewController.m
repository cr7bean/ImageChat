//
//  ICImageListViewController.m
//  ImageChat
//
//  Created by FigureWang on 17/1/2.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
@import MJRefresh;
@import YYModel;
#import "ICImageListViewController.h"
#import "ICImageCardTableViewCell.h"
#import "UIColor+ICHex.h"
#import "UIViewController+ICTitleView.h"
#import "ICImageInfoViewController.h"
#import "ICNetworkManager.h"
#import "ICImageCardModel.h"

static NSString *cellIdentify = @"imageCardCell";
static NSString *kTitle = @"热门";
static const NSUInteger kBackgroundColor = 0xE7E7E7;
static const NSUInteger kTableViewBottom = 15;
static const CGFloat kRowHeight = 130;

@interface ICImageListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ICImageCardListModel *cardListModel;
@end

@implementation ICImageListViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = kRowHeight;
    [self ic_titleViewWithImage:[UIImage imageNamed:@"hot"] text:kTitle];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Refresh and network

/**
 *  利用本地服务器，给定的 URL 访问不了。数据暂时用固定的数据
 */
- (void)requestImageCardList {
    NSString *URLString = @"/photolist";
    NSDictionary *parameters = @{@"limit": @20,
                                 @"offset": @0};
    [[ICNetworkManager sharedManager] ic_POST:URLString parameters:parameters success:^(id response) {
        self.cardListModel = [ICImageCardListModel yy_modelWithJSON:(response[@"data"])];
        DDLogDebug(@"Image card list request success");
    } failure:^(NSError *error) {
        DDLogDebug(@"Image card list request fail with reason: %@", error.description);
    }];
}

#pragma mark - Getter

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero
                                                  style:UITableViewStylePlain];
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[ICImageCardTableViewCell class] forCellReuseIdentifier:cellIdentify];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor ic_colorWithHex:kBackgroundColor];
        _tableView.contentInset = UIEdgeInsetsMake(0, 0, kTableViewBottom, 0);
    }
    return _tableView;
}

#pragma mark - TableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ICImageCardTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[ICImageCardTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    [cell configurateCellContent];
    return cell;
}

#pragma mark - TableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ICImageInfoViewController *controller = [ICImageInfoViewController new];
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
}

@end
