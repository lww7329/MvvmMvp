//
//  MViewModel.h
//  FileDownloadPro
//
//  Created by wei.z on 2019/7/3.
//  Copyright © 2019 wei.z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MModel.h"
#import "MUITableView.h"
#import "MEntity.h"
NS_ASSUME_NONNULL_BEGIN
@protocol MViewModelDelegate <NSObject>
@optional
-(void)refTableView;
@end
@interface MViewModel : NSObject
@property(nonatomic,strong)MModel *model;
@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,weak)id<MViewModelDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
