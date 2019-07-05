//
//  ViewController.m
//  FreePro
//
//  Created by wei.z on 2019/4/17.
//  Copyright © 2019 wei.z. All rights reserved.
//

#import "ViewController.h"
#import "AFNetworking/AFNetworking.h"
#import "MTableViewController.h"
#import "PViewController.h"
@interface ViewController ()
@property(nonatomic,strong)UILabel *textLabel;
@property(nonatomic,assign)int count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button=[[UIButton alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 40)];
    [button setTitle:@"MVVM跳转" forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor blueColor]];
    [button addTarget:self action:@selector(nativeTo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    UIButton *button2=[[UIButton alloc] initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 40)];
    [button2 setTitle:@"MVP跳转" forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor greenColor]];
    [button2 addTarget:self action:@selector(nativeTo2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];

}

-(void)nativeTo{
    MTableViewController * t=[[MTableViewController alloc] init];
    UINavigationController *c=[[UINavigationController alloc] initWithRootViewController:t];
    [self presentViewController:c animated:YES completion:nil];
}
-(void)nativeTo2{
    PViewController * t=[[PViewController alloc] init];
    UINavigationController *c=[[UINavigationController alloc] initWithRootViewController:t];
    [self presentViewController:c animated:YES completion:nil];
}

@end
