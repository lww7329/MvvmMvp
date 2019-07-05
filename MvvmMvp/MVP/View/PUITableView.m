//
//  PUITableView.m
//  FileDownloadPro
//
//  Created by wei.z on 2019/7/4.
//  Copyright © 2019 wei.z. All rights reserved.
//
@class PProtocol;

#import "PUITableView.h"
#import "PModel.h"
#import "PProtocol.h"
#import "UIImageView+WebCache.h"
#import "PTableViewCell.h"
@interface PUITableView()<UITableViewDelegate,UITableViewDataSource,PProtocol>

@end

@implementation PUITableView

-(instancetype)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if(self){
        self.separatorStyle=UITableViewCellSeparatorStyleNone;
        self.rowHeight=70;
        self.delegate=self;
        self.dataSource=self;
        _presenter=[PPresenter initWithView:self];
    }
    return self;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PModel *t=[self.dataArray objectAtIndex:indexPath.row];
    PTableViewCell *cell=[PTableViewCell cellWithTableView:tableView];
    cell.backgroundColor=[self randomColor];
    cell.model=t;
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(void)refTableView:(NSMutableArray *)dataArray{
    self.dataArray=dataArray;
    [self reloadData];
}

-(UIColor*)randomColor {
    NSInteger aRedValue =arc4random() %255;
    NSInteger aGreenValue =arc4random() %255;
    NSInteger aBlueValue =arc4random() %255;
    UIColor*randColor = [UIColor colorWithRed:aRedValue /255.0f green:aGreenValue /255.0f blue:aBlueValue /255.0f alpha:1.0f];
    return randColor;
}
@end
