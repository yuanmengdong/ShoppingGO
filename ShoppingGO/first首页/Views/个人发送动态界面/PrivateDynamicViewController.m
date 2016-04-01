//
//  ViewController.m
//  发送动态个人界面
//
//  Created by rimi on 16/3/30.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "PrivateDynamicViewController.h"

@interface PrivateDynamicViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, retain)UITextField * wordsTextFlied;
@property (nonatomic, retain)UITextField * moodTextFlied;
@property (nonatomic, retain)UISegmentedControl * segmentedControl;
@property (nonatomic, strong)NSArray * celltitles;
@property (nonatomic, retain)NSString * classString;
@property (nonatomic, retain)UIView * blueView;
@property (nonatomic, retain)UIView * bluesView;
@property (nonatomic, retain)UIButton * imageButton;
@property (nonatomic, retain)UIButton * sureSendButton;
@property (nonatomic, strong) UIImageView * imagePicker;
@property (nonatomic, retain)UIButton * okButton;
@property (nonatomic, retain)UIView * lineView;

@end

@implementation PrivateDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initialiDataSource];
    [self initialiUserInterFace];
    
    UIBarButtonItem * item1 = [[UIBarButtonItem alloc] initWithTitle:@"<返回"  style:UIBarButtonItemStylePlain target:self action:@selector(buttonPressed:)];
    self.navigationItem.leftBarButtonItem = item1;
}

-(void)initialiDataSource{
    
}

-(void)initialiUserInterFace{
    self.celltitles = @[@"开心",@"平静",@"激动",@"紧张",@"伤心",@"怀念",@"惆怅",@"恋爱"];
    
    [self.view addSubview:self.blueView];
    [self.view addSubview:self.bluesView];
    [self.blueView addSubview:self.moodTextFlied];
    [self.blueView addSubview:self.segmentedControl];
    
    [self.bluesView addSubview:self.wordsTextFlied];
    [self.view addSubview:self.imagePicker];
    [self.view addSubview:self.imageButton];
    [self.view addSubview:self.okButton];
    [self.view addSubview:self.lineView];
    
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



#pragma mark - button

-(void)action_OKButtonPressed{
    
    
}

-(void)buttonPressed:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)buttonPressedRound:(UIButton *)sender{

    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"是否打开相册" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction * photoAction = [UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //打开相册
        [self takePhoto];
    }];
    UIAlertAction * cancelAction = [ UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:photoAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil ];
}

-(void)takePhoto{
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    //数据源
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    //允许编辑
    picker.allowsEditing = YES;
    picker.delegate = self;
    [self presentViewController:picker animated:YES completion:nil];
    
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSLog(@"%@", info);
    self.imagePicker.image = info[UIImagePickerControllerEditedImage];
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self.view reloadInputViews];
    
}

#pragma mark - getter

-(UIButton *)okButton{
    if (!_okButton) {
        _okButton = ({
            UIButton * buttonRound = [UIButton buttonWithType:UIButtonTypeCustom];
            buttonRound.bounds = CGRectMake(0, 0, 68, 38);
            buttonRound.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height /3 * 2 + 50);
            [buttonRound setImage:[UIImage imageNamed:@"ok"] forState:UIControlStateNormal];

            [buttonRound addTarget:self action:@selector(action_OKButtonPressed) forControlEvents:UIControlEventTouchUpInside];
            buttonRound;
        });
    }
    return _okButton;
}

-(UIButton *)imageButton{
    if (!_imageButton) {
        _imageButton = ({
            UIButton * buttonRound = [UIButton buttonWithType:UIButtonTypeCustom];
            buttonRound.bounds = CGRectMake(0, 0, 60, 60);
            buttonRound.center = CGPointMake(350, self.view.bounds.size.height / 2 - 75);
            [buttonRound setImage:nil forState:UIControlStateNormal];

            [buttonRound addTarget:self action:@selector(buttonPressedRound:) forControlEvents:UIControlEventTouchUpInside];
            buttonRound;
        });
    }
    return _imageButton;
}

-(UIImageView *)imagePicker{
    if (!_imagePicker) {
        _imagePicker = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"add"]];
        _imagePicker.bounds = CGRectMake(0, 0, 60, 60);
        _imagePicker.center = self.imageButton.center;
        _imagePicker.contentMode = UIViewContentModeScaleAspectFill;
        _imagePicker.clipsToBounds = YES;
    }
    return _imagePicker;
}

-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - 100, 1)];
        _lineView.center = CGPointMake(self.view.bounds.size.width / 2, self.view.bounds.size.height / 2 + 60);
        _lineView.backgroundColor = [UIColor whiteColor];
    }
    return _lineView;
}

-(UIView *)blueView{
    if (!_blueView) {
        _blueView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 100)];
        _blueView.center = CGPointMake(self.view.bounds.size.width / 2, 170);
        _blueView.backgroundColor = [UIColor blueColor];
    }
    return _blueView;
}

-(UIView *)bluesView{
    if (!_bluesView) {
        _bluesView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150)];
        _bluesView.center = self.view.center;
        _bluesView.backgroundColor = [UIColor blueColor];
    }
    return _bluesView;
}

-(UITextField *)moodTextFlied{
    if (!_moodTextFlied) {
        _moodTextFlied = ({
            UITextField * nameField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
            nameField.center = CGPointMake(self.view.bounds.size.width / 2, 30);
            nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 0)];
            nameField.font = [UIFont systemFontOfSize:18];
            nameField.textColor = [UIColor whiteColor];
            nameField.leftViewMode = UITextFieldViewModeAlways;
            nameField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"标题" attributes:@{NSForegroundColorAttributeName :[UIColor whiteColor]}];
            nameField.clearButtonMode = UITextFieldViewModeNever;
            nameField.textAlignment = NSTextAlignmentCenter;
            nameField.layer.borderWidth = 0.5f;
            nameField.layer.borderColor = [[UIColor blueColor]CGColor];
            nameField;
        });
    }
    return _moodTextFlied;
}

-(UITextField *)wordsTextFlied{
    if (!_wordsTextFlied) {
        _wordsTextFlied = ({
            UITextField * nameField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 80)];
            nameField.center = CGPointMake(self.view.bounds.size.width / 2, 70);
            nameField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 0)];
            nameField.textColor = [UIColor whiteColor];
            nameField.leftViewMode = UITextFieldViewModeAlways;
            nameField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"说点什么吧..." attributes:@{NSForegroundColorAttributeName :[UIColor whiteColor]}];
            nameField.clearButtonMode = UITextFieldViewModeNever;
            nameField.textAlignment = NSTextAlignmentCenter;
            nameField.layer.borderWidth = 0.5f;
            nameField.layer.borderColor = [[UIColor blueColor]CGColor];
            nameField;
        });
    }
    return _wordsTextFlied;
}

-(UISegmentedControl *)segmentedControl{
    if (!_segmentedControl) {
        _segmentedControl = ({
            UISegmentedControl * segmentedControl = [[UISegmentedControl alloc] initWithItems:self.celltitles];
            segmentedControl.tintColor = [UIColor whiteColor];
            segmentedControl.backgroundColor = [UIColor blueColor];
            segmentedControl.bounds = CGRectMake(0, 0, 360, 30);
            segmentedControl.center = CGPointMake(self.view.bounds.size.width / 2, 70);
            [self.view addSubview:segmentedControl];
            [segmentedControl addTarget:self action:@selector(segmentedControlChanged:) forControlEvents:UIControlEventValueChanged];
            segmentedControl;
        });
    }
    return _segmentedControl;
}


@end
