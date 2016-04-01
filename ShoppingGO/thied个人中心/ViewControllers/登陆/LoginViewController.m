//
//  LoginViewController.m
//  login
//
//  Created by rimi on 16/3/28.
//  Copyright © 2016年 limiao. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
@interface LoginViewController ()<UITextFieldDelegate>

@property(nonatomic,strong)UITextField * name;

@property(nonatomic,strong)UITextField * password;

@property(nonatomic,strong)UIButton * LoginButton;

@property(nonatomic,strong)UIButton * registerButton;

@property(nonatomic,strong)UIImageView * imageView;
//毛玻璃
@property(nonatomic,strong)UIVisualEffectView *effectView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    self.navigationController.navigationBarHidden=YES;
    
    
    [self.view addSubview:self.imageView];
    
    [self.view addSubview:self.effectView];
    
    [self.view addSubview:self.name];
    
    [self.view addSubview:self.password];
    
    [self.view addSubview:self.LoginButton];
    
    [self.view addSubview:self.registerButton];
    

}
#pragma mark--action
-(void)action_loginbutton{
    
    //登陆
    
    //登陆成功，，传值并推送
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
    
    
}
-(void)action_registerbutton{
    
    //注册
    
    RegisterViewController * registerVC=[[RegisterViewController alloc]init];
    
    [self.navigationController pushViewController:registerVC animated:YES];
    
    
    
}
#pragma mark--delegate
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    
    [textField resignFirstResponder];
    return YES;
    
}


#pragma mark--getter
-(UITextField *)name{
    if (!_name) {
        _name = ({
            UITextField * name=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
            
            name.textColor=[UIColor whiteColor];
            
            name.placeholder=@"请输入用户名";
            
            name.font=[UIFont systemFontOfSize:18];
            
            name.layer.cornerRadius=10;
            
            name.layer.borderColor=[UIColor orangeColor].CGColor;
            
            name.layer.borderWidth=2;
            
            name.delegate=self;
            
            name.borderStyle=UITextBorderStyleNone;
            
            name.center=CGPointMake(self.view.center.x, self.view.bounds.size.height* 0.6);
            
             name.clearButtonMode=UITextFieldViewModeAlways;
            
    
            
            name;
        });
    }
    
    
    
    
    return _name;
}
-(UITextField *)password{
    if (!_password) {
        
        _password=({
            
            UITextField * password=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
            
            password.textColor=[UIColor whiteColor];
            
            password.placeholder=@"请输入密码";
            
            password.font=[UIFont systemFontOfSize:18];
            
            password.layer.cornerRadius=10;
            
            password.delegate=self;
            
            password.layer.borderColor=[UIColor orangeColor].CGColor;
            
            password.layer.borderWidth=2;
            
            password.borderStyle=UITextBorderStyleNone;
            
            password.center=CGPointMake(self.view.center.x, self.view.bounds.size.height* 0.68);
            
            password.secureTextEntry=YES;
            
            password.clearButtonMode=UITextFieldViewModeAlways;
            
            
            password;
            
        });
        
        
    }
    return _password;
}
-(UIButton *)LoginButton{
    if (!_LoginButton) {
        _LoginButton=({
            UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
            
            button.frame=CGRectMake(0, 0, 100, 40);
            
            button.center=CGPointMake(self.view.center.x-60, self.view.center.y+210);
            
            button.layer.cornerRadius=10;
            
            button.layer.borderColor=[UIColor colorWithRed:0.502 green:0.000 blue:0.502 alpha:1.000].CGColor;
            
            button.layer.borderWidth=2;
            
            [button setTitle:@"登陆" forState:UIControlStateNormal];
            
            [button setTitleColor:[UIColor colorWithWhite:0.600 alpha:1.000] forState:UIControlStateNormal];
            
            [button addTarget:self action:@selector(action_loginbutton) forControlEvents:UIControlEventTouchUpInside];
            
            
            
            button;
            
            
        });
    }
    
    
    
    
    return _LoginButton;
}
-(UIButton *)registerButton{
    if (!_registerButton) {
        _registerButton=({
            
            UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
            
            button.frame=CGRectMake(0, 0, 100, 40);
            
            button.center=CGPointMake(self.view.center.x+60, self.view.center.y+210);
            
            button.layer.cornerRadius=10;
            
            button.layer.borderColor=[UIColor colorWithRed:0.502 green:0.000 blue:0.502 alpha:1.000].CGColor;
            
            button.layer.borderWidth=2;
            
            [button setTitle:@"注册" forState:UIControlStateNormal];
            
            [button setTitleColor:[UIColor colorWithWhite:0.600 alpha:1.000] forState:UIControlStateNormal];
            
            [button addTarget:self action:@selector(action_registerbutton) forControlEvents:UIControlEventTouchUpInside];
            
            
            
            button;
            
            
        });
    }
    
    
    
    return _registerButton;
}
-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView=({
            UIImageView * image=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"mike2.jpeg"]];
            
            image.frame=self.view.frame;
            
            image.center=self.view.center;
            
            image.contentMode = UIViewContentModeScaleAspectFill;
            
            image;
        });
    }
    
    
    
    return _imageView;
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
//            effectView.backgroundColor=[UIColor colorWithWhite:0.902 alpha:1.000];
            
            effectView.frame = self.view.bounds;
            //设置模糊透明度
            effectView.alpha =0.5;
            
            effectView;
            
        });
    }
    
    
    return _effectView;
}

@end
