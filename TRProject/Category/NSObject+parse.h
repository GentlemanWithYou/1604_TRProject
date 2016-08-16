//
//  NSObject+parse.h
//  TRProject
//
//  Created by yuke on 16/7/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>
//------------------一定要遵循这个协议👇
@interface NSObject (parse)<YYModel>
//YYModel提供了两个解析方法，一个解析数组，一个解析字典
+(id)parse:(id)JSON;
@end
