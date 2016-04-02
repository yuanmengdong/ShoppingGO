//
//  LoginViewController.m
//  share
//
//  Created by rimi on 16/3/22.
//  Copyright © 2016年 limiao. All rights reserved.
//

#import "AuthorizationViewController.h"

@interface AuthorizationViewController ()
@property(nonatomic,strong)NSString * cellstr;
@property(nonatomic,strong)NSString* name;
@end

@implementation AuthorizationViewController
// UMSocialLoginViewController *loginViewController = [[UMSocialLoginViewController alloc] initWithNibName:@"UMSocialLoginViewController" bundle:nil];用这种方式创建，，如果用xib
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initializeUserInterface];
    
}
#pragma mark--private
-(void)initializeUserInterface{
    
    self.view.backgroundColor=[UIColor cyanColor];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
    UIButton *  button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, 100, 40);
    button.center=CGPointMake(60, 60);
    button.layer.cornerRadius=20;
    button.layer.borderColor=[UIColor colorWithWhite:0.298 alpha:1.000].CGColor;
    button.layer.borderWidth=2;
    button.titleLabel.font=[UIFont systemFontOfSize:20];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0.502 green:0.000 blue:0.502 alpha:1.000] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(action_button) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    self.cellstr=@"已授权";
    
    
}
#pragma  mark--action
-(void)action_button{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
    
}
#pragma mark--deleagte
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    int snsNum = 0;
    if ([[UMSocialSnsPlatformManager sharedInstance].allSnsPlatformDictionary valueForKey:UMShareToSina]) {
        snsNum ++;
    }
    if ([[UMSocialSnsPlatformManager sharedInstance].allSnsPlatformDictionary valueForKey:UMShareToDouban]) {
        snsNum ++;
    }
    if ([[UMSocialSnsPlatformManager sharedInstance].allSnsPlatformDictionary valueForKey:UMShareToRenren]) {
        snsNum ++;
    }
    if ([[UMSocialSnsPlatformManager sharedInstance].allSnsPlatformDictionary valueForKey:UMShareToTencent]) {
        snsNum ++;
    }
    return snsNum;
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *UMSnsAccountCellIdentifier = @"UMSnsAccountCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UMSnsAccountCellIdentifier];
    
    NSDictionary *snsAccountDic = [UMSocialAccountManager socialAccountDictionary];
    UMSocialSnsPlatform *snsPlatform = nil;
    if (indexPath.row == 1) {
        snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
        self.name=UMShareToSina;
    }
    else if (indexPath.row == 2) {
        snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToDouban];
      
    }
    else if(indexPath.row == 3){
        snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToRenren];
   
    }
    else if(indexPath.row == 4){
        snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToTencent];
        
    }
    else {
        snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:[UMSocialSnsPlatformManager getSnsPlatformStringFromIndex:indexPath.row]];
    }
    
    UMSocialAccountEntity *accountEnitity = [snsAccountDic valueForKey:snsPlatform.platformName];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:UMSnsAccountCellIdentifier] ;
    }
    
    UISwitch *oauthSwitch = nil;
    
    if ([cell viewWithTag:snsPlatform.shareToType]) {
        
        oauthSwitch = (UISwitch *)[cell viewWithTag:snsPlatform.shareToType];
    }
    else{
        
        oauthSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(0, 10, 40, 20)];
        
        oauthSwitch.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;
        
        oauthSwitch.tag = snsPlatform.shareToType;
        
        [cell addSubview:oauthSwitch];
    }
    
    oauthSwitch.center = CGPointMake(_tableView.bounds.size.width - 40, oauthSwitch.center.y);
    
    [oauthSwitch addTarget:self action:@selector(onSwitchOauth:) forControlEvents:UIControlEventValueChanged];
    
    NSString *showUserName = nil;
    
    //这里判断是否授权
    if ([UMSocialAccountManager isOauthAndTokenNotExpired:snsPlatform.platformName]) {
        
        [oauthSwitch setOn:YES];
        //这里获取到每个授权账户的昵称
        showUserName = accountEnitity.userName;
    }
    else {
        [oauthSwitch setOn:NO animated:YES];
        showUserName = [NSString stringWithFormat:@"尚未授权"];
    }
    
    if ([showUserName isEqualToString:@""]) {
        cell.textLabel.text = self.cellstr;
    }
    else{
        cell.textLabel.text = showUserName;
    }
    
    cell.imageView.image = [UIImage imageNamed:snsPlatform.smallImageName];
    return cell;
}
-(void)onSwitchOauth:(UISwitch *)switcher{
    self.switcher=switcher;
    if (switcher.isOn == YES) {
        [switcher setOn:NO];
        
//        此处调用授权的方法,你可以把下面的platformName 替换成 UMShareToSina,UMShareToTencent等
//    NSString *platformName = [UMSocialSnsPlatformManager getSnsPlatformString:UMSocialSnsTypeSina ];
//        
//        [UMSocialControllerService defaultControllerService].socialUIDelegate = self;
//        
//        UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:platformName];
//        
//        snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response){
//            
//            //获取微博用户名、uid、token、第三方的原始用户信息thirdPlatformUserProfile等
//            
//            if (response.responseCode == UMSResponseCodeSuccess) {
//                
//                UMSocialAccountEntity *snsAccount = [[UMSocialAccountManager socialAccountDictionary] valueForKey:platformName];
//                
//                NSLog(@"\nusername = %@,\n usid = %@,\n token = %@ iconUrl = %@,\n unionId = %@,\n thirdPlatformUserProfile = %@,\n thirdPlatformResponse = %@ \n",snsAccount.userName,snsAccount.usid,snsAccount.accessToken,snsAccount.iconURL, snsAccount.unionId, response.thirdPlatformUserProfile, response.thirdPlatformResponse);
//                
//            }
//            //这里可以获取到腾讯微博openid,Qzone的token等
//            /*
//             if ([platformName isEqualToString:UMShareToTencent]) {
//             [[UMSocialDataService defaultDataService] requestSnsInformation:UMShareToTencent completion:^(UMSocialResponseEntity *respose){
//             NSLog(@"get openid  response is %@",respose);
//             }];
//             }
//             */
//            [self.tableView reloadData];
//        });
        
    }
    else {
        
         NSString *platformName = [UMSocialSnsPlatformManager getSnsPlatformString:(UMSocialSnsType)switcher.tag];
        [[UMSocialDataService defaultDataService] requestUnOauthWithType:platformName completion:^(UMSocialResponseEntity *response){
            NSLog(@"删%@",response);
            self.cellstr=@"尚未授权";
            [self.tableView reloadData];
        }];
     
        
        
    }

    
    
    
    
}
@end
