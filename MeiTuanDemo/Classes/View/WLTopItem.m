//
//  WLTopItem.m
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/24.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLTopItem.h"

@interface WLTopItem()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;

@property (weak, nonatomic) IBOutlet UIButton *iconBtn;

@end

@implementation WLTopItem

 + (instancetype)topItem
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setTitle:(NSString *)title
{
    self.titleLabel.text = title;
    
}
- (void)setSubTitle:(NSString *)subtitle
{
    self.subTitleLabel.text = subtitle;
}
- (void)setIconBtnNormal:(NSString *)imageName andIconBtnClick:(NSString *)clickImageName
{
    [self.iconBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [self.iconBtn setImage:[UIImage imageNamed:clickImageName] forState:UIControlStateHighlighted];
}


-(void)addTarget:(id)target action:(SEL)action
{
    [self.iconBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}
@end
