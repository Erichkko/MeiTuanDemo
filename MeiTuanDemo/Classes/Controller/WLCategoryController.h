//
//  WLCategoryController.h
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/24.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WLCategory;
typedef void(^UpdateHomeTopItemBlock)(WLCategory *,NSInteger);
@interface WLCategoryController : UIViewController
/**updateHomeTopItemBlock*/
@property(nonatomic,copy)UpdateHomeTopItemBlock updateHomeTopItemBlock;
@end
