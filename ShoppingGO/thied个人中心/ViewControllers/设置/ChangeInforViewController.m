//
//  ChangeInforViewController.m
//  share
//
//  Created by rimi on 16/3/29.
//  Copyright © 2016年 limiao. All rights reserved.
//

#import "ChangeInforViewController.h"
#import <AVOSCloud/AVOSCloud.h>

@interface ChangeInforViewController ()<UITextFieldDelegate,UITextViewDelegate>

@property(nonatomic,strong)UILabel * username;
@property(nonatomic,strong)UILabel * gender;
@property(nonatomic,strong)UILabel * phonenumber;
@property(nonatomic,strong)UILabel * signature;

@property(nonatomic,strong)UITextField * usernametext;
@property(nonatomic,strong)UITextField * gendertext;
@property(nonatomic,strong)UITextField * phonetext;
@property(nonatomic,strong)UITextView * signtext;

@property(nonatomic,strong)UIButton * back;
@property(nonatomic,strong)UIButton * finishButton;


@property(nonatomic,strong)UIImageView * imageView;

@end

@implementation ChangeInforViewController
#pragma mark--life cycle
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    AVQuery * query=[AVQuery queryWithClassName:@"_User"];
    
    NSString * Id=[[NSUserDefaults standardUserDefaults]objectForKey:@"id"];
    
    
    [query getObjectInBackgroundWithId:Id block:^(AVObject *object, NSError *error) {
  
            
        self.usernametext.text=object[@"nickname"];
        
        self.gendertext.text=object[@"gender"];
        
        self.phonetext.text=object[@"phone"];
        
        self.signtext.text=object[@"signature"];
    }];
    
 }
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeUserInterface];
    
    
    
    
    
}
#pragma mark--private
-(void)initializeUserInterface{
    self.view.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:self.imageView];
    
    [self settingLabel];
    

    [self settingTextField];
    
    
    [self.view addSubview:self.username];
    [self.view addSubview:self.gender];
    [self.view addSubview:self.phonenumber];
    [self.view addSubview:self.signature];
    
    [self.view addSubview:self.usernametext];
    [self.view addSubview:self.gendertext];
    [self.view addSubview:self.phonetext];
    
    
    [self.view addSubview:self.signtext];
    
    
    [self.view addSubview:self.back];
    [self.view addSubview:self.finishButton];
}
-(void)settingLabel{
    
        self.username=[self allLabelWithCenter:CGPointMake(self.view.bounds.size.width*0.17, self.view.bounds.size.height*0.22) text:@"昵称:"];
    
        self.gender=[self allLabelWithCenter:CGPointMake(_username.center.x,CGRectGetMaxY(_username.frame) +(_username.bounds.size.width/2+30)) text:@"性别:"];
    
        self.phonenumber=[self allLabelWithCenter:CGPointMake(_gender.center.x,CGRectGetMaxY(_gender.frame) +(_gender.bounds.size.width/2+30)) text:@"联系方式:"];
    
        self.signature=[self allLabelWithCenter:CGPointMake(_phonenumber.center.x,CGRectGetMaxY(_phonenumber.frame) +(_phonenumber.bounds.size.width/2+30)) text:@"个性签名:"];
    
    
    
}
-(void)settingTextField{
    
    self.usernametext=[self alltextFieldWithCenter:CGPointMake(self.view.bounds.size.width*0.6, self.view.bounds.size.height*0.22) placeholder:@"请输入您的新昵称"];
    
    self.gendertext=[self alltextFieldWithCenter:CGPointMake(_usernametext.center.x,CGRectGetMaxY(_username.frame) +(_username.bounds.size.width/2+30)) placeholder:@"请输入您的性别"];
    
    self.phonetext=[self alltextFieldWithCenter:CGPointMake(_gendertext.center.x,CGRectGetMaxY(_gender.frame) +(_gender.bounds.size.width/2+30)) placeholder:@"请输入您的联系方式"];
    
    
    
}
-(UILabel * )allLabelWithCenter:(CGPoint)center text:(NSString *)text{
    
    UILabel * label=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 90, 40)];
    label.font=[UIFont systemFontOfSize:20];
    label.textColor=[UIColor colorWithWhite:0.298 alpha:1.000];
    label.textAlignment=NSTextAlignmentCenter;
    label.text=text;
    label.center=center;
    
    
    return label;
    
}
-(UITextField * )alltextFieldWithCenter:(CGPoint)center placeholder:(NSString *)text{
    
    
    UITextField * textfield=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, 250, 40)];
    

    
    textfield.placeholder=text;
    
    textfield.font=[UIFont systemFontOfSize:20];
    
    textfield.layer.cornerRadius=10;
    
    textfield.layer.borderColor=[UIColor cyanColor].CGColor;
    
    textfield.layer.borderWidth=1;
    
    textfield.delegate=self;
    
    textfield.borderStyle=UITextBorderStyleNone;
    
    textfield.center=center;
    
    textfield.clearButtonMode=UITextFieldViewModeAlways;
    
    
    
    return textfield;
    
    
    
}
-(void)dismissAlert{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)alert:(NSString * )str{
    
    
    UIAlertController * alert=[UIAlertController  alertControllerWithTitle:@"温馨提示" message:str preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * action=[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        
    }];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
}
#pragma mark--override
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
    if (textView.text.length<80) {
        return YES;
    }else{
        return NO;
        
    }
    
}


