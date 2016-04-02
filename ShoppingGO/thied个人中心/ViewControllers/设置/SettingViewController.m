//
//  ViewController.m
//  share
//
//  Created by rimi on 16/3/18.
//  Copyright © 2016年 limiao. All rights reserved.
//

#import "SettingViewController.h"
#import "UMSocial.h"
#import "ChangeInforViewController.h"
#import "AboutWeViewController.h"
#import "AuthorizationViewController.h"
@interface SettingViewController ()<UMSocialUIDelegate>

@property(nonatomic,strong)UIButton * shareButton;

@property(nonatomic,strong)UIButton * authorizeButton;

@property(nonatomic,strong)UIButton * infoButton;

@property(nonatomic,strong)UIButton * outLoginButton;

@property(nonatomic,strong)UIButton * aboutButton;

@property(nonatomic,strong)UIButton * back;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor=[UIColor orangeColor];

    [self.view addSubview:self.authorizeButton];
    
    [self.view addSubview:self.shareButton];
    [self.view addSubview: self.infoButton];
    [self.view addSubview:self.outLoginButton];
    [self.view addSubview:self.aboutButton];
    [self.view addSubview:self.back];
    
}
#pragma mark--action
-(void)action_sharebutton{
    
    NSString *shareText = @"友盟社会化组件可以让移动应用快速具备社会化分享、登录、评论、喜欢等功能，并提供实时、全面的社会化数据统计分析服务。 http://www.umeng.com/social";             //分享内嵌文字
    //    UIImage *shareImage = [UIImage imageNamed:@"UMS_social_demo"];          //分享内嵌图片
    UIImage *shareImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"icon" ofType:@"png"]];
    //    [UMSocialSnsService presentSnsIconSheetView:self
    //                                         appKey:@"507fcab25270157b37000010"
    //                                      shareText:shareText
    //                                     shareImage:shareImage
    //                                shareToSnsNames:@[UMShareToSina,UMShareToQQ]
    //                                       delegate:self];
    //调用快速分享接口
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"507fcab25270157b37000010"
                                      shareText:shareText
                                     shareImage:shareImage
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToDouban,nil]
                                       delegate:self];
    [[UMSocialControllerService defaultControllerService] setShareText:shareText shareImage:[UIImage imageNamed:@"icon"] socialUIDelegate:nil];
    
    
    
}

//弹出列表方法presentSnsIconSheetView需要设置delegate为self
-(BOOL)isDirectShareInIconActionSheet
{
    return YES;
}

////实现回调方法（可选）:
//
-(void)didFinishGetUMSocialDataInViewController:(UMSocialResponseEntity *)response
{
    
    
    NSLog(@"didFinishGetUMSocialDataInViewController with response is %@",response);
    //根据`responseCode`得到发送结果,如果分享成功
    if(response.responseCode == UMSResponseCodeSuccess)
    {
        [[UMSocialDataService defaultDataService] requestUnOauthWithType:UMShareToSina  completion:^(UMSocialResponseEntity *response){
            NSLog(@"response is %@",response);
            
        }];
        NSLog(@"share to sns name is %@",[[response.data allKeys] objectAtIndex:0]);
    }
}

