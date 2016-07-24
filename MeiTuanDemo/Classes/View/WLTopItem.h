//
//  WLTopItem.h
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/24.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLTopItem : UIView
+(instancetype)topItem;
- (void)setTitle:(NSString *)title;
- (void)setSubTitle:(NSString *)subtitle;
- (void)setIconBtnNormal:(NSString *)imageName andIconBtnClick:(NSString *)clickImageName;

//传递按钮点击事件
-(void)addTarget:(id)target action:(SEL)action ;
@end
