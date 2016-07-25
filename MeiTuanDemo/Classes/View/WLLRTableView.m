//
//  WLLRTableView.m
//  MeiTuanDemo
//
//  Created by wanglong on 16/7/24.
//  Copyright © 2016年 wanglong. All rights reserved.
//

#import "WLLRTableView.h"


#import "WLLeftCell.h"
#import "WLRighteCell.h"
@interface WLLRTableView()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *leftTableView;
@property (weak, nonatomic) IBOutlet UITableView *rightTableView;

/** subData */
@property(nonatomic,strong)NSArray *subData;
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

#pragma mark - UITableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSInteger number = 0;
    if (tableView == self.leftTableView) {
        number = [self.dataSource numberOfInLeftTableViewWith:self];
    }else{
        number = self.subData.count;
       
    }
    return number;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    if (tableView ==self.leftTableView) {
        //1.创建cell
        cell = [WLLeftCell leftCell:tableView];
        
        //2.取出模型
        cell.textLabel.text = [self.dataSource rlTableView:self leftTitlewithRow:indexPath.row];
        
        if ([self.dataSource respondsToSelector:@selector(rlTableView:imageNameForRow:)]) {
    
            cell.imageView.image = [UIImage imageNamed:[self.dataSource rlTableView:self imageNameForRow:indexPath.row]];
        }
        if ([self.dataSource respondsToSelector:@selector(rlTableView:heighImageNameForRow:)]) {
            cell.imageView.highlightedImage = [UIImage imageNamed:[self.dataSource rlTableView:self heighImageNameForRow:indexPath.row]];
        }
        
    }else{
        //1.创建cell
        cell = [WLRighteCell rightCell:tableView];
        
        //2.取出模型
        cell.textLabel.text = self.subData[indexPath.row];
        
    }
    
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == self.leftTableView) {
        self.subData = [self.dataSource rlTableView:self subdataOfRow:indexPath.row];
        [self.rightTableView reloadData];
        
        if ([self.delegate respondsToSelector:@selector(rlTableView:selectedLeftIndex:)]) {
            [self.delegate rlTableView:self selectedLeftIndex:indexPath.row];
        }
    }else{
        if ([self.delegate respondsToSelector:@selector(rlTableView:selectedLeftIndex:andSelectedRight:)]) {
            [self.delegate rlTableView:self selectedLeftIndex:[self.leftTableView indexPathForSelectedRow].row andSelectedRight:indexPath.row];
        }
    }
}

@end
