//
//  LiveListViewModel.m
//  TRProject
//
//  Created by yuke on 16/7/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "LiveListViewModel.h"

@implementation LiveListViewModel
-(NSMutableArray<LiveListDataLivelistModel *> *)dataList
{
    if (!_dataList) {
        _dataList = [NSMutableArray new];
        
    }
    return _dataList;
}
-(void)getData:(RequestMode)requestMode completionHandler:(void (^)(NSError *))completionHandler{
    NSInteger tmpPage = 1;
    if (requestMode == RequestModeMore) {
        tmpPage = _page + 1;
    }
    _dataTask = [NetManager getLiveList:tmpPage completionHandler:^(LiveListModel *model, NSError *error) {
        if (!error) {//如果请求没有错误
        if (requestMode == RequestModeRefresh) {
            [self.dataList removeAllObjects];
        }
            //想一想这个dataList中的元素是什么类型的
            [self.dataList addObjectsFromArray:model.data.liveList];
            _page = tmpPage;
        }
        !completionHandler?:completionHandler(error);
    }];
    NSLog(@"%@",_dataTask);

                 }
-(NSInteger)rowNumber{
    return self.dataList.count;
}
-(NSURL *)iconURLForRow:(NSInteger)row
{
    //去添加NSString的类别，转化URL，类别放PCH中
    return self.dataList[row].thumb.QC_URL;
}
-(NSString *)titleForRow:(NSInteger)row
{
    return self.dataList[row].liveDesc;
}
- (NSString *)usersForRow:(NSInteger)row{
    NSInteger users = self.dataList[row].users;
    if (users >= 10000) {
        return [NSString stringWithFormat:@"%.1f万人", users / 10000.0];
    }else{
        return [NSString stringWithFormat:@"%ld人", users];
    }
}
@end
