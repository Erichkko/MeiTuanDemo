//
//  WLNavViewController.m
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/24.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLNavViewController.h"

@interface WLNavViewController ()

@end

@implementation WLNavViewController

+ (void)initialize
{
    UINavigationBar *bar = [UINavigationBar appearance];
    //改变导航控制器的 背景图片
    [bar setBackgroundImage:[UIImage imageNamed:@"bg_navigationBar_normal"] forBarMetrics:UIBarMetricsDefault];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
