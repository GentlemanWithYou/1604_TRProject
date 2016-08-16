//
//  NetManager.m
//  TRProject
//
//  Created by yuke on 16/7/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "NetManager.h"
#define kLivePath @"http://data.3g.yy.com/data/liveList?&appid=200100&model=iPhone5,2&os=iOS&osVersion=8.2&yyVersion=2.1.7&ispType=2&netType=2&channel=appstore&dataCode=1001&page=%ld&subDataCode=36"

@implementation NetManager
+(id)getLiveList:(NSInteger)page completionHandler:(void (^)(LiveListModel *, NSError *))completionHandler
{
    NSString *path = [NSString stringWithFormat:kLivePath,page];
    return [self GET:path parameters:nil completionHandler:^(id responseObject, NSError *error) {
        //NSLog(@"%@",responseObject);
        !completionHandler?:completionHandler([LiveListModel parse:responseObject],error);
    }];
}
@end
/*
 //创建网络请求的会话管理
 AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
 //1.理论上来说:AF要求把URL中的？前面的部分填入参数1，？后面的部分，填入参数二
 //也可以偷懒，把整个请求的字符串都扔到参数1
 NSString *path = [NSString stringWithFormat:kLivePath,page];
 
 //请求结束的block中会自动回归当前线程，请求结束后，返回的responseObject 是已经被JSON序列化之后的对象了。
 return [manager GET:path parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
 //请求成功
 !completionHandler?:completionHandler([LiveListModel parse:responseObject],nil);
 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
 //请求失败
 !completionHandler?:completionHandler(nil,error);
 NSLog(@"%@",error);
 }];

 */