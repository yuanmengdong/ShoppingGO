//
//  ShopShowViewController.m
//  发送动态界面
//
//  Created by rimi on 16/3/29.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "ShopShowViewController.h"

#import "imageShopShowCollectionViewCell.h"

@interface ShopShowViewController () <UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

{
    NSIndexPath *_indexPath;
}

@property (nonatomic, retain)UITextField * wordsTextFlied;
@property (nonatomic, strong) NSMutableArray * dataSource;
@property (nonatomic, retain)UICollectionView * collectionView;
@property (nonatomic, strong)NSMutableArray * uploadPhotos;
@property (nonatomic, strong)NSArray * celltitles;
@property (nonatomic, retain)UISegmentedControl * segmentedControl;
@property (nonatomic, retain)NSString * classString;

@end

@implementation ShopShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataSource = [NSMutableArray array];
    self.uploadPhotos = [NSMutableArray array];
    
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc] initWithTitle:@"<返回"  style:UIBarButtonItemStylePlain target:self action:@selector(buttonPressed:)];
    self.navigationItem.leftBarButtonItem = item1;
    
    [self initialiDataSource];
    [self initialiUserInterFace];
}

-(void)initialiDataSource{
    
    
    
    for (int i = 0; i < 1; i ++) {
        NSString *str = @"1";
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:str forKey:@"number"];
        
        [self.dataSource addObject:dic];
    }
    
    
}


-(void)initialiUserInterFace{
    
    self.celltitles = @[@"服装",@"鞋子",@"靓包",@"美妆",@"电子",@"饰品",@"家居",@"养生"];
    [self.view addSubview:self.collectionView];
    [self.view addSubview:self.wordsTextFlied];
    [self.view addSubview:self.segmentedControl];

    
}

#pragma mark - button

-(void)buttonPressed:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

#pragma mark - UISegmentedControl
-(void)segmentedControlChanged:(UISegmentedControl *)sender{
    switch (sender.selectedSegmentIndex) {
        case 0:
            _classString = self.celltitles[0];
            break;
        case 1:
            _classString = self.celltitles[1];
            break;
        case 2:
            _classString = self.celltitles[2];
            break;
        case 3:
            _classString = self.celltitles[3];
            break;
        case 4:
            _classString = self.celltitles[4];
            break;
        case 5:
            _classString = self.celltitles[5];
            break;
        case 6:
            _classString = self.celltitles[6];
            break;
        case 7:
            _classString = self.celltitles[7];
            break;
            
        default:
            break;
    }
            
    
}


- (void)takePhoto {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    //数据源
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    picker.allowsEditing = YES;
    picker.delegate = self;
        [self presentViewController:picker animated:YES completion:nil];
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
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark -- collectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    imageShopShowCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"add"]];
//    cell.backgroundColor = [UIColor redColor];
    cell.imageShopShowCollection.image = self.dataSource[indexPath.item][@"image"];
    return cell;
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
//        UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerIdf" forIndexPath:indexPath];
//        reusableView.backgroundColor = [UIColor blueColor];
//        
//        return reusableView;
//    }
//    
//    return nil;
//    
//}

#pragma mark -- imagePicker delegat
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    imageShopShowCollectionViewCell *cell = (imageShopShowCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:_indexPath];
    cell.imageShopShowCollection.image = info[UIImagePickerControllerEditedImage];
    [self.dataSource[_indexPath.item] setObject:info[UIImagePickerControllerEditedImage] forKey:@"image"];
    [self.uploadPhotos addObject:info[UIImagePickerControllerEditedImage]];
    [picker dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"%lu", (unsigned long)self.uploadPhotos.count);
    if (self.uploadPhotos.count < 9) {
        [self initialiDataSource];
        [self.collectionView reloadData];
    }
    
    
}

#pragma mark - getter

-(UITextField *)wordsTextFlied{
    if (!_wordsTextFlied) {
        _wordsTextFlied = ({
            UITextField * nameField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
            nameField.center = CGPointMake(self.view.bounds.size.width / 2, 104);
            nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 0)];
            nameField.leftViewMode = UITextFieldViewModeAlways;
            nameField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"说点什么吧..." attributes:@{NSForegroundColorAttributeName :[UIColor grayColor]}];
            nameField.clearButtonMode = UITextFieldViewModeWhileEditing;
            nameField.textAlignment = NSTextAlignmentCenter;
            nameField.layer.borderWidth = 0.5f;
            nameField.layer.borderColor = [[UIColor whiteColor]CGColor];
            nameField;
        });
    }
    return _wordsTextFlied;
}

-(UISegmentedControl *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = ({
            UISegmentedControl * segmentedControl = [[UISegmentedControl alloc] initWithItems:self.celltitles];
            segmentedControl.tintColor = [UIColor redColor];
            segmentedControl.backgroundColor = [UIColor whiteColor];
            segmentedControl.bounds = CGRectMake(0, 0, 360, 30);
            segmentedControl.center = CGPointMake(self.view.bounds.size.width / 2, 200);
            [self.view addSubview:segmentedControl];
            [segmentedControl addTarget:self action:@selector(segmentedControlChanged:) forControlEvents:UIControlEventValueChanged];
            segmentedControl;
        });
    }
    return _segmentedControl;
}


-(UICollectionView *)collectionView{
    if (!_collectionView) {
        _collectionView = ({
            
            UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
            layout.minimumLineSpacing = 1;
            layout.minimumInteritemSpacing = 1;
            layout.itemSize = CGSizeMake(100, 100);
            layout.headerReferenceSize = CGSizeMake(CGRectGetWidth(self.view.bounds), 0);
            UICollectionView * collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 302, 302) collectionViewLayout:layout];
            collectionView.center = self.view.center;
            collectionView.delegate = self;
            collectionView.dataSource = self;
            
            collectionView.contentInset = UIEdgeInsetsMake(1, 0, 1, 0);
            collectionView.backgroundColor = [UIColor whiteColor];
            
            [collectionView registerNib:[UINib nibWithNibName:@"imageShopShowCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"cell"];
            
            [collectionView registerClass:[UICollectionReusableView class]forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerIdf"];
            
            
            collectionView;
        });
    }
    return _collectionView;
}

@end
