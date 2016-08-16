//
//  BaseNetWorking.h
//  TRProject
//
//  Created by yuke on 16/7/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseNetWorking : NSObject
//GET:速度快，上传不大于1KB
+ (id)GET:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj,NSError *error))completionHandler;
//POST:上传数据不限大小，更安全
+ (id)POST:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj,NSError *error))completionHandler;
@end
