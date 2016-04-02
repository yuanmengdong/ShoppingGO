//
//  PersonalViewController.m
//  ShoppingGO
//
//  Created by rimi on 16/3/28.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "PersonalViewController.h"
#import <AVOSCloud/AVOSCloud.h>

#import "LoginViewController.h"
#import "SettingViewController.h"
#import "animation.h"
#import "Ziliao.h"
#import "newHead.h"

@interface PersonalViewController ()<UITableViewDataSource, UITableViewDelegate, UINavigationBarDelegate, UIPickerViewDelegate>

@property(nonatomic,strong)UITextView * userText;

@property(nonatomic,strong)UITextView * genderText;

@property(nonatomic,strong)UITextView * phoneText;

@property(nonatomic,strong)UIButton * button;


@end

@implementation PersonalViewController

- (void)dealloc
{
    //第三步：移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"change" object:nil];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLabelText:) name:@"change" object:nil];
        
         
        
    }
    return self;
}

-(void)changeLabelText:(NSNotification *)notification{
    self.head.image = notification.userInfo[@"text"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.i = 0;
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.zhanshi.tag = 1;
    self.shoucang.tag = 2;
    
//    Ziliao * ziliao = [[Ziliao alloc] init];
    
    self.iarray = @[self.huanying, self.zhanshi, self.ziliao, self.shoucang];
    
    
    
    UIImageView * backdrop = [[UIImageView alloc] initWithFrame:self.view.bounds];
    backdrop.center = self.view.center;
    backdrop.image = [UIImage imageNamed:@"3.jpg"];
    [self.view addSubview:backdrop];
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.view.bounds), 0, 100, CGRectGetMaxY(self.view.bounds))];
    
    CAGradientLayer * gradientLayer = [[CAGradientLayer alloc] init];
    CGRect newGradientLayerFrame = view.frame;
    gradientLayer.frame = newGradientLayerFrame;
    gradientLayer.colors = [NSArray arrayWithObjects:(id)[[[UIColor blackColor] colorWithAlphaComponent:1]CGColor],
                            (id)[[[UIColor cyanColor] colorWithAlphaComponent:1]CGColor],
                            (id)[[[UIColor whiteColor] colorWithAlphaComponent:1] CGColor],
                            nil];
    
    [view.layer addSublayer:gradientLayer];
    
    UIBlurEffect * blur = [UIBlurEffect effectWithStyle: UIBlurEffectStyleDark];
    UIVisualEffectView * blurView = [[UIVisualEffectView alloc] initWithEffect:blur];
    
    blurView.frame = CGRectMake(0, 0, CGRectGetMaxX(self.view.bounds), CGRectGetMaxY(self.view.bounds));
    blurView.alpha = 1;
    [backdrop addSubview:blurView];
    
    [self.view addSubview:self.card];
    
    
    
    
    
    
    
    UIBezierPath * path = [[UIBezierPath alloc] init];
    CAShapeLayer * shape = [CAShapeLayer layer];
    shape.frame = self.head.frame;
    [path addArcWithCenter:CGPointMake(50, 50) radius:50.0 startAngle:0.0 endAngle:M_PI*2 clockwise:YES];
    
    shape.path = path.CGPath;
    
    //    shape.fillColor = [UIColor clearColor].CGColor;
    //    shape.lineWidth = 10;
    self.head.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:self.head];
    self.head.center = self.view.center;
    [self.head.layer setMask:shape];
    
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 100, 100);
    button.layer.cornerRadius = 50;
    button.center = self.view.center;
    
    [button addTarget:self action:@selector(loginButton) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    self.button=button;
    self.array = [[NSMutableArray alloc] init];
    
    
}
-(void)loginButton{
    LoginViewController * login=[[LoginViewController alloc]init];
    [self.navigationController pushViewController:login animated:YES];
    
    
    
}
- (void)beginButton:(UIButton *)button
{
    [button removeFromSuperview];
    
    
    for (int i = 0; i < 3; i ++) {
        UIButton * view = [UIButton buttonWithType:UIButtonTypeCustom];
        view.frame = CGRectMake(0, 0, 20, 20);
        view.center = self.view.center;
        view.backgroundColor = [UIColor blackColor];
        view.layer.cornerRadius = 10;
        
        
        [self.view addSubview:view];
        [self.array addObject:view];
        view.alpha = 0;
        view.tag = i + 100;
        
        [view addTarget:self action:@selector(hideViewButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self performSelector:@selector(headButton) withObject:nil afterDelay:3];
    
    Animation * animations = [[Animation alloc] init];
    
    CABasicAnimation * zoom1 = [animations zoomFromValue:@1 toValue:@0.2 beginTime:0 duration:0.5 keep:NO];
    CABasicAnimation * zoom2 = [animations zoomFromValue:@0.2 toValue:@1 beginTime:1.75 duration:0.75 keep:NO];
    
    CABasicAnimation * move1 = [animations moveFromValue:self.view.center toValue:CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) - 200) beginTime:0.5 duration:0.5 keep:NO];
    
    CABasicAnimation * move2 = [animations moveFromValue:CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) - 200) toValue:CGPointMake(CGRectGetMidX(self.view.bounds) - 100, CGRectGetMidY(self.view.bounds) - 200) beginTime:1 duration:0.75 keep:NO];
    
    
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:zoom1, zoom2, move1, move2, nil];
    group.duration = 3;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    [self.head.layer addAnimation:group forKey:nil];
    
    [self buttons];
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationDelay:1];
    
    self.view1.alpha = 1;
    self.head.alpha = 1;
    [UIView commitAnimations];
}

