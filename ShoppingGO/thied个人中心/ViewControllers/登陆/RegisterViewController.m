//
//  RegisterViewController.m
//  login
//
//  Created by rimi on 16/3/28.
//  Copyright © 2016年 limiao. All rights reserved.
//

#import "RegisterViewController.h"
#import <AVOSCloud/AVOSCloud.h>

@interface RegisterViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField * userPhone;

@property(nonatomic,strong)UITextField * passWordnumber;

@property(nonatomic,strong)UIButton * passWordButton;

@property(nonatomic,strong)UIButton * registerButton;

@property(nonatomic,strong)UIImageView * imageView;

@property(nonatomic,strong)UIButton * back;

//毛玻璃
@property(nonatomic,strong)UIVisualEffectView *effectView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeUserInterface];

    
}

#pragma mark--private
-(void)initializeUserInterface{
    
    self.view.backgroundColor=[UIColor colorWithWhite:0.800 alpha:1.000];
    self.navigationController.navigationBarHidden=YES;
    
    
    [self.view addSubview:self.imageView];
    
    [self.view addSubview:self.effectView];
    
    [self.view addSubview:self.userPhone];
    
    [self.view addSubview:self.passWordnumber];
    
    [self.view addSubview:self.back];
    [self.view addSubview:self.registerButton];
    
    
    
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
#pragma mark--action

-(void)action_registerFinish{
    AVObject * User = [AVObject objectWithClassName:@"_User"];
    
    [User setObject:self.userPhone.text forKey:@"username"];
    
    [User setObject:self.passWordnumber.text forKey:@"password"];
    
    [User saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            
            NSDictionary * dictionary = @{@"nameTextField": self.userPhone.text , @"passwordTextField": self.passWordnumber.text};
            [[NSNotificationCenter defaultCenter] postNotificationName:@"changeTextField" object:nil userInfo:dictionary];
            
            UIAlertController * alert=[UIAlertController  alertControllerWithTitle:@"温馨提示" message: @"注册成功！"preferredStyle:UIAlertControllerStyleAlert];
            
            [self presentViewController:alert animated:YES completion:nil];
            
            [self performSelector:@selector(dismissAlert) withObject:nil afterDelay:1];
            

        }
        else{
            [self alert:@"注册失败!！"];
        }
    }];
    
    
    
    
    
}

-(void)action_backButton{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
    
#pragma mark--delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    [textField resignFirstResponder];
    return YES;
    
}


#pragma mark--getter
-(UITextField *)userPhone{
    if (!_userPhone) {
        _userPhone = ({
            UITextField * name=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
            
//            name.textColor=[UIColor whiteColor];
            
            name.placeholder=@"请输入手机号";
            
            name.font=[UIFont systemFontOfSize:18];
            
            name.layer.cornerRadius=10;
            
            name.layer.borderColor=[UIColor colorWithWhite:0.400 alpha:1.000].CGColor;
            
            name.layer.borderWidth=1.5;
            
            name.delegate=self;
            
            name.borderStyle=UITextBorderStyleNone;
            
            name.center=CGPointMake(self.view.center.x, self.view.bounds.size.height* 0.6);
            
            name.clearButtonMode=UITextFieldViewModeAlways;
            
            name;
        });
    }
    
    
    
    
    return _userPhone;
}
-(UITextField *)passWordnumber{
    if (!_passWordnumber) {
        
        _passWordnumber=({
            
            UITextField * passWord=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
            
//            verify.textColor=[UIColor whiteColor];
            
            passWord.placeholder=@"请输入密码";
            
            passWord.font=[UIFont systemFontOfSize:18];
            
            passWord.layer.cornerRadius=10;
            
            passWord.delegate=self;
            
            passWord.layer.borderColor=[UIColor colorWithWhite:0.400 alpha:1.000].CGColor;
            
            passWord.layer.borderWidth=1.5;
            
            passWord.borderStyle=UITextBorderStyleNone;
            
            passWord.center=CGPointMake(self.view.center.x, self.view.bounds.size.height* 0.68);
            
            passWord.clearButtonMode=UITextFieldViewModeAlways;
            
            passWord;
            
        });
        
        
    }
    return _passWordnumber;
}

-(UIButton *)registerButton{
    if (!_registerButton) {
        _registerButton=({
            
            UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
            
            button.frame=CGRectMake(0, 0, 200, 40);
            
            button.center=CGPointMake(self.view.center.x, self.view.center.y+210);
            
            button.layer.cornerRadius=10;
            
            button.layer.borderColor=[UIColor colorWithWhite:0.502 alpha:1.000].CGColor;
            
            button.layer.borderWidth=1;
            button.backgroundColor=[UIColor orangeColor];
            [button setTitle:@"注册" forState:UIControlStateNormal];
            
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            [button addTarget:self action:@selector(action_registerFinish) forControlEvents:UIControlEventTouchUpInside];
            
            
            
            button;
            
            
        });
    }
    
    
    
    return _registerButton;
}
//设置毛玻璃
-(UIVisualEffectView *)effectView{
    if (!_effectView) {
        _effectView=({
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
            
            effectView;
            
        });
    }
    
    
    return _effectView;
}
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView=({
            UIImageView * image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mike2.jpeg"]];
            image.frame=self.view.frame;
            image.center=self.view.center;
            image.contentMode =UIViewContentModeScaleAspectFill;
            image;
        });
    }
    
    
    
    return _imageView;
}
-(UIButton * )back{
    if (!_back) {
        _back=({
            
            UIButton *  button=[UIButton buttonWithType:UIButtonTypeCustom];
            button.frame=CGRectMake(0, 0, 200, 60);
            button.center=CGPointMake(self.view.bounds.size.width*0.2, self.view.bounds.size.height*0.1);
            
            
            button.titleLabel.font=[UIFont fontWithName:@"TrebuchetMS" size:25];
            
            [button setTitle:@"b⃣ a⃣ c⃣ k⃣" forState:UIControlStateNormal];
            
            [button setTitleColor:[UIColor colorWithRed:0.000 green:0.502 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(action_backButton) forControlEvents:UIControlEventTouchUpInside];
            
            
            button;
            
        });
    }
    
    
    return _back;
}
@end
