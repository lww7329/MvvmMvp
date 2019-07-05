//
//  MModel.h
//  FileDownloadPro
//
//  Created by wei.z on 2019/7/3.
//  Copyright © 2019 wei.z. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol MModelDelegate <NSObject>
@optional
-(void)finishRequest;
@end
@interface MModel : NSObject
@property(nonatomic,strong)NSDictionary *dic;
@property(nonatomic,weak)id<MModelDelegate>deletage;
@end

NS_ASSUME_NONNULL_END
