//
//  ShopShowView.m
//  发送动态界面
//
//  Created by rimi on 16/3/29.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "ShopShowView.h"
#import "imageShopShowCollectionViewCell.h"

@interface ShopShowView () <UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

{
    NSIndexPath *_indexPath;
}

@property (nonatomic, retain)UITextField * wordsTextFlied;

@property (nonatomic, strong) NSMutableArray * dataSource;
@property (nonatomic, retain)UICollectionView * collectionView;

@end

@implementation ShopShowView

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
    
    
}


-(void)initialiUserInterFace{
    [self addSubview:self.wordsTextFlied];
    [self addSubview:self.moneyTextFlied];

}

- (void)takePhoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //数据源
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    picker.allowsEditing = YES;
    picker.delegate = self;
//    [self presentViewController:picker animated:YES completion:nil];
}

#pragma mark -- collectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    _indexPath = indexPath;
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请选择" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开相册
        [self takePhoto];
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:photoAction];
    [alert addAction:cancelAction];

//    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark -- collectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    imageShopShowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdf" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    cell.imageShopShowCollection.image = self.dataSource[indexPath.item][@"image"];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerIdf" forIndexPath:indexPath];
        reusableView.backgroundColor = [UIColor grayColor];
        
        return reusableView;
    }

    return nil;
    
}

#pragma mark -- imagePicker delegat
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {

    imageShopShowCollectionViewCell *cell = (imageShopShowCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:_indexPath];
    cell.imageShopShowCollection.image = info[UIImagePickerControllerEditedImage];
    [self.dataSource[_indexPath.item] setObject:info[UIImagePickerControllerEditedImage] forKey:@"image"];
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - getter

-(UITextField *)wordsTextFlied{
    if (!_wordsTextFlied) {
        _wordsTextFlied = ({
            UITextField * nameField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 230, 80)];
            nameField.center = CGPointMake(self.bounds.size.width / 2, 50);
            nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 0)];
            nameField.leftViewMode = UITextFieldViewModeAlways;
            nameField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"说点什么吧..." attributes:@{NSForegroundColorAttributeName :[UIColor whiteColor]}];
            nameField.clearButtonMode = UITextFieldViewModeWhileEditing;
            nameField.layer.borderWidth = 1.5f;
            nameField.layer.borderColor = [[UIColor grayColor]CGColor];
            nameField;
        });
    }
    return _wordsTextFlied;
}

-(UITextField *)moneyTextFlied{
    if (!_wordsTextFlied) {
        _wordsTextFlied = ({
            UITextField * nameField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
            nameField.center = CGPointMake(self.bounds.size.width / 2, 100);
            nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 0)];
            nameField.leftViewMode = UITextFieldViewModeAlways;
            nameField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"预售价格" attributes:@{NSForegroundColorAttributeName :[UIColor whiteColor]}];
            nameField.clearButtonMode = UITextFieldViewModeWhileEditing;
            nameField.layer.borderWidth = 1.5f;
            nameField.layer.borderColor = [[UIColor grayColor]CGColor];
            nameField;
        });
    }
    return _wordsTextFlied;
}

-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = ({
            
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.minimumLineSpacing = 1;
            layout.minimumInteritemSpacing = 1;
            layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width / 3, [UIScreen mainScreen].bounds.size.width / 3) ;
            layout.headerReferenceSize = CGSizeMake(CGRectGetWidth(self.bounds), 150);
            UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
            collectionView.delegate = self;
            collectionView.dataSource = self;
            
            collectionView.contentInset = UIEdgeInsetsMake(1, -1, 1, -1);
            collectionView.backgroundColor = [UIColor whiteColor];
            
            [collectionView registerNib:[UINib nibWithNibName:@"imageShopShowCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
            
            [collectionView registerClass:[UICollectionReusableView class]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerIdf"];
            
            
            collectionView;
        });
    }
    return _collectionView;
}



@end
















