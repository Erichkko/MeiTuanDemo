//
//  WLMapViewController.m
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/24.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLMapViewController.h"
#import "WLLRTableView.h"
@interface WLMapViewController ()

@end

@implementation WLMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WLLRTableView *lrView = [WLLRTableView rlTableView];
    lrView.frame = self.view.bounds;
    [self.view addSubview:lrView];
}

@end
