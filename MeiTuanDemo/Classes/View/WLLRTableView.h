//
//  WLLRTableView.h
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/24.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WLCategory;

typedef void(^UpdateHomeTopItemBlock)(WLCategory *,NSInteger);
@interface WLLRTableView : UIView
/** categores */
@property(nonatomic,strong)NSArray *categores;
+ (instancetype)rlTableView;
/**updateHomeTopItemBlock*/
@property(nonatomic,copy)UpdateHomeTopItemBlock updateHomeTopItemBlock;
@end
