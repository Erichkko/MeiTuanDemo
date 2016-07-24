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
@interface WLCategoryController ()
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
    [self.view addSubview:lrView];
    NSLog(@"array =  %@",self.categories);
    lrView.categores = self.categories;
    lrView.updateHomeTopItemBlock = self.updateHomeTopItemBlock;
    
}


@end
