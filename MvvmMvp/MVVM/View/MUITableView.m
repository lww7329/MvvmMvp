//
//  MUITableView.m
//  FileDownloadPro
//
//  Created by wei.z on 2019/7/3.
//  Copyright © 2019 wei.z. All rights reserved.
//
#import "MEntity.h"
#import "MUITableView.h"
#import "UIImageView+WebCache.h"

@interface MUITableView()<UITableViewDelegate,UITableViewDataSource,MViewModelDelegate>

@end
@implementation MUITableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self=[super initWithFrame:frame style:style];
    if(self){
        self.delegate=self;
        self.dataSource=self;
        _mviewmodel=[[MViewModel alloc] init];
        _mviewmodel.delegate=self;
    }
    return self;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    static NSString *reuseIdentifier = @"reuseIdentifier";
    UITableViewCell *cell=[tableView  dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(!cell){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    }
    MEntity *t=[self.mviewmodel.dataArray objectAtIndex:indexPath.row];
    cell.textLabel.text=t.title;
    cell.detailTextLabel.text=[NSString stringWithFormat:@"%@   %@",t.source,t.ptime];
    if(![t.url isEqualToString:@""]){
        [cell.imageView sd_setImageWithURL:[NSURL URLWithString:t.url] placeholderImage:[UIImage imageNamed:@"amountSource"]];
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.mviewmodel.dataArray.count;
}



-(void)refTableView{
    [self reloadData];
}

@end
