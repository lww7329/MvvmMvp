//
//  MTableViewController.m
//  FileDownloadPro
//
//  Created by wei.z on 2019/7/3.
//  Copyright © 2019 wei.z. All rights reserved.
//

#import "MTableViewController.h"
#import "MUITableView.h"
#import <SafariServices/SafariServices.h>
@interface MTableViewController ()<UITableViewDelegate,SFSafariViewControllerDelegate>
@property(nonatomic,strong)MUITableView *tableView;
@end

@implementation MTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView=[[MUITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.tableView.delegate=self;
    [self.view addSubview:self.tableView];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        MEntity *t=[self.tableView.mviewmodel.dataArray objectAtIndex:indexPath.row];
        NSURL *url = [NSURL URLWithString:t.link];
        SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:url];
        safariVC.delegate=self;
        [self presentViewController:safariVC animated:YES completion:nil];
}


@end
