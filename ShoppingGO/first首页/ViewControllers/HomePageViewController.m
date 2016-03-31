//
//  HomePageViewController.m
//  ShoppingGO
//
//  Created by rimi on 16/3/28.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "HomePageViewController.h"
#import "titleSectionView.h"
#import "TOPTableView.h"
#import "ShowOneselfTableView.h"
#import "VShopTableView.h"


@interface HomePageViewController () <UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain)UIScrollView * scrollView;
@property (nonatomic, retain)titleSectionView * sectionView;
@property (nonatomic, retain)TOPTableView * topTableView;
@property (nonatomic, retain)ShowOneselfTableView * oneselfTableView;
@property (nonatomic, retain)VShopTableView * vShopTableView;
@property (nonatomic, retain)UIView * navigationBarView;
@property (nonatomic, retain)UIButton * addButton;



@end

@implementation HomePageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initialiDataSource];
    [self initialiUserInterFace];
    
   
}

-(void)initialiDataSource{
    
}

-(void)initialiUserInterFace{
    
    
    
    [self.view addSubview:self.scrollView];
    
    [self.view addSubview:self.sectionView];
    [self.scrollView addSubview:self.topTableView];
    [self.scrollView addSubview:self.vShopTableView];
    [self.scrollView addSubview:self.oneselfTableView];
    [self.view addSubview:self.navigationBarView];
}



#pragma mark - getter

-(UIView *)navigationBarView{
    if (!_navigationBarView) {
        _navigationBarView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64)];
        _navigationBarView.backgroundColor = [UIColor blueColor];
    }
    return _navigationBarView;
}

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = ({
            UIScrollView * scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
            scrollView.center = self.view.center;
            scrollView.backgroundColor = [UIColor colorWithRed:235 / 255.0 green:235 / 255.0 blue:235 / 255.0 alpha:0.9];
            scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.bounds) * 3, CGRectGetHeight(self.view.bounds));
            scrollView.pagingEnabled = YES;
            scrollView.bounces = NO;
            scrollView.showsHorizontalScrollIndicator = NO;
            scrollView.delegate = self;
            [self.view addSubview:scrollView];
            
            self.automaticallyAdjustsScrollViewInsets = NO;
            scrollView;
        });
    }
    return _scrollView;
}

-(titleSectionView *)sectionView{
    if (!_sectionView) {
        _sectionView = [[titleSectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 30)];
        _sectionView.center = CGPointMake(self.view.bounds.size.width / 2, 79);
        _sectionView.backgroundColor = [UIColor whiteColor];
    }
    return _sectionView;
}

-(TOPTableView *)topTableView{
    if (!_topTableView) {
        _topTableView = [[TOPTableView alloc] initWithFrame:self.view.bounds];
//        _topTableView.bounds =
        _topTableView.center = self.view.center;
        _topTableView.backgroundColor = [UIColor whiteColor];
    }
    return _topTableView;
}

-(ShowOneselfTableView *)oneselfTableView{
    if (!_oneselfTableView) {
        _oneselfTableView = [[ShowOneselfTableView alloc] initWithFrame:self.view.bounds];
        //        _topTableView.bounds =
        _oneselfTableView.center = CGPointMake(self.scrollView.bounds.size.width * 2.5, self.scrollView.bounds.size.height / 2);
        _oneselfTableView.backgroundColor = [UIColor whiteColor];
    }
    return _oneselfTableView;
}

-(VShopTableView *)vShopTableView{
    if (!_vShopTableView) {
        _vShopTableView = [[VShopTableView alloc] initWithFrame:self.view.bounds];
        //        _topTableView.bounds =
        _vShopTableView.center = CGPointMake(self.scrollView.bounds.size.width * 1.5, self.scrollView.bounds.size.height / 2);
        _vShopTableView.backgroundColor = [UIColor whiteColor];
    }
    return _vShopTableView;
}



@end









