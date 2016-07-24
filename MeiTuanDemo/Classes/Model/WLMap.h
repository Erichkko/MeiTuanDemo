//
//  WLMap.h
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/24.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLMap : NSObject
/**name*/
@property(nonatomic,copy)NSString *name;
/** subregions */
@property(nonatomic,strong)NSArray *subregions;
@end
