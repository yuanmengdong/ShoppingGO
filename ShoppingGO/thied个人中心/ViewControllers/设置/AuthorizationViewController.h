//
//  LoginViewController.h
//  share
//
//  Created by rimi on 16/3/22.
//  Copyright © 2016年 limiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UMSocial.h"
@interface AuthorizationViewController : UIViewController< UITableViewDataSource,UITableViewDelegate,UIActionSheetDelegate,UMSocialUIDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UISwitch *switcher;
@end
