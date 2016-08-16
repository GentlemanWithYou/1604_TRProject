//
//  NSString+QC.m
//  TRProject
//
//  Created by yuke on 16/7/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "NSString+QC.h"

@implementation NSString (QC)
-(NSURL *)QC_URL
{
    return [NSURL URLWithString:self];
}
@end
