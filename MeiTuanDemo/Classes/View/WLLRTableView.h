//
//  WLLRTableView.h
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/24.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WLLRTableView;

@protocol WLLRTableViewDataSource <NSObject>

@required
- (NSInteger) numberOfInLeftTableViewWith:(WLLRTableView *)rlTableView;
- (NSArray *)rlTableView:(WLLRTableView *)rlTableView subdataOfRow:(NSInteger)row;
- (NSString *)rlTableView:(WLLRTableView *)rlTableView leftTitlewithRow:(NSInteger)row;

@optional
- (NSString *)rlTableView:(WLLRTableView *)rlTableView imageNameForRow:(NSInteger)row;
- (NSString *)rlTableView:(WLLRTableView *)rlTableView heighImageNameForRow:(NSInteger)row;

@end
@interface WLLRTableView : UIView

+ (instancetype)rlTableView;
/** datasource */
@property(nonatomic,weak)id <WLLRTableViewDataSource>dataSource;

@end
