//
//  LiveListModel.m
//  TRProject
//
//  Created by yuke on 16/7/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "LiveListModel.h"

@implementation LiveListModel
//当.h文件中的属性，和 JSON中的 Key不一致时，需要做对应处理


+(NSDictionary<NSString * ,id>*)modelCustomPropertyMapper
{
    //@{@"属性名":@"key"}
    return @{@"identify":@"id"};
}


@end
@implementation LiveListDataModel
//设置data 属性这个数组中的元素，使用哪个类来解析
+(NSDictionary<NSString*,id>*)modelContainerPropertyGenericClass
{
    //@{属性名：此数组中元素的解析类型}
    return @{@"liveList":[LiveListDataLivelistModel class]};
}
@end


@implementation LiveListDataLivelistModel

@end


