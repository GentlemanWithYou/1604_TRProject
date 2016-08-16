//
//  LiveListViewModel.h
//  TRProject
//
//  Created by yuke on 16/7/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "NetManager.h"
/*
 视图模型层，把ViewController中的逻辑性的操作，都独立出来
 约定：这个类中不能出现UI开头的类
 */

typedef NS_ENUM(NSUInteger, RequestMode) {
    RequestModeRefresh,
    RequestModeMore,
};

@interface LiveListViewModel : NSObject
//根据UI来决定的方法和属性
//有多少个Cell   计算属性
@property(nonatomic,readonly)NSInteger rowNumber;
//某一行显示的图片地址URL
-(NSURL*)iconURLForRow:(NSInteger)row;
//某一行显示的题目
-(NSString*)titleForRow:(NSInteger)row;
//某一行显示的人数
- (NSString *)usersForRow:(NSInteger)row;



//根据Model来决定的方法和属性
@property(nonatomic)NSInteger page;
//所有的Cell中的类型
@property(nonatomic)NSMutableArray<LiveListDataLivelistModel*> *dataList;
-(void)getData:(RequestMode)requestMode completionHandler:(void(^)(NSError *error))completionHandler;
//保存当前的网络任务
@property(nonatomic,readonly)NSURLSessionDataTask *dataTask;
@end
