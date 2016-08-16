//
//  NetManager.h
//  TRProject
//
//  Created by yuke on 16/7/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LiveListModel.h"
#import "BaseNetWorking.h"

@interface NetManager : BaseNetWorking
//分页加载
+(id)getLiveList:(NSInteger)page completionHandler:(void(^)(LiveListModel *model,NSError *error))completionHandler;

@end
