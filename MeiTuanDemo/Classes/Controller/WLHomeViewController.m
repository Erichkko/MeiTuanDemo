//
//  WLHomeViewController.m
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/24.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLHomeViewController.h"
#import "WLTopItem.h"
@interface WLHomeViewController ()

@end

@implementation WLHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNav];
}


- (void)setupNav
{
    
    UIBarButtonItem *logo = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_meituan_logo"] style:UIBarButtonItemStyleDone target:nil  action:nil];
    logo.enabled = NO;
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:[WLTopItem topItem]];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithCustomView:[WLTopItem topItem]];
    
    self.navigationItem.leftBarButtonItems  = @[logo,item1,item2];
}

- (void)clickHome
{
    NSLog(@"%s",__func__);
}
@end
