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

@property (nonatomic, retain)UIImageView * imageView;

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
    [self addSubview:self.imageView];

    
    
}

#pragma mark - button

-(void)action_screenButton{
    self.hidden = YES;
}



#pragma mark - getter

-(UIImageView *)imageView{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"QQ图片20160331182859.png"]];
        _imageView.bounds = CGRectMake(0, 0, 140, 98);
        _imageView.center = CGPointMake(self.bounds.size.width - 73, 115);
    }
    return _imageView;
}



- (UIButton *)screenButton{
    if (!_screenButton) {
        _screenButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _screenButton.bounds = self.bounds;
        _screenButton.center = self.center;
        [_screenButton setTitle:nil forState:UIControlStateNormal];
        [_screenButton addTarget:self action:@selector(action_screenButton) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _screenButton;
}

@end
