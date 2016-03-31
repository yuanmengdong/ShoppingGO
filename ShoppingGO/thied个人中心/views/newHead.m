//
//  newHead.m
//  ceshi
//
//  Created by rimi on 16/3/29.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "newHead.h"
#import "ViewController.h"

@interface newHead () <UIPickerViewDelegate>

@property (nonatomic, retain) UIAlertController * alert;



@end

@implementation newHead



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
//    _imageView.center = self.view.center;
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - 100, CGRectGetMidX(self.view.bounds) + 50, 200, 200)];
//    _imageView.image = [UIImage imageNamed:@"u=4226644394,354881513&fm=21&gp=0.jpg"];
    _imageView.backgroundColor = [UIColor grayColor];
    _imageView.layer.cornerRadius = 100;
    _imageView.layer.masksToBounds = YES;
    
    [self.view addSubview:self.imageView];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(CGRectGetMidX(self.view.bounds) - 50, CGRectGetMidY(self.view.bounds) + 200 - 20, 100, 40);
//    button.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) + 200);
    button.backgroundColor = [UIColor orangeColor];
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    [button setTitle:@"获取图片" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];

    UIButton * button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(0, 0, 100, 40);
    button1.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) + 300);
    button1.backgroundColor = [UIColor orangeColor];
    button1.layer.cornerRadius = 5;
    button1.layer.masksToBounds = YES;
    [button1 setTitle:@"保存" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button1.titleLabel setFont:[UIFont boldSystemFontOfSize:15]];
    [button1 addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
}
- (void)pop
{
//    UIViewController *origin = self.presentingViewController;
    
    NSDictionary * dictionary = @{@"text": _imageView.image};
    [[NSNotificationCenter defaultCenter] postNotificationName:@"change" object:nil userInfo:dictionary];
    [self.navigationController popToViewController:self.navigationController.viewControllers[1] animated:NO];
    
    
//    ViewController * view1 = [[ViewController alloc]init];
//    
//    view1.head.image = self.imageView.image;

}
- (void)btnClick:(UIButton *)sender
{
    
    
    [self presentViewController:self.alert animated:YES completion:nil];
    
    
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSUInteger sourceType = 0;
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        switch (buttonIndex) {
            case 1:
                sourceType = UIImagePickerControllerSourceTypeCamera;
                break;
            case 2:
                sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                break;
        }
    } else {
        if (buttonIndex == 1) {
            sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        }
    }
    UIImagePickerController * imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.sourceType = sourceType;
    [self presentViewController:imagePickerController animated:YES completion:nil];
    
    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:^{}];
    _imageView.image = info[UIImagePickerControllerEditedImage];
    
//    NSURL *imageURL = [info valueForKey:UIImagePickerControllerReferenceURL];

    self.url = info[UIImagePickerControllerReferenceURL];
    
    self.dic = info;
    
    [self.view reloadInputViews];
    
}

- (UIAlertController *)alert
{
    if (!_alert) {
        _alert = [UIAlertController alertControllerWithTitle:@"获取图片" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIAlertAction * defaultAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
                imagePicker.delegate = self;
                imagePicker.allowsEditing = YES;
                imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
                [self presentViewController:imagePicker animated:YES completion:^{}];
            }];
            [_alert addAction:defaultAction];
        }
        
        UIAlertAction * defaultAction1 = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            UIImagePickerController * imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = YES;
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:imagePicker animated:YES completion:^{
            }];
        }];
        
        UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        }];
        
        [_alert addAction:cancelAction];
        
        [_alert addAction:defaultAction1];

    }
    
    return _alert;
}

- (UIImageView *)imageView
{
    if (_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.view.bounds) - 100, CGRectGetMidX(self.view.bounds) + 50, 200, 200)];
        _imageView.image = [UIImage imageNamed:@"u=4226644394,354881513&fm=21&gp=0.jpg"];
        _imageView.center = self.view.center;
        _imageView.backgroundColor = [UIColor grayColor];
        _imageView.layer.cornerRadius = 100;
        _imageView.layer.masksToBounds = YES;
    }
    return _imageView;
}
- (NSURL *)url
{
    if (!_url) {
        _url = [[NSURL alloc] init];
    }
    return _url;
}

- (NSDictionary<NSString *,id> *)dic
{
    if (!_dic) {
        _dic = [[NSDictionary alloc] init];
        
    }
    return _dic;
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