- (void)headButton
{
    UIButton * headButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //    headButton.backgroundColor = [UIColor redColor];
    headButton.center = CGPointMake(CGRectGetMidX(self.view.bounds) - 100, CGRectGetMidY(self.view.bounds) - 200);
    headButton.bounds = self.head.bounds;
    [headButton addTarget:self action:@selector(newHeadButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:headButton];
}

- (void)newHeadButton:(UIButton *)button
{
    Animation * animations = [[Animation alloc] init];
    CABasicAnimation * zoom1 = [animations zoomFromValue:@1 toValue:@0 beginTime:0 duration:1 keep:YES];
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:zoom1, nil];
    group.duration = 1;
    group.removedOnCompletion = YES;
    group.fillMode = kCAFillModeForwards;
    [self.head.layer.mask addAnimation:group forKey:nil];
    
    //    [UIView beginAnimations:nil context:nil];
    //    [UIView setAnimationDelay:1];
    //    [UIView setAnimationDuration:0.5];
    //    self.view.alpha = 0;
    
    newHead * head = [[newHead alloc]init];
    //    [self presentViewController:head  animated:YES completion:nil];
    //
    //    UINavigationController * root = [UINavigationController alloc];
    [self.navigationController pushViewController:head animated:YES];
    self.navigationController.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)buttons
{
    [UIView beginAnimations:nil context:nil];
    [UIView    setAnimationCurve: UIViewAnimationCurveLinear];
    [UIView    setAnimationDelegate:self];
    [UIView setAnimationDelay:0.5];
    [UIView setAnimationDuration:0.5];
    for (int i = 0; i < 3; i ++) {
        self.array[i].center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds) - 200);
        self.array[i].alpha = 1;
    }
    [UIView setAnimationDelay:1];
    [UIView setAnimationDuration:0.5];
    
    for (int i = 0; i < 3; i ++) {
        self.array[i].center = CGPointMake(CGRectGetMidX(self.view.bounds) + 100, CGRectGetMidY(self.view.bounds) - 200);
        
    }
    [UIView setAnimationDelay:1.5];
    [UIView setAnimationDuration:0.75];
    for (int i = 0; i < 3; i ++) {
        self.array[i].center = CGPointMake(CGRectGetMidX(self.view.bounds) + 100, CGRectGetMidY(self.view.bounds) - 240 + i * 40);
    }
    
    [UIView setAnimationDelay:2.25];
    [UIView setAnimationDuration:0.75];
    for (int i = 0; i < 3; i ++)
    {
        self.array[i].frame = CGRectMake(0, 0, 160, 20);
        
        self.array[i].center = CGPointMake(CGRectGetMidX(self.view.bounds) + 70 , CGRectGetMidY(self.view.bounds) - 240 + i * 40);
        
        if (i == 1)
        {
            self.array[i].center = CGPointMake(CGRectGetMidX(self.view.bounds) + 80, CGRectGetMidY(self.view.bounds) - 240 + i * 40);
            
            //            array[i].layer
        }
    }
    UIButton * tagButton = [UIButton alloc];
    tagButton.tag = 104;
    [self performSelector:@selector(showViewButton:) withObject:tagButton afterDelay:1.0f];
    [UIView commitAnimations];
    
}

