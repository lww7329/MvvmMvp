//
//  MViewModel.m
//  FileDownloadPro
//
//  Created by wei.z on 2019/7/3.
//  Copyright © 2019 wei.z. All rights reserved.
//

#import "MViewModel.h"
@interface MViewModel()<MModelDelegate>

@end
@implementation MViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        _model=[[MModel alloc] init];
        _model.deletage=self;
    }
    return self;
}

-(void)finishRequest{
    [self processModel];
}

-(void)processModel{
    NSArray *array=self.model.dic[@"data"][@"tech"];
    self.dataArray=[[NSMutableArray alloc] init];
    for(int i=0;i<array.count;i++){
        NSDictionary *dic=[array objectAtIndex:i];
        MEntity *entity=[[MEntity alloc] init];
        NSArray *picArray=dic[@"picInfo"];
        entity.url=picArray.count!=0?[picArray objectAtIndex:0][@"url"]:@"";
        entity.link=dic[@"link"];
        entity.source=dic[@"source"];
        entity.title=dic[@"title"];
        entity.ptime=dic[@"ptime"];
        [self.dataArray addObject:entity];
    }
    if([self.delegate respondsToSelector:@selector(refTableView)]){
        [self.delegate refTableView];
    }
}
@end
