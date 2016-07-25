//
//  WLSortCell.m
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/25.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLSortCell.h"

@interface WLSortCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bgView;

@end
@implementation WLSortCell

- (void)setName:(NSString *)name
{
    self.nameLabel.text = name;
}
- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    self.bgView.highlighted = selected;
}

@end