- (void)hideViewButton:(UIButton *)button
{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    
    self.iarray[self.i].alpha = 0;
    [UIView commitAnimations];
    
    [self performSelector:@selector(showViewButton:) withObject:button afterDelay:1.0f];
    
}

- (void)showViewButton:(UIButton *)button
{
    
    [self.iarray[self.i] removeFromSuperview];
    
    if (button.tag == 101)
    {
        _i = 1;
    } else if (button.tag == 102)
    {
        _i = 3;
    } else if (button.tag == 100)
    {
        _i = 2;
    }
    self.iarray[self.i].alpha = 0;
    [self.card addSubview:self.iarray[self.i]];
    
    NSMutableArray <UIButton *>* array = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i ++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 60, 60);
        button.center = CGPointMake(CGRectGetMidX(self.view.bounds) - self.view.bounds.size.width / 5 * i  + self.view.bounds.size.width / 5 , CGRectGetMaxY(self.view.bounds) - 160);
        //        button.center = self.view.center;
        button.layer.cornerRadius = 30;
        button.tag = 400 + i;
        button.backgroundColor = [UIColor redColor];
        [self.view addSubview:button];
        button.alpha = 0;
        [array addObject:button];
        [button addTarget:self action:@selector(button1:) forControlEvents:UIControlEventTouchUpInside];
    }
    [UIView beginAnimations:nil context:nil];
    
    [UIView setAnimationDuration:1];
    for (int i = 0; i < 3; i ++) {
        array[i].alpha = 1;
    }
    
    self.iarray[self.i].alpha = 1;
    
    
    [UIView commitAnimations];
    
}

- (void)button1:(UIButton *)button
{
    if (button.tag == 400) {
        SettingViewController * setting=[[SettingViewController alloc]init];
        [self.navigationController pushViewController:setting animated:YES];
    }
    if (button.tag == 401) {
        
    }
    if (button.tag == 402) {
        
    }
}

- (UIImageView *)card
{
    if (!_card) {
        _card = [[UIImageView alloc] initWithFrame:CGRectMake(25, 40, self.view.bounds.size.width - 50, self.view.bounds.size.height - 140)];
        _card.image = [UIImage imageNamed:@"7"];
        _card.alpha = 1;
    }
    return _card;
}


- (UIView *)zhanshi
{
    if (!_zhanshi) {
        _zhanshi = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.card.bounds.size.width - 40, self.card.bounds.size.height - 220)];
        _zhanshi.center = CGPointMake(CGRectGetMidX(self.card.bounds), CGRectGetMidY(self.card.bounds) + 90);
        _zhanshi.backgroundColor = [UIColor redColor];
        
        
    }
    
    return _zhanshi;
}

