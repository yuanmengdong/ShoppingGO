//
//  AboutWeViewController.m
//  share
//
//  Created by rimi on 16/3/29.
//  Copyright © 2016年 limiao. All rights reserved.
//

#import "AboutWeViewController.h"

@interface AboutWeViewController ()
@property(nonatomic,strong)UIButton * back;
@end

@implementation AboutWeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeUserInterface];
}
#pragma mark--private
-(void)initializeUserInterface{
    
    [self.view addSubview:self.back];
    
    
}
#pragma mark--action
-(void)action_backButton{
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
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
            [button addTarget:self action:@selector(action_backButton) forControlEvents:UIControlEventTouchUpInside];
            
            
            button;
            
        });
    }
    
    
    return _back;
}

@end
