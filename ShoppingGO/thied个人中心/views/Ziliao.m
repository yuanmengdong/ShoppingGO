//
//  Ziliao.m
//  ceshi
//
//  Created by rimi on 16/3/29.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "Ziliao.h"

@interface Ziliao ()


@end

@implementation Ziliao

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (UIView *)ziliao
{
    if (!_ziliao)
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
            [_ziliao addSubview:text];
        }
//        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
//        button.frame = CGRectMake(0, 0, 220, 40);
//        button.center = CGPointMake(CGRectGetMidX(_ziliao.bounds), CGRectGetMaxY(_ziliao.bounds) - 70);
//        [button setTitle: @"编     辑" forState: UIControlStateNormal];
//        button.backgroundColor = [UIColor cyanColor];
//        button.layer.cornerRadius = 20;
//        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
//        
//        [self.ziliao addSubview:button];
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
