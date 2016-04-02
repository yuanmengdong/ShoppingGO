//
//  Ziliao.m
//  ceshi
//
//  Created by rimi on 16/3/29.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "Ziliao.h"
#import <AVOSCloud/AVOSCloud.h>
@interface Ziliao ()

@property(nonatomic,strong)UITextView * currenttextView;

@end

@implementation Ziliao
#pragma mark--life cycle
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    

    

    
    
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIView *)ziliao
{
    if (_ziliao)
    {
        
        _ziliao = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - 50 - 40, self.view.bounds.size.height - 140 - 220)];
        _ziliao.center = CGPointMake(CGRectGetMidX(self.view.bounds) - 25, (self.view.bounds.size.height - 140) / 2  + 90);
        
        _ziliao.backgroundColor = [UIColor clearColor];
        
        NSArray * array = @[@"昵称:", @"性别:", @"电话:", @"城市:", @"企鹅:", @"生日:"];
        
        for (int i = 0; i < 6; i ++) {
            UITextView * text = [[UITextView alloc] initWithFrame:CGRectMake(10, 90 + i / 2 * 70, 50, 40)];
            if (i % 2 == 1) {
                text.frame = CGRectMake(10 + _ziliao.bounds.size.width / 2, 90 + i / 2 * 70, 90, 40);
            }
            text.text = array[i];
            text.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:16];
            text.tag = 200 + i;
            [_ziliao addSubview:text];
        }
        for (int i = 0; i < 6; i ++) {
            UITextView * text = [[UITextView alloc] initWithFrame:CGRectMake(50, 90 + i / 2 * 70, 110, 40)];
            if (i % 2 == 1) {
                text.frame = CGRectMake(50 + _ziliao.bounds.size.width / 2, 90 + i / 2 * 70, 110, 40);
            }
            text.text = @"12345678901";
            text.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:16];
            text.tag = 300 + i;
            AVQuery * query=[AVQuery queryWithClassName:@"_User"];
            
            NSString * Id=[[NSUserDefaults standardUserDefaults]objectForKey:@"id"];
            
            
            [query getObjectInBackgroundWithId:Id block:^(AVObject *object, NSError *error) {
                if (text.tag==300) {
                    
                    text.text=object[@"nickname"];
                    
                }else if (text.tag==301){
                    
                    text.text=object[@"gender"];
                    
                }else if (text.tag==302){
                    
                    
                   text.text=object[@"phone"];
                    
                }
                
            }];
            [_ziliao addSubview:text];
        }

    }
    return _ziliao;
}

- (void)button
{
    
    NSLog(@"sadfdsafas");
    for (int i = 0; i < 6; i ++) {
        UITextField * text = [[UITextField alloc] initWithFrame:CGRectMake(50, 90 + i / 2 * 70, 110, 40)];
        if (i % 2 == 1) {
            text.frame = CGRectMake(50 + _ziliao.bounds.size.width / 2, 90 + i / 2 * 70, 110, 40);
        }
        
        UITextView * text1 = (UITextView *)[self.view viewWithTag:300 + i];
        text.text = @"99999";
        text.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:16];
        text.tag = 310 + i;
        [text1 removeFromSuperview];
        [self.ziliao addSubview:text];
        
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
