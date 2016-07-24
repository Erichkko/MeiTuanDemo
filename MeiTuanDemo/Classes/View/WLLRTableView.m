//
//  WLLRTableView.m
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/24.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLLRTableView.h"
#import "WLCategory.h"

#import "WLLeftCell.h"
#import "WLRighteCell.h"
@interface WLLRTableView()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

@end
@implementation WLLRTableView

- (void)awakeFromNib
{
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    
    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
}
+ (instancetype)rlTableView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

- (void)setCategores:(NSArray *)categores
{
    _categores = categores;
    [self.leftTableView reloadData];
}
#pragma mark - UITableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *array =self.categores;
    if (tableView == self.leftTableView) {
        return array.count;
    }else{
        WLCategory *category = array[[self.leftTableView indexPathForSelectedRow].row];
        return category.subcategories.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    if (tableView ==self.leftTableView) {
        //1.创建cell
        cell = [WLLeftCell leftCell:tableView];
        
        //2.取出模型
        WLCategory *category = self.categores[indexPath.row];
        cell.textLabel.text = category.name;
        cell.imageView.image = [UIImage imageNamed:category.small_icon];
        cell.imageView.highlightedImage = [UIImage imageNamed:category.small_highlighted_icon];
   
    }else{
        //1.创建cell
        cell = [WLRighteCell rightCell:tableView];
        
        //2.取出模型
        NSArray *array =self.categores;
        WLCategory *category = array[[self.leftTableView indexPathForSelectedRow].row];
        cell.textLabel.text = category.subcategories[indexPath.row];
    
    }
    
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView) {
        [self.rightTableView reloadData];
    }else{
        NSArray *array =self.categores;
        WLCategory *category = array[[self.leftTableView indexPathForSelectedRow].row];
        if (self.updateHomeTopItemBlock) {
            self.updateHomeTopItemBlock(category,indexPath.row);
        }
    }
}

@end
