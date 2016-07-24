//
//  WLCategoryController.m
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/24.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLCategoryController.h"
#import "WLLRTableView.h"

#import "WLCategory.h"
#import "MJExtension.h"
@interface WLCategoryController ()<WLLRTableViewDataSource>
/** categories */
@property(nonatomic,strong)NSArray *categories;
@end

@implementation WLCategoryController
- (NSArray *)categories
{
    if (_categories == nil) {
        _categories = [WLCategory objectArrayWithFilename:@"categories.plist"];;
    }
    return _categories;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    WLLRTableView *lrView = [WLLRTableView rlTableView];
    lrView.frame = self.view.bounds;
    lrView.dataSource = self;
    [self.view addSubview:lrView];
//    lrView.categores = self.categories;
//    lrView.updateHomeTopItemBlock = self.updateHomeTopItemBlock;
//    
}

#pragma mark - WLLRTableViewDataSource
- (NSInteger) numberOfInLeftTableViewWith:(WLLRTableView *)rlTableView
{
    return self.categories.count;
}
- (NSArray *)rlTableView:(WLLRTableView *)rlTableView subdataOfRow:(NSInteger)row
{
    return [self.categories[row] subcategories];
}
- (NSString *)rlTableView:(WLLRTableView *)rlTableView leftTitlewithRow:(NSInteger)row
{
    return [self.categories[row] name];
}


- (NSString *)rlTableView:(WLLRTableView *)rlTableView imageNameForRow:(NSInteger)row
{
    WLCategory *category = self.categories[row];
    return category.small_icon;
}
- (NSString *)rlTableView:(WLLRTableView *)rlTableView heighImageNameForRow:(NSInteger)row
{
    WLCategory *category = self.categories[row];
    return category.small_highlighted_icon;
}
@end
