//
//  BaseNetWorking.m
//  TRProject
//
//  Created by yuke on 16/7/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "BaseNetWorking.h"
#import "LiveListModel.h"

@implementation BaseNetWorking
+(id)POST:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void (^)(id, NSError *))completionHandler
{
    /*
  封装第三方框架的好处：
  1.让整个原生代码与第三方的接触尽量保持最少，这样可以防止需求变更（领导要求换框架）
  2.第三方毕竟不是你的，有可能失去维护，出现淘汰或错误。
  */
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //默认AF只会使用JSON序列化 服务器返回的头文件中 contentType 是 "application/json"类型的数据
    //手动添加，让AF能够解析各种contentType
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/json",@"text/jaavascript",@"text/plain",nil];
    
    return [manager POST:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",task.currentRequest.URL.absoluteString);
        !completionHandler?:completionHandler(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",task.currentRequest.URL.absoluteString);
        !completionHandler?:completionHandler(nil,error);
        
    }];
}
+ (id)GET:(NSString *)path parameters:(NSDictionary *)parameters completionHandler:(void(^)(id responseObj,NSError *error))completionHandler
{
    /*
     封装第三方框架的好处：
     1.让整个原生代码与第三方的接触尽量保持最少，这样可以防止需求变更（领导要求换框架）
     2.第三方毕竟不是你的，有可能失去维护，出现淘汰或错误。
     */
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //默认AF只会使用JSON序列化 服务器返回的头文件中 contentType 是 "application/json"类型的数据
    //手动添加，让AF能够解析各种contentType
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/json",@"text/javascript",@"text/plain",nil];
    
    return [manager GET:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",task.currentRequest.URL.absoluteString);
        !completionHandler?:completionHandler(responseObject,nil);
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",task.currentRequest.URL.absoluteString);
        !completionHandler?:completionHandler(nil,error);
        
    }];
}
@end
/*
//创建网络请求的会话管理
AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//1.理论上来说:AF要求把URL中的？前面的部分填入参数1，？后面的部分，填入参数二
//也可以偷懒，把整个请求的字符串都扔到参数1
//    NSString *path = [NSString stringWithFormat:kLivePath,page];

//请求结束的block中会自动回归当前线程，请求结束后，返回的responseObject 是已经被JSON序列化之后的对象了。
[manager GET:path parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //请求成功
    !completionHandler?:completionHandler([LiveListModel parse:responseObject],nil);
} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //请求失败
    !completionHandler?:completionHandler(nil,error);
    NSLog(@"%@",error);
}];
return manager;
*/