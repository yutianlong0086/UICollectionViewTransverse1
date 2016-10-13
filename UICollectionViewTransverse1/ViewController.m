//
//  ViewController.m
//  UICollectionViewTransverse1
//
//  Created by 余天龙 on 16/10/12.
//  Copyright © 2016年 http://blog.csdn.net/yutianlong9306/. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "UITransverseTableCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray<NSArray<NSString *> *> *dataSource;

@property (nonatomic, strong) NSMutableDictionary<NSString *, NSValue *> *pointCache;

@end

@implementation ViewController

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
    }
    return _tableView;
}

- (NSMutableDictionary<NSString *,NSValue *> *)pointCache {
    if (!_pointCache) {
        _pointCache = [NSMutableDictionary new];
    }
    return _pointCache;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataSource = @[
                        @[@"wanxia1", @"hai1", @"wanxia2", @"hai2", @"wanxia3", @"hai3"],
                        @[@"wanxia1", @"hai1", @"wanxia2", @"hai2", @"wanxia3", @"hai3"],
                        @[@"wanxia1", @"hai1", @"wanxia2", @"hai2", @"wanxia3", @"hai3"],
                        @[@"wanxia1", @"hai1", @"wanxia2", @"hai2", @"wanxia3", @"hai3"],
                        @[@"wanxia1", @"hai1", @"wanxia2", @"hai2", @"wanxia3", @"hai3"],
                        @[@"wanxia1", @"hai1", @"wanxia2", @"hai2", @"wanxia3", @"hai3"],
                        @[@"wanxia1", @"hai1", @"wanxia2", @"hai2", @"wanxia3", @"hai3"],
                        @[@"wanxia1", @"hai1", @"wanxia2", @"hai2", @"wanxia3", @"hai3"],
                        @[@"wanxia1", @"hai1", @"wanxia2", @"hai2", @"wanxia3", @"hai3"],
                        @[@"wanxia1", @"hai1", @"wanxia2", @"hai2", @"wanxia3", @"hai3"],
                        @[@"wanxia1", @"hai1", @"wanxia2", @"hai2", @"wanxia3", @"hai3"]
                        ];
    
    [self.tableView registerClass:[UITransverseTableCell class] forCellReuseIdentifier:[UITransverseTableCell reuseIdentifier]];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@64);
        make.leading.trailing.equalTo(@0);
        make.bottom.equalTo(@(-50));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource, UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 220;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITransverseTableCell *cell = [tableView dequeueReusableCellWithIdentifier:[UITransverseTableCell reuseIdentifier] forIndexPath:indexPath];
    
    WEAK_SELF();
    NSValue *pointValue = [self.pointCache objectForKey:[NSString stringWithFormat:@"%ld", indexPath.section]];
    [cell setupWithDataSource:self.dataSource[indexPath.section] pointValue:pointValue];
    
    [cell setPointChangeBlock:^(NSValue *pointValue) {
        [weakSelf.pointCache setObject:pointValue forKey:[NSString stringWithFormat:@"%ld", indexPath.section]];
    }];
    
    [cell setDidSelectItemBlock:^(NSUInteger section, NSUInteger row) {
        NSString *string = [NSString stringWithFormat:@"\nsec: %ld \nrow: %ld", indexPath.section, row];
        NSLog(@"%@", string);
    }];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    return view;
}


@end
