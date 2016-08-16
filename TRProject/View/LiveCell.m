//
//  LiveCell.m
//  TRProject
//
//  Created by yuke on 16/7/12.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "LiveCell.h"

@implementation LiveCell
//因为三个控件一定会被调用赋值，所以就不必须重写init方法进行调用了
-(UIImageView *)iconIV
{
    if (!_iconIV) {
        _iconIV = [UIImageView new];
        //减掉超出部分
        _iconIV.clipsToBounds = YES;
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(0);
        }];
//        _iconIV.layer.cornerRadius = 10;
//        _iconIV.layer.masksToBounds = YES;
        _iconIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV;
}
-(UILabel *)titleLb
{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        [self.contentView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.centerY.equalTo(0);
            make.bottom.equalTo(0);
            make.left.equalTo(10);
            make.top.equalTo(self.iconIV.mas_bottom);
            make.height.equalTo(28).priorityHigh();;
        }];
        _titleLb.backgroundColor = [UIColor whiteColor];
    }
    return _titleLb;
}
-(UILabel *)usersLb
{
    if (!_usersLb) {
        _usersLb = [UILabel new];
        [self.contentView addSubview:_usersLb];
        [_usersLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleLb);
            make.right.equalTo(-10);
            make.width.equalTo(50);
            //左边距离titleLb的右边，距离大于等于8像素
            make.left.greaterThanOrEqualTo(self.titleLb.mas_right).offset(8);
           
        }];
        _usersLb.backgroundColor = [UIColor whiteColor];
        _usersLb.font = [UIFont systemFontOfSize:14];
        _usersLb.textColor = [UIColor darkGrayColor];
        _usersLb.textAlignment = NSTextAlignmentRight;
    }
    return _usersLb;
}
@end
