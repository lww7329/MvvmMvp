//
//  MModel.m
//  FileDownloadPro
//
//  Created by wei.z on 2019/7/3.
//  Copyright © 2019 wei.z. All rights reserved.
//

#import "MModel.h"
#import "AFNetworking.h"
@implementation MModel
-(instancetype)init{
    if(self==[super init]){
        [self requestNews];
    }
    return self;
}

-(void)requestNews{
    //1.创建管理者对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSURLSessionDataTask *task = [manager POST:@"https://www.apiopen.top/journalismApi" parameters:nil progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        __weak typeof(self) weakSelf = self;
        weakSelf.dic=(NSDictionary *)responseObject;
        if([weakSelf.deletage respondsToSelector:@selector(finishRequest)]){
            [weakSelf.deletage finishRequest];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    //5.开始启动任务
    [task resume];
}
@end
