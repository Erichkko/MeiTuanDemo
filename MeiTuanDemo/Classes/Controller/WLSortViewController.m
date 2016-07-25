//
//  WLSortViewController.m
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/25.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLSortViewController.h"
#import "WLSort.h"
#import "MJExtension.h"

#import "WLSortCell.h"
#import "UIView+WLExtension.h"

#import "WLConst.h"
@interface WLSortViewController ()<UITableViewDataSource,UITableViewDelegate>
/** sorts */
@property(nonatomic,strong)NSArray *sorts;
@end

@implementation WLSortViewController
- (NSArray *)sorts
{
    if (_sorts == nil) {
        _sorts = [WLSort objectArrayWithFilename:@"sorts.plist" ];
    }
    return _sorts;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight = 60;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.preferredContentSize = CGSizeMake(200, self.tableView.rowHeight *self.sorts.count );
    
}
#pragma mark - UITableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sorts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.创建cell
    static NSString * ID = @"ID";
    WLSortCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [WLSortCell viewFromXib];
//        cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_rightpart"]];
//        cell.selectedBackgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dropdown_right_selected"]];
        
    }
    
    //2.取出模型
    WLSort *sort = self.sorts[indexPath.row];
    [cell setName:sort.label];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"index == %zd",indexPath.row);
    WLSort *sort = self.sorts[indexPath.row ];
    NSDictionary *userInfo = @{kSortNotificationDataKey :sort};
    [[NSNotificationCenter defaultCenter] postNotificationName:kSortNotificationDataChange object:nil userInfo:userInfo];
}
@end
