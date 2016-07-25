//
//  UIView+WLExtension.m
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/25.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "UIView+WLExtension.h"

@implementation UIView (WLExtension)

+ (instancetype)viewFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil ] lastObject];
}
@end
