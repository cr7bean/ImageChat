//
//  ICNetworkManager.h
//  ImageChat
//
//  Created by FigureWang on 17/1/19.
//  Copyright © 2017年 Long. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef void(^successBlock)(id response);
typedef void(^failureBlock)(NSError *error);

@interface ICNetworkManager : AFHTTPSessionManager

+(instancetype)sharedManager;

- (void)ic_GET:(NSString *)URLString
    parameters:(id)parameters
       success:(successBlock)success
       failure:(failureBlock)failure;

- (void)ic_POST:(NSString *)URLString
     parameters:(id)parameters
        success:(successBlock)success
        failure:(failureBlock)failure;

@end
