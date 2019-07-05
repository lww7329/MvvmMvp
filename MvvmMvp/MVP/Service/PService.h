//
//  PService.h
//  FileDownloadPro
//
//  Created by wei.z on 2019/7/4.
//  Copyright © 2019 wei.z. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^success)(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject);
typedef void(^failerror)(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error);
@interface PService : NSObject
-(void)requestNews:(success)success fail:(failerror)fail;
@end

NS_ASSUME_NONNULL_END