#pragma mark--delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    [textField resignFirstResponder];
    return YES;
    
}

#pragma  mark--action
-(void)action_button{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}

-(void)action_finishButton{
    

    AVUser * user = [AVUser currentUser];
    [user setObject:self.usernametext.text forKey:@"nickname"];
    
    [user setObject:self.gendertext.text forKey:@"gender"];
    
    [user setObject:self.phonetext.text forKey:@"phone"];
    
    [user setObject:self.signtext.text forKey:@"signature"];
    
    [user saveInBackground];
    
    [user saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            
            UIAlertController * alert=[UIAlertController  alertControllerWithTitle:@"温馨提示" message: @"保存成功！"preferredStyle:UIAlertControllerStyleAlert];
            
            [self presentViewController:alert animated:YES completion:nil];
            
            [self performSelector:@selector(dismissAlert) withObject:nil afterDelay:1];
            
         
        }
        else{
            [self alert:@"保存失败！请重新输入！"];
        }
    }];


   
    
    
}

#pragma mark--getter

-(UIButton * )back{
    if (!_back) {
        _back=({
            
            UIButton *  button=[UIButton buttonWithType:UIButtonTypeCustom];
            button.frame=CGRectMake(0, 0, 200, 60);
            button.center=CGPointMake(self.view.bounds.size.width*0.2, self.view.bounds.size.height*0.1);
        
            
            button.titleLabel.font=[UIFont fontWithName:@"TrebuchetMS" size:25];
            
            [button setTitle:@"b⃣ a⃣ c⃣ k⃣" forState:UIControlStateNormal];
            
            [button setTitleColor:[UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(action_button) forControlEvents:UIControlEventTouchUpInside];
            
            
            button;
            
        });
    }
    
    
    return _back;
}
-(UIButton *)finishButton{
    
    if (!_finishButton) {
        _finishButton=({
            UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
            
            button.frame=CGRectMake(0, 0, 250, 60);
            
            button.center=CGPointMake(self.view.bounds.size.width*0.5, self.view.bounds.size.height*0.87);

            
            [button setTitle:@"♡Finished☆" forState:UIControlStateNormal];
            
            button.titleLabel.font=[UIFont fontWithName:@"TrebuchetMS" size:25];
            
            [button setTitleColor:[UIColor colorWithRed:1.000 green:0.502 blue:0.000 alpha:1.000] forState:UIControlStateNormal];
            
            [button addTarget:self action:@selector(action_finishButton) forControlEvents:UIControlEventTouchUpInside];
            
            
            
            button;
  
            
            
        });
    }
    
    return _finishButton;
}
-(UITextView *)signtext{
    if (!_signtext) {
        _signtext=({
            UITextView * textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, 250, 150)];
            textview.center=CGPointMake(self.view.bounds.size.width*0.6, self.view.bounds.size.height*0.69);
            
            textview.font=[UIFont systemFontOfSize:20];
            
            textview.delegate=self;
            
            textview.backgroundColor=[UIColor clearColor];
            
            textview.layer.cornerRadius=10;
 
            textview.layer.borderColor=[UIColor cyanColor].CGColor;
            
            textview.layer.borderWidth=1;
            
            textview;
        });
    }
    
    
    return _signtext;
}
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView=({
            UIImageView * image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mike.jpeg"]];
            image.frame=self.view.frame;
            image.center=self.view.center;
            image.contentMode =UIViewContentModeScaleAspectFill;
            //  创建需要的毛玻璃特效类型
            UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
            
            //  毛玻璃view 视图
            UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
            
            //添加到要有毛玻璃特效的控件中
            //            effectView.backgroundColor=[UIColor colorWithWhite:0.458 alpha:1.000];
            //
            effectView.frame = self.view.bounds;
            //设置模糊透明度
            effectView.alpha =0.5;
            
            [image addSubview:effectView];
            
            image;
        });
    }
    
   
    return _imageView;
}
@end
