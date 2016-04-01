//
//  addDynamicView.m
//  ShoppingGO
//
//  Created by rimi on 16/3/31.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "addDynamicView.h"

@interface addDynamicView ()

@property (nonatomic, retain)UIButton * screenButton;
@property (nonatomic, retain)UIButton * personalButton;
@property (nonatomic, retain)UIButton * shoppingButton;

@end

@implementation addDynamicView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialiUserInterface];
    }
    return self;
}

-(void)initialiUserInterface{
    
    [self addSubview:self.screenButton];
    [self addSubview:self.personalButton];
    [self addSubview:self.shoppingButton];
    
    
}

#pragma mark - button

-(void)action_screenButton{
    self.hidden = YES;
}

-(void)action_personalButton{
    
}

-(void)action_shoppingButton{
    
}

#pragma mark - getter

- (UIButton *)personalButton{
    if (!_personalButton) {
        _personalButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _personalButton.bounds = CGRectMake(0, 0, 140, 30);
        _personalButton.center = CGPointMake(self.bounds.size.width - 5, 85);
        _personalButton.backgroundColor = [UIColor purpleColor];
        [_personalButton setTitle:nil forState:UIControlStateNormal];
        [_personalButton addTarget:self action:@selector(personalButton) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _personalButton;
}

- (UIButton *)shoppingButton{
    if (!_shoppingButton) {
        _shoppingButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _shoppingButton.bounds = CGRectMake(0, 0, 140, 30);
        _shoppingButton.center = CGPointMake(self.bounds.size.width - 5, 115);
        _shoppingButton.backgroundColor = [UIColor orangeColor];
        [_shoppingButton setTitle:nil forState:UIControlStateNormal];
        [_shoppingButton addTarget:self action:@selector(screenButton) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _shoppingButton;
}

- (UIButton *)screenButton{
    if (!_screenButton) {
        _screenButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _screenButton.bounds = self.bounds;
        _screenButton.center = self.center;
        [_screenButton setTitle:nil forState:UIControlStateNormal];
        [_screenButton addTarget:self action:@selector(screenButton) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _screenButton;
}

@end
