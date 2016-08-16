//
//  UIScrollView+Refresh.h
//  TRProject
//
//  Created by yuke on 16/7/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (Refresh)
-(void)addHeaderRefresh:(void(^)())block;
-(void)addFooterRefresh:(void(^)())block;

-(void)beginHeaderRefresh;
-(void)endHeaderRefresh;

-(void)endFooterRefresh;
@end
