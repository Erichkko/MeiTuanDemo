//
//  WLCategory.h
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/24.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLCategory : NSObject
/**highlighted_icon*/
@property(nonatomic,copy)NSString *highlighted_icon;
/**icon*/
@property(nonatomic,copy)NSString *icon;
/**name*/
@property(nonatomic,copy)NSString *name;
/**small_highlighted_icon*/
@property(nonatomic,copy)NSString *small_highlighted_icon;
/**small_highlighted_icon*/
@property(nonatomic,copy)NSString *small_icon;
/** subcategories */
@property(nonatomic,strong)NSArray *subcategories;
@end
