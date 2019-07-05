//
//  PPresenter.h
//  FileDownloadPro
//
//  Created by wei.z on 2019/7/4.
//  Copyright © 2019 wei.z. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PProtocol.h"
#import "PService.h"
#import "PModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface PPresenter : NSObject
@property(nonatomic,weak)id<PProtocol>delegate;
+(instancetype)initWithView:(id<PProtocol>)view;
@property(nonatomic,strong)PService *pservice;
-(void)requestNews;
@end

NS_ASSUME_NONNULL_END
