//
//  ICICSearchImageViewController.m
//  ImageChat
//
//  Created by FigureWang on 17/1/12.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
#import "ICSearchImageViewController.h"
#import "ICImageListViewController.h"
#import "UIColor+ICHex.h"
#import "ICSearchImageHeadView.h"
#import "ICSearchImageTableViewCell.h"

static const CGFloat kSearchBarInner = 55+15;
static const CGFloat kSearchBarHeight = 30.5;
static const CGFloat kSearchBarFont = 11;
static const NSUInteger kSearchBarTextColor = 0xACACAC;
static const NSUInteger kLineViewColor = 0x979797;
static NSString  *kPlaceHolder = @"搜索城市或者景区";
static NSString *cellIdentify = @"cellIdentify";


@interface ICSearchImageViewController ()<UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) ICSearchImageHeadView *headView;
@property (nonatomic, assign) ViewContentType showContentType;


@end

@implementation ICSearchImageViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurateSubviews];
    self.showContentType = ViewContentTypeHistory;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)configurateSubviews {
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back_search"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.titleView = self.searchBar;
    self.searchBar.delegate = self;
    self.headView = [ICSearchImageHeadView new];
    self.tableView.tableHeaderView = self.headView;
}


#pragma mark - UITableView Datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ICSearchImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentify];
    if (!cell) {
        cell = [[ICSearchImageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentify];
    }
    return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


#pragma mark - UISearchBar Delegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    BOOL isTextEmpty = [searchText isEqualToString:@""];
    self.showContentType = isTextEmpty ? ViewContentTypeHistory : ViewContentTypeSuggestion;
    DDLogDebug(@"textDidChange: %@ isTextEmpty: %d",searchText, isTextEmpty);
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    
    DDLogDebug(@"searchBarSearchButtonClicked");
}






#pragma mark - Button Action

- (void)back {
    self.tabBarController.selectedIndex = 0;
}

#pragma mark - Getter

- (UISearchBar *)searchBar {
    if (!_searchBar) {
        _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-kSearchBarInner, kSearchBarHeight)];
        _searchBar.placeholder = kPlaceHolder;
        UITextField *textField = [_searchBar valueForKey:@"_searchField"];
        textField.textColor = [UIColor ic_colorWithHex:kSearchBarTextColor];
        textField.font = [UIFont systemFontOfSize:kSearchBarFont];
    }
    return _searchBar;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableView registerClass:[ICSearchImageTableViewCell class] forCellReuseIdentifier:cellIdentify];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
        _tableView.separatorColor = [UIColor ic_colorWithHex:kLineViewColor alpha:0.2];
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

#pragma Setter

- (void)setShowContentType:(ViewContentType)showContentType {
    self.headView.contentType = showContentType;
    switch (showContentType) {
        case ViewContentTypeHistory: {
            
            break;
        }
        case ViewContentTypeSuggestion: {
            
            break;
        }
    }
}



@end
