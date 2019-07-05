//
//  PPresenter.m
//  FileDownloadPro
//
//  Created by wei.z on 2019/7/4.
//  Copyright © 2019 wei.z. All rights reserved.
//
#import "PPresenter.h"
@implementation PPresenter
-(instancetype)initWithView:(id<PProtocol>)view{
    if(self=[super init]){
        _delegate=view;
        _pservice=[[PService alloc] init];
    }
    return self;
}
+(instancetype)initWithView:(id<PProtocol>)view{
    return [[self alloc] initWithView:view];
}

-(void)requestNews{
    [self.pservice requestNews:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSMutableArray* dataArray=[self processModel:responseObject];
        [self.delegate refTableView:dataArray];
    } fail:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

-(NSMutableArray*)processModel:(NSDictionary *)dic{
    NSMutableArray* dataArray=[[NSMutableArray alloc] init];
    NSDictionary *dicdata=dic[@"data"];
    [dicdata enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSArray *array=(NSArray *)obj;
        for(int i=0;i<array.count;i++){
            NSDictionary *dic=[array objectAtIndex:i];
            PModel *entity=[[PModel alloc] init];
            NSArray *picArray=dic[@"picInfo"];
            entity.url=picArray.count!=0?[picArray objectAtIndex:0][@"url"]:@"";
            entity.source=dic[@"source"];
            entity.title=dic[@"title"];
            entity.ptime=dic[@"ptime"];
            entity.digest=dic[@"digest"];
            entity.link=dic[@"link"];
            [dataArray addObject:entity];
        }
    }];
//    NSArray *array=dic[@"data"][@"tech"];

//    for(int i=0;i<array.count;i++){
//        NSDictionary *dic=[array objectAtIndex:i];
//        PModel *entity=[[PModel alloc] init];
//        NSArray *picArray=dic[@"picInfo"];
//        entity.url=picArray.count!=0?[picArray objectAtIndex:0][@"url"]:@"";
//        entity.link=dic[@"link"];
//        entity.source=dic[@"source"];
//        entity.title=dic[@"title"];
//        entity.ptime=dic[@"ptime"];
//        entity.digest=dic[@"digest"];
//        [dataArray addObject:entity];
//    }
    return dataArray;
}
@end
