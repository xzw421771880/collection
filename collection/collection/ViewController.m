//
//  ViewController.m
//  collection
//
//  Created by VVVVVVVVVV on 2018/1/18.
//  Copyright © 2018年 huchenchen. All rights reserved.
//

#import "ViewController.h"
#import "myCollectionViewCell.h"
#define Frame(x,y,w,h)   CGRectMake(x, y, w, h)
#define WIDTH [UIScreen mainScreen].bounds.size.width
//#define HEIGHT [UIScreen mainScreen].bounds.size.height
#define _mx [UIScreen mainScreen].bounds.size.width/375
//#define my [UIScreen mainScreen].bounds.size.height/667
#define _my [UIScreen mainScreen].bounds.size.width/375
@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView *collection_view;
    
        NSArray *typeData;
    NSMutableArray *seleteAry;//选中
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    typeData = @[@"综合",@"抽象",@"酸性",@"另类",@"圣赞",@"喜剧",@"良知",@"乡村",@"Crunk",@"旷客蓝调",@"实验",@"即兴",@"帮匪放克",@"帮匪",@"Grime",@"硬核",@"恐怖",@"器乐",@"爵士",@"黑帮",@"宅男",@"流行",@"政治",@"说唱摇滚",@"Rap Metal",@"雷吉顿",@"响指"];
    seleteAry =[typeData mutableCopy];
    
    [self add_collection];
}
#pragma mark - collection
-(void)add_collection
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(0*_mx, 0*_my);
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    collection_view = [[UICollectionView alloc]initWithFrame:Frame(0, 150, WIDTH, 30*_my) collectionViewLayout:layout];
    [collection_view registerClass:[myCollectionViewCell class] forCellWithReuseIdentifier:@"myCollectionViewCell"];
    collection_view.delegate = self;
    collection_view.dataSource = self;
    collection_view.showsHorizontalScrollIndicator = NO;
    collection_view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:collection_view];
}


#pragma mark - collection delegate
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return typeData.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    myCollectionViewCell *cell = (myCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"myCollectionViewCell" forIndexPath:indexPath];
    if ([seleteAry[indexPath.row] isEqualToString:@"1"]) {
        cell.backgroundColor = [UIColor redColor];
    }else{
        cell.backgroundColor = [UIColor grayColor];
    }
    
    cell.tag = indexPath.row + 10;
    cell.labell.text = typeData[indexPath.row];
    return cell;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100*_mx, 30*_my);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selete");
    if ([seleteAry[indexPath.row] isEqualToString:@"1"]) {
        [seleteAry replaceObjectAtIndex:indexPath.row withObject:@"0"];
    }else{
        [seleteAry replaceObjectAtIndex:indexPath.row withObject:@"1"];
    }
    [collection_view reloadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
