//
//  ViewController.m
//  ImageViewScroll
//
//  Created by AnICoo1 on 2017/3/6.
//  Copyright © 2017年 AnICoo1. All rights reserved.
//

#import "ViewController.h"
#import "CLHFlowLayout.h"
#import "CLHImageCell.h"

@interface ViewController () <UICollectionViewDataSource>

@end
static NSString *ID = @"imageCell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置流水布局
    CLHFlowLayout *layout = [[CLHFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(160 , 160);
    layout.minimumLineSpacing = 50;
    //设置水平
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    //设置内边距
    CGFloat dis = ([UIScreen mainScreen].bounds.size.width - 160) * 0.5;
    layout.sectionInset = UIEdgeInsetsMake(0, dis, 0, dis);
    
    //创建UICollectionView
    UICollectionView *collectionV = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionV.backgroundColor = [UIColor greenColor];
    //设置位置和尺寸
    collectionV.bounds = CGRectMake(0, 0, self.view.bounds.size.width, 200);
    collectionV.center = self.view.center;
    [self.view addSubview:collectionV];
    //添加数据源
    collectionV.dataSource = self;
    //取消水平滑块
    collectionV.showsHorizontalScrollIndicator = NO;
    //注册cell的ID
    [collectionV registerClass:[CLHImageCell class] forCellWithReuseIdentifier:ID];

}
#pragma mark - UICollectionViewDataSource


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CLHImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}


@end