- (UIView *)shoucang
{
    if (!_shoucang) {
        _shoucang = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.card.bounds.size.width - 40, self.card.bounds.size.height - 220)];
        _shoucang.center = CGPointMake(CGRectGetMidX(self.card.bounds), CGRectGetMidY(self.card.bounds) + 90);
        UITableView * tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.card.bounds.size.width - 40, self.card.bounds.size.height - 220) style:UITableViewStylePlain];
        
        tableView.allowsSelectionDuringEditing = YES;
        tableView.rowHeight = 60;
        tableView.delegate = self;
        
        
        [_shoucang addSubview:tableView];
        
    }
    return _shoucang;
}
- (UIView *)huanying
{
    if (!_huanying) {
        _huanying = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.card.bounds.size.width - 40, self.card.bounds.size.height - 220)];
        _huanying.center = CGPointMake(CGRectGetMidX(self.card.bounds), CGRectGetMidY(self.card.bounds) + 90);
    
        
        
    }
    
    return _huanying;
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.textLabel.text = @"没有。。。";
    
    return cell;
}

- (UIImageView *)head
{
    if (!_head) {
        _head = [[UIImageView alloc] init];
        _head.frame = CGRectMake(0, 0, 100, 100);
        
        
        _head.image = [UIImage imageNamed:@"u=4226644394,354881513&fm=21&gp=0.jpg"];
    }
    return _head;
}

- (void)viewWillAppear:(BOOL)animated

{
    
    UITextView * texthuanying = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, self.card.bounds.size.width - 40, self.card.bounds.size.height - 220)];
    texthuanying.textAlignment = NSTextAlignmentCenter;
    
    texthuanying.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:20];
    
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.card.bounds.size.width - 40, self.card.bounds.size.height - 220)];
    //        view.center = CGPointMake(CGRectGetMidX(self.card.bounds), CGRectGetMidY(self.card.bounds) + 90);
    UITextView * text = [[UITextView alloc] init];
    text.bounds = CGRectMake(0, 0, 200, 300);
    text.center = view.center;
    AVQuery * query=[AVQuery queryWithClassName:@"_User"];
    
    NSString * Id=[[NSUserDefaults standardUserDefaults]objectForKey:@"id"];
    
    
    [query getObjectInBackgroundWithId:Id block:^(AVObject *object, NSError *error) {
        texthuanying.text = [NSString stringWithFormat:@"%@%@",@"\n\n\n\n\n欢迎回来，",object[@"nickname"]];
        //        text.backgroundColor = [UIColor redColor];
        [_huanying addSubview:texthuanying];
        

        text.text = object[@"signature"];
    }];
    
    text.font = [UIFont fontWithName:@"STHeitiSC-Medium" size:16];
    text.textAlignment = NSTextAlignmentCenter;
    text.bounds = CGRectMake(0, 0, 200, text.contentSize.height);
    text.backgroundColor = [UIColor clearColor];
    view.backgroundColor = [UIColor redColor];
    [view addSubview:text];
    [_zhanshi addSubview:view];

    
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
                
                text.text = object[@"nickname"];
                
            }else if (text.tag==301){
                text.text =   object[@"gender"];
                
            }else if (text.tag==302){
                
                text.text =  object[@"phone"];
            }
            
            
            
            
            
        }];
        
        
        
        
        [_ziliao addSubview:text];
    }
    

    
//
     if ([self.view subviews].count < 6) {
    UIView * view = [[UIView alloc] init];
    [self.view addSubview:view];
    }
    if ([self.view subviews].count == 6) {
        
        [self performSelector:@selector(beginButton:) withObject:self.button afterDelay:1.0f];
        
    }
    if ([self.view subviews].count >= 6) {
        self.view.alpha = 0;
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:1];
        self.view.alpha = 1;
        [UIView commitAnimations];
    }
}

- (UIView *)ziliao
{
    if ( !_ziliao)
    {
        
        _ziliao = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - 50 - 40, self.view.bounds.size.height - 140 - 220)];
        _ziliao.center = CGPointMake(CGRectGetMidX(self.view.bounds) - 25, (self.view.bounds.size.height - 140) / 2  + 90);
        _ziliao.tag=100;
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
       
    }
    return _ziliao;
}

@end
