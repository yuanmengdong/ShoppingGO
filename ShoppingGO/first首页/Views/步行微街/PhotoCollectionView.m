//
//  PhotoCollectionView.m
//  首页测试1
//
//  Created by rimi on 16/3/25.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "PhotoCollectionView.h"

#import "PhotoCollectionViewCell.h"

@interface PhotoCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource>

{
    NSIndexPath * _indexPath;
}

@property (nonatomic, retain)UICollectionView * collectionView;
@property (nonatomic, strong) NSMutableArray * dataSource;

@end

@implementation PhotoCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialiDataSource];
        [self initialiUserInterFace];
    }
    return self;
}

-(void)initialiDataSource{
    self.dataSource = [NSMutableArray array];
    for (int i = 0; i < 2; i ++) {
        NSString * str = @"1";
        NSMutableDictionary * dic = [NSMutableDictionary dictionary];
        [dic setObject:str forKey:@"number"];
        [self.dataSource addObject:dic];
    }
}

-(void)initialiUserInterFace{
    [self addSubview:self.collectionView];
}

#pragma mark - collectionViewDataSource

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    cell.imageView.image = self.dataSource[indexPath.item][@"image"];
    return cell;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

#pragma mark - collectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    _indexPath = indexPath;

}
    
#pragma mark - getter

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = ({
        
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.minimumLineSpacing = 1;
            layout.minimumInteritemSpacing = 1;
            if (_dataSource.count == 1) {
                layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.width );
            }else if (_dataSource.count == 2 ||_dataSource.count == 4){
                layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.width / 2);
            }else{
                layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 3, [UIScreen mainScreen].bounds.size.width / 3);
            }
            layout.headerReferenceSize = CGSizeMake(CGRectGetWidth(self.bounds), 0);
            layout.footerReferenceSize = CGSizeMake(CGRectGetWidth(self.bounds), 0);
            
            UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
            collectionView.delegate = self;
            collectionView.dataSource = self;
            
            collectionView.contentInset = UIEdgeInsetsMake(1, -1, 1, -1);
            collectionView.backgroundColor = [UIColor whiteColor];
            
            [collectionView registerNib:[UINib nibWithNibName:@"PhotoCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
            
            
            
            collectionView;
        });
    }
    return _collectionView;
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
