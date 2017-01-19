//
//  ICNetworkManager.m
//  ImageChat
//
//  Created by FigureWang on 17/1/19.
//  Copyright © 2017年 Long. All rights reserved.
//

#import "ICNetworkManager.h"

static NSString *const APIBaseURLString = @"http://192.168.1.103:3000";

@implementation ICNetworkManager

+(instancetype)sharedManager {
    static ICNetworkManager *manager = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        manager = [[ICNetworkManager alloc] initWithBaseURL:[NSURL URLWithString:APIBaseURLString]];
        manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    return manager;
}

- (void)ic_GET:(NSString *)URLString
    parameters:(id)parameters
       success:(successBlock)success
       failure:(failureBlock)failure {
    [[ICNetworkManager sharedManager] GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)ic_POST:(NSString *)URLString
     parameters:(id)parameters
        success:(successBlock)success
        failure:(failureBlock)failure {
    [[ICNetworkManager sharedManager] POST:URLString
                                parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                    success(responseObject);
                                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                    failure(error);
                                }];
}



@end
