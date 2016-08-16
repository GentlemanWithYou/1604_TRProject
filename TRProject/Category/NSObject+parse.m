//
//  NSObject+parse.m
//  TRProject
//
//  Created by yuke on 16/7/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "NSObject+parse.h"

@implementation NSObject (parse)
+(id)parse:(id)JSON
{
    if ([JSON isKindOfClass:[NSArray class]]) {
        //YYModel提供的转换数组的方法
        //标书数组中的元素通过当前类型来解析   类型对象
        return [NSArray modelArrayWithClass:[self class] json:JSON];
    }
    //根据头文件中的注释，此方法可以解析NSString,NSData,NSDictionary
    if ([JSON isKindOfClass:[NSDictionary class]] || [JSON isKindOfClass:[NSData class]] || [JSON isKindOfClass:[NSString class]]) {
        return [self modelWithJSON:JSON];
    }
    return JSON;
}
@end
