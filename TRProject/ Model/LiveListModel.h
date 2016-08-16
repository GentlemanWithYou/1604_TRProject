//
//  LiveListModel.h
//  TRProject
//
//  Created by yuke on 16/7/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LiveListDataModel, LiveListDataLivelistModel;
@interface LiveListModel : NSObject
//id->identify
//@property(nonatomic)NSString *identify;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, strong) LiveListDataModel *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface LiveListDataModel : NSObject

@property (nonatomic, assign) NSInteger isLastPage;

@property (nonatomic, strong) NSArray<LiveListDataLivelistModel *> *liveList;

@end

@interface LiveListDataLivelistModel : NSObject

@property (nonatomic, copy) NSString *thumb;

@property (nonatomic, assign) NSInteger start;

@property (nonatomic, assign) NSInteger liveType;

@property (nonatomic, assign) NSInteger tagId;

@property (nonatomic, assign) NSInteger users;

@property (nonatomic, copy) NSString *liveDesc;

@property (nonatomic, copy) NSString *tagContent;

@property (nonatomic, assign) NSInteger specificRecommend;

@property (nonatomic, copy) NSString *liveName;

@property (nonatomic, assign) NSInteger liveId;

@property (nonatomic, assign) NSInteger liveTime;

@property (nonatomic, copy) NSString *avatar;

@property (nonatomic, assign) NSInteger sid;

@property (nonatomic, assign) NSInteger ssid;

@property (nonatomic, assign) NSInteger nameStyle;

@property (nonatomic, copy) NSString *stageName;

@end

