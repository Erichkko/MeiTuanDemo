//
//  WLHomeViewController.m
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/24.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLHomeViewController.h"
#import "WLTopItem.h"
#import "WLCategory.h"
#import "WLCategoryController.h"
#import "WLMapViewController.h"

@interface WLHomeViewController ()
/** popVc */
@property(nonatomic,strong)WLCategoryController *popVc;
/** mapPopVc */
@property(nonatomic,strong)WLMapViewController *mapPopVc;


/** categoryItemView */
@property(nonatomic,strong)WLTopItem *categoryItemView;
/** mapItemView */
@property(nonatomic,strong)  WLTopItem *mapItemView;
/** sortItemView */
@property(nonatomic,strong)  WLTopItem *sortItemView;
@end

@implementation WLHomeViewController

- (WLMapViewController *)mapPopVc
{
    if (_mapPopVc == nil) {
        _mapPopVc = [[WLMapViewController alloc] init];
        _mapPopVc.modalPresentationStyle = UIModalPresentationPopover;
    }
    return _mapPopVc;
}

- (WLCategoryController *)popVc
{
    if (_popVc == nil) {
        _popVc = [[WLCategoryController alloc] init];
        _popVc.modalPresentationStyle = UIModalPresentationPopover;
        
    }
    return _popVc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
}


- (void)setupNav
{
    
    UIBarButtonItem *logo = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil  action:nil];
    logo.enabled = NO;
    WLTopItem *categoryItemView = [WLTopItem topItem];
    [categoryItemView setTitle:@"美团"];
    [categoryItemView setSubTitle:@"全部种类"];
    [categoryItemView setIconBtnNormal:@"icon_category_-1" andIconBtnClick:@"icon_category_highlighted_-1"];
    [categoryItemView addTarget:self action:@selector(clickCategory)];
    self.categoryItemView = categoryItemView;
    
    WLTopItem *mapItemView = [WLTopItem topItem];
    [mapItemView setTitle:@"新加坡"];
    [mapItemView setSubTitle:@"全部区域"];
    [mapItemView setIconBtnNormal:@"icon_district" andIconBtnClick:@"icon_district_highlighted"];
    [mapItemView addTarget:self action:@selector(clickMap)];
    self.mapItemView = mapItemView;
  
    WLTopItem *sortItemView = [WLTopItem topItem];
    [sortItemView setTitle:@"排序"];
    [sortItemView setSubTitle:@"默认排序"];
    [sortItemView setIconBtnNormal:@"icon_sort" andIconBtnClick:@"icon_sort_highlighted"];
    [sortItemView addTarget:self action:@selector(clickSort)];
    self.sortItemView = sortItemView;
    
    UIBarButtonItem *categoryItem = [[UIBarButtonItem alloc] initWithCustomView:categoryItemView];
    UIBarButtonItem *mapItem = [[UIBarButtonItem alloc] initWithCustomView:mapItemView];
    UIBarButtonItem *sortItem = [[UIBarButtonItem alloc] initWithCustomView:sortItemView];
    
    self.navigationItem.leftBarButtonItems  = @[logo,categoryItem,mapItem,sortItem];
}

- (void)clickCategory
{
    NSLog(@"%s",__func__);
    self.popVc.popoverPresentationController.sourceRect = self.categoryItemView.bounds;
    self.popVc.popoverPresentationController.sourceView = self.categoryItemView;
    self.popVc.popoverPresentationController.backgroundColor = [UIColor whiteColor];
    __weak typeof(self) weakSelf = self;
    self.popVc.updateHomeTopItemBlock = ^(WLCategory *category,NSInteger row){
        [weakSelf.categoryItemView setTitle:category.name];
        [weakSelf.categoryItemView setSubTitle:category.subcategories[row]];
        [weakSelf.categoryItemView setIconBtnNormal:category.icon andIconBtnClick:category.highlighted_icon];
        [weakSelf.popVc dismissViewControllerAnimated:YES completion:nil];
    };
    [self presentViewController:self.popVc animated:YES completion:nil];
}
- (void)clickMap
{
    NSLog(@"%s",__func__);
    self.mapPopVc.popoverPresentationController.sourceRect = self.mapItemView.bounds;
    self.mapPopVc.popoverPresentationController.sourceView = self.mapItemView;
    self.mapPopVc.popoverPresentationController.backgroundColor = [UIColor whiteColor];
    [self presentViewController:self.mapPopVc animated:YES completion:nil];
}
- (void)clickSort
{
    NSLog(@"%s",__func__);
    self.popVc.popoverPresentationController.sourceRect = self.sortItemView.bounds;
    self.popVc.popoverPresentationController.sourceView = self.sortItemView;
    self.popVc.popoverPresentationController.backgroundColor = [UIColor whiteColor];
    [self presentViewController:self.popVc animated:YES completion:nil];
}
@end
