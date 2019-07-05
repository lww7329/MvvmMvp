//
//  PViewController.m
//  FileDownloadPro
//
//  Created by wei.z on 2019/7/4.
//  Copyright © 2019 wei.z. All rights reserved.
//

#import "PViewController.h"
#import "PUITableView.h"

@interface PViewController ()<UITableViewDelegate>
@property(nonatomic,strong)PUITableView *tableView;
@end

@implementation PViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView=[[PUITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    [self.tableView.presenter requestNews];
    self.tableView.delegate=self;
    [self.view addSubview:self.tableView];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    PModel *model=[self.tableView.dataArray objectAtIndex:indexPath.row];
    if(model.link){
        NSURL *url = [NSURL URLWithString:model.link];
        SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:url];
        [self presentViewController:safariVC animated:YES completion:nil];
    }
}

@end
