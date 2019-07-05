//
//  PUITableView.h
//  FileDownloadPro
//
//  Created by wei.z on 2019/7/4.
//  Copyright © 2019 wei.z. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPresenter.h"
#import "PModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface PUITableView : UITableView
@property(nonatomic,strong)PPresenter *presenter;
@property(nonatomic,strong)NSArray *dataArray;
@end

NS_ASSUME_NONNULL_END