-(void)action_authorizebutton{
    
    AuthorizationViewController * login=[[AuthorizationViewController alloc]initWithNibName:@"AuthorizationViewController" bundle:nil];
    
    [self.navigationController pushViewController:login animated:YES];
}
-(void)action_infobutton{
    
    ChangeInforViewController * change=[[ChangeInforViewController alloc]init];
    
    
    [self.navigationController pushViewController:change animated:YES];
    
}
-(void)action_outLoginbutton{
    
    //退出登录
    
    
    
    
}
-(void)action_backButton{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}
-(void)action_aboutWebutton{
    
    AboutWeViewController * about=[[AboutWeViewController alloc]init];
    
    [self.navigationController pushViewController:about animated:YES];
    
    
    
}
#pragma mark--getter
-(UIButton *)shareButton{
    
    if (!_shareButton) {
        
        _shareButton=({
            
            UIButton * shareButton=[UIButton buttonWithType:UIButtonTypeCustom];
            
            shareButton.frame=CGRectMake(0, 0, 300, 40);
            
            shareButton.center=CGPointMake(self.view.center.x, self.view.center.y-100);
            
            shareButton.layer.cornerRadius=20;
            
            shareButton.layer.borderColor=[UIColor cyanColor].CGColor;
            
            shareButton.layer.borderWidth=1;
            
            shareButton.titleLabel.font=[UIFont systemFontOfSize:25];
            
            [shareButton setTitle:@"分享" forState:UIControlStateNormal];
            
            [shareButton setTitleColor:[UIColor colorWithRed:0.000 green:1.000 blue:0.502 alpha:1.000] forState:UIControlStateNormal];
            
            [shareButton addTarget:self action:@selector(action_sharebutton) forControlEvents:UIControlEventTouchUpInside];
            
            
            shareButton;
            
        });
    }
    
    
    
    return _shareButton;
}
-(UIButton *)authorizeButton{
    if (!_authorizeButton) {
        _authorizeButton=({
            
            UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
            button.frame=CGRectMake(0, 0, 300, 40);
            button.center=CGPointMake(self.view.center.x, self.view.center.y);
            button.layer.cornerRadius=20;
            button.layer.borderColor=[UIColor cyanColor].CGColor;
            button.layer.borderWidth=1;
            button.titleLabel.font=[UIFont systemFontOfSize:25];
            [button setTitle:@"授权" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRed:0.000 green:1.000 blue:0.502 alpha:1.000] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(action_authorizebutton) forControlEvents:UIControlEventTouchUpInside];
            
            
            
            button;
        });
    }
    
    
    return _authorizeButton;
}
-(UIButton *)infoButton{
    if (!_infoButton) {
        _infoButton =({
            UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
            button.frame=CGRectMake(0, 0, 300, 40);
            button.center=CGPointMake(self.view.center.x, self.view.center.y-200);
            button.layer.cornerRadius=20;
            button.layer.borderColor=[UIColor cyanColor].CGColor;
            button.layer.borderWidth=1;
            button.titleLabel.font=[UIFont systemFontOfSize:25];
            [button setTitle:@"修改个人信息" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRed:0.000 green:1.000 blue:0.502 alpha:1.000] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(action_infobutton) forControlEvents:UIControlEventTouchUpInside];
            
            
            button;
            
        });
    }
    
    
    
    return _infoButton;
}
-(UIButton *)outLoginButton{
    if (!_outLoginButton) {
        _outLoginButton=({
            
            UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
            button.frame=CGRectMake(0, 0, 300, 40);
            button.center=CGPointMake(self.view.center.x, self.view.center.y+200);
            button.layer.cornerRadius=20;
            button.layer.borderColor=[UIColor cyanColor].CGColor;
            button.layer.borderWidth=1;
            button.titleLabel.font=[UIFont systemFontOfSize:25];
            [button setTitle:@"退出登录" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRed:0.000 green:1.000 blue:0.502 alpha:1.000] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(action_outLoginbutton) forControlEvents:UIControlEventTouchUpInside];
            
            
            button;
            
            
        });
    }
    
    return _outLoginButton;
}
-(UIButton *)aboutButton{
    if (!_aboutButton) {
        _aboutButton=({
            
            
            UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
            button.frame=CGRectMake(0, 0, 300, 40);
            button.center=CGPointMake(self.view.center.x, self.view.center.y+100);
            button.layer.cornerRadius=20;
            button.layer.borderColor=[UIColor cyanColor].CGColor;
            button.layer.borderWidth=1;
            button.titleLabel.font=[UIFont systemFontOfSize:25];
            [button setTitle:@"关于我们" forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRed:0.000 green:1.000 blue:0.502 alpha:1.000] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(action_aboutWebutton) forControlEvents:UIControlEventTouchUpInside];
            
            
            button;
            
            
            
            
        });
    }
    
    
    
    return _aboutButton;
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
