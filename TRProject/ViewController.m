//
//  ViewController.m
//  TRProject
//
//  Created by yingxin on 16/7/10.
//  Copyright © 2016年 yingxin. All rights reserved.
//

#import "ViewController.h"
#import "LiveListViewModel.h"
#import "LiveCell.h"

@interface ViewController ()
@property(nonatomic)LiveListViewModel *LiveListVM;

@end

@implementation ViewController
-(LiveListViewModel *)LiveListVM
{
    if (!_LiveListVM) {
        _LiveListVM = [LiveListViewModel new];
    }
    return _LiveListVM;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%ld",self.LiveListVM.rowNumber);
    //行数对于写VC的人来说，是不需要思考的，直接从VM拿就可以了，因为具体的思考逻辑被封装到了VM层
    return self.LiveListVM.rowNumber;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LiveCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.titleLb.text = [self.LiveListVM titleForRow:indexPath.row];
    cell.usersLb.text = [self.LiveListVM usersForRow:indexPath.row];
    //YYWebImage提供的网络图片获取方法
    //参数二：网络图片没有下载完毕之前的默认图
    [cell.iconIV setImageWithURL:[self.LiveListVM iconURLForRow:indexPath.row] placeholder:nil];
    return cell;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[LiveCell class] forCellWithReuseIdentifier:@"Cell"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    //四边距
    layout.sectionInset = UIEdgeInsetsZero;
    //行间距
    layout.minimumLineSpacing = 10;
    //列间距
    layout.minimumInteritemSpacing = 4;
    //宽高
    CGFloat width =(long)(([UIScreen mainScreen].bounds.size.width - 4)/2);
    CGFloat height = width + 28;
    layout.itemSize = CGSizeMake(width, height);
    //布局等于 layout
    self.collectionView.collectionViewLayout = layout;
    
    
    
    //添加头部刷新
    
    //如果是封装之后，block内部会出现self的循环引用警告
    //需要用__weak来修饰self 打破这个循环
    __weak typeof (self) weakSelf = self;
    [self.collectionView addHeaderRefresh:^{
        [weakSelf.LiveListVM getData:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endHeaderRefresh];
        }];
    }];
    [self.collectionView beginHeaderRefresh];
    
    //添加脚步刷新
    [self.collectionView addFooterRefresh:^{
        [weakSelf.LiveListVM getData:RequestModeRefresh completionHandler:^(NSError *error) {
            [weakSelf.collectionView reloadData];
            [weakSelf.collectionView endFooterRefresh];
        }];
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
