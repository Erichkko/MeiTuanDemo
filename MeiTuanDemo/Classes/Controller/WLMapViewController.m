//
//  WLMapViewController.m
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/24.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLMapViewController.h"
#import "WLLRTableView.h"
#import "WLMap.h"
#import "MJExtension.h"
@interface WLMapViewController ()<WLLRTableViewDataSource>
/** maps */
@property(nonatomic,strong)NSArray *maps;
@end

@implementation WLMapViewController
- (NSArray *)maps
{
    if (_maps == nil) {
        _maps = [WLMap objectArrayWithFilename:@"gz.plist"];;
    }
    return _maps;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    WLLRTableView *lrView = [WLLRTableView rlTableView];
    
    lrView.dataSource = self;
    lrView.frame = self.view.bounds;
    [self.view addSubview:lrView];
}
#pragma mark - WLLRTableViewDataSource
- (NSInteger) numberOfInLeftTableViewWith:(WLLRTableView *)rlTableView
{
    return self.maps.count;
}
- (NSArray *)rlTableView:(WLLRTableView *)rlTableView subdataOfRow:(NSInteger)row
{
    return [self.maps[row] subregions];
}

- (NSString *)rlTableView:(WLLRTableView *)rlTableView leftTitlewithRow:(NSInteger)row
{
    return [self.maps[row] name];
}


@end
