//
//  RegisterViewController.m
//  login
//
//  Created by rimi on 16/3/28.
//  Copyright © 2016年 limiao. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)UITextField * userPhone;

@property(nonatomic,strong)UITextField * verifynumber;

@property(nonatomic,strong)UIButton * verifyButton;

@property(nonatomic,strong)UIButton * registerButton;

@property(nonatomic,strong)UIImageView * imageView;

//毛玻璃
@property(nonatomic,strong)UIVisualEffectView *effectView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor colorWithWhite:0.800 alpha:1.000];
    self.navigationController.navigationBarHidden=YES;
    
    
    [self.view addSubview:self.imageView];
    
    [self.view addSubview:self.effectView];
    
    [self.view addSubview:self.userPhone];
    
    [self.view addSubview:self.verifynumber];
    

    
    [self.view addSubview:self.registerButton];
    
}
#pragma mark--action
-(void)action_verifybutton{
    
   
    
    
    
    
    
}
-(void)action_backLogin{
    
   
    
    
    
    
    
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
-(UITextField *)verifynumber{
    if (!_verifynumber) {
        
        _verifynumber=({
            
            UITextField * verify=[[UITextField alloc]initWithFrame:CGRectMake(0, 0, 300, 40)];
            
//            verify.textColor=[UIColor whiteColor];
            
            verify.placeholder=@"请输入验证码";
            
            verify.font=[UIFont systemFontOfSize:18];
            
            verify.layer.cornerRadius=10;
            
            verify.delegate=self;
            
            verify.layer.borderColor=[UIColor colorWithWhite:0.400 alpha:1.000].CGColor;
            
            verify.layer.borderWidth=1.5;
            
            verify.borderStyle=UITextBorderStyleNone;
            
            verify.center=CGPointMake(self.view.center.x, self.view.bounds.size.height* 0.68);
            
            verify.clearButtonMode=UITextFieldViewModeAlways;
            
            verify;
            
        });
        
        
    }
    return _verifynumber;
}
-(UIButton *)verifyButton{
    if (!_verifyButton) {
        _verifyButton=({
            UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
            
            button.frame=CGRectMake(0, 0, 200, 40);
            
            button.center=CGPointMake(self.view.center.x-45, self.view.bounds.size.height* 0.615);
            
            button.layer.cornerRadius=10;
            
//            button.layer.borderColor=[UIColor colorWithRed:0.502 green:0.000 blue:0.502 alpha:1.000].CGColor;
//            
//            button.layer.borderWidth=2;
            
            [button setTitle:@"获取验证码" forState:UIControlStateNormal];
            
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            
            button.backgroundColor=[UIColor orangeColor];
            
            [button addTarget:self action:@selector(action_verifybutton) forControlEvents:UIControlEventTouchUpInside];
            
            
            
            button;
            
            
        });
    }
    
    
    
    
    return _verifyButton;
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
            
            [button addTarget:self action:@selector(action_backLogin) forControlEvents:UIControlEventTouchUpInside];
            
            
            
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

@end
