//
//  titleSectionView.m
//  首页测试1
//
//  Created by rimi on 16/3/22.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "titleSectionView.h"

@interface titleSectionView () <UIScrollViewDelegate>

@property (nonatomic, retain)UIScrollView * scrollView;
@property (nonatomic, retain)UIButton * sectionButtonLeft;
@property (nonatomic, retain)UIButton * sectionButtonCenter;
@property (nonatomic, retain)UIButton * sectionButtonRight;

@end

@implementation titleSectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialiUserInterface];
    }
    return self;
}

-(void)initialiUserInterface{
    
    [self addSubview:self.scrollView];
    [self.scrollView addSubview:self.sectionButtonLeft];
    [self.scrollView addSubview:self.sectionButtonCenter];
    [self.scrollView addSubview:self.sectionButtonRight];
    
}

- (void)action_sectionButtonLeft {
    self.sectionButtonLeft.selected = YES;
    self.sectionButtonRight.selected = NO;
    self.sectionButtonCenter.selected = NO;
}

- (void)action_sectionButtonCenter {
    self.sectionButtonLeft.selected = NO;
    self.sectionButtonRight.selected = NO;
    self.sectionButtonCenter.selected = YES;
}

- (void)action_sectionButtonRight {
    self.sectionButtonLeft.selected = NO;
    self.sectionButtonRight.selected = YES;
    self.sectionButtonCenter.selected = NO;
}


#pragma mark - getter

-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 30)];
        _scrollView.center = self.center;
        _scrollView.backgroundColor = [UIColor whiteColor];
        _scrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds) , CGRectGetHeight(self.bounds));
        _scrollView.bounces = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
    }
    return _scrollView;
}

-(UIButton *)sectionButtonLeft{
    if (!_sectionButtonLeft) {
        _sectionButtonLeft = [UIButton buttonWithType:UIButtonTypeCustom];
        _sectionButtonLeft.bounds = CGRectMake(0, 0, self.bounds.size.width / 3, self.bounds.size.height);
        _sectionButtonLeft.center = CGPointMake(self.bounds.size.width / 3 / 2, self.bounds.size.height /2);
        _sectionButtonLeft.selected = YES;
        [_sectionButtonLeft setImage:[UIImage imageNamed:@"titlebutton_11"] forState:UIControlStateNormal];
        [_sectionButtonLeft setImage:[UIImage imageNamed:@"titlebutton_12"] forState:UIControlStateSelected];
        [_sectionButtonLeft addTarget:self action:@selector(action_sectionButtonLeft) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sectionButtonLeft;
}


-(UIButton *)sectionButtonCenter{
    if (!_sectionButtonCenter) {
        _sectionButtonCenter = [UIButton buttonWithType:UIButtonTypeCustom];
        _sectionButtonCenter.bounds = CGRectMake(0, 0, self.bounds.size.width / 3, self.bounds.size.height);
        _sectionButtonCenter.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
        [_sectionButtonCenter setImage:[UIImage imageNamed:@"titlebutton_31"] forState:UIControlStateNormal];
        [_sectionButtonCenter setImage:[UIImage imageNamed:@"titlebutton_32"] forState:UIControlStateSelected];
        [_sectionButtonCenter addTarget:self action:@selector(action_sectionButtonCenter) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sectionButtonCenter;
}

-(UIButton *)sectionButtonRight{

    if (!_sectionButtonRight) {
        _sectionButtonRight = [UIButton buttonWithType:UIButtonTypeCustom];
        _sectionButtonRight.bounds = CGRectMake(0, 0, self.bounds.size.width / 3, self.bounds.size.height);
        _sectionButtonRight.center = CGPointMake(self.bounds.size.width / 3 / 2 * 5, self.bounds.size.height / 2);
        [_sectionButtonRight setImage:[UIImage imageNamed:@"titlebutton_21"] forState:UIControlStateNormal];
        [_sectionButtonRight setImage:[UIImage imageNamed:@"titlebutton_22"] forState:UIControlStateSelected];
        [_sectionButtonRight addTarget:self action:@selector(action_sectionButtonRight) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sectionButtonRight;
    
}


@end
