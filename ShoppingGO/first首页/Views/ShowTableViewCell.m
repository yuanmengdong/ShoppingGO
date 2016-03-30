//
//  ShowTableViewCell.m
//  ShoppingGO
//
//  Created by rimi on 16/3/28.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "ShowTableViewCell.h"

#define COLOR_RGB colorWithRed:0.751 green:0.613 blue:0.280 alpha:1.000

@implementation ShowTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initialiUserInterface];
    }
    return self;
}

-(void)initialiUserInterface{
    
    
    [self.contentView addSubview:self.userImage];
    
    
    [self.view addSubview:self.numberGood];
    
    [self addSubview:self.headImage];
    [self addSubview:self.name];
    [self addSubview:self.timeLabel];
    
    [self addSubview:self.introduction];
    
    [self addSubview:self.view];
    [self.view addSubview:self.moodName];
    [self.view addSubview:self.mood];
    [self.view addSubview:self.oneView];
    [self.view addSubview:self.goodImage];
    [self.view addSubview:self.numberGood];
    
    
}

- (void)layoutSubviews {
    
    self.userImage.frame = CGRectMake(0, 0, 170, 250);
    self.userImage.center = CGPointMake(280, 200);
    
    
    
    self.headImage.frame = CGRectMake(0, 0, 50, 50);
    self.headImage.center = CGPointMake(40, 40);
    self.name.frame = CGRectMake(0, 0, 150, 40);
    self.name.center = CGPointMake(150, 35);
    self.timeLabel.frame = CGRectMake(0, 0, 100, 30);
    self.timeLabel.center = CGPointMake(130, 55);
    
    self.introduction.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame)- 30, 40);
    self.introduction.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, CGRectGetHeight(self.bounds) - 40);
    
    self.view.frame = CGRectMake(0, 0, 140, 170);
    self.view.center = CGPointMake(150, 200);
    self.moodName.frame = CGRectMake(0, 0, 120, 30);
    self.moodName.center = CGPointMake(70, 40);
    self.mood.frame = CGRectMake(0, 0, 100, 30);
    self.mood.center = CGPointMake(70, 80);
    self.oneView.frame = CGRectMake(0, 0, 25, 2);
    self.oneView.center = CGPointMake(70, 110);
    self.goodImage.frame = CGRectMake(0, 0, 20, 20);
    self.goodImage.center = CGPointMake(50, 140);
    self.numberGood.frame = CGRectMake(0, 0, 50, 30);
    self.numberGood.center = CGPointMake(90, 140);
}


#pragma mark - getter



-(UIImageView *)userImage{
    if (!_userImage) {
        _userImage = [[UIImageView alloc] init];
        _userImage.contentMode = UIViewContentModeScaleAspectFill;
        _userImage.clipsToBounds = YES;
    }
    return _userImage;
}

-(UIImageView *)headImage{
    if (!_headImage) {
        _headImage = [[UIImageView alloc] init];
        _headImage.contentMode = UIViewContentModeScaleAspectFill;
        _headImage.layer.cornerRadius = 25;
        _headImage.clipsToBounds = YES;
        
    }
    return _headImage;
}

-(UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.text = @"第三空间ah";
        _name.textColor = [UIColor COLOR_RGB];
    }
    return _name;
}

-(UILabel *)introduction{
    if (!_introduction) {
        _introduction = [[UILabel alloc] init];
        _introduction.font = [UIFont fontWithName:@"OpenType TrueType" size:15];
        //        _introduction.backgroundColor = [UIColor whiteColor];
        _introduction.textAlignment = NSTextAlignmentCenter;
    }
    return _introduction;
}

-(UIImageView *)goodImage{
    if (!_goodImage) {
        _goodImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iconfont-xin"]];
        
    }
    return _goodImage;
}

-(UILabel *)numberGood{
    if (!_numberGood) {
        _numberGood = [[UILabel alloc] init];
        _numberGood.textColor = [UIColor colorWithRed:0.611 green:0.685 blue:0.734 alpha:1.000];
        _numberGood.font = [UIFont systemFontOfSize:14];
    }
    return _numberGood;
}

-(UILabel *)mood{
    if (!_mood) {
        _mood = [[UILabel alloc] init];
        _mood.text = @"开心";
        _mood.textColor = [UIColor COLOR_RGB];
        _mood.textAlignment = NSTextAlignmentCenter;
        _mood.font = [UIFont systemFontOfSize:17];
    }
    return _mood;
}

-(UILabel *)moodName{
    if (!_moodName) {
        _moodName = [[UILabel alloc] init];
        _moodName.text = @"我的旅行card";
        _moodName.textColor = [UIColor COLOR_RGB];
        _moodName.textAlignment = NSTextAlignmentCenter;
        _moodName.font = [UIFont systemFontOfSize:17];
    }
    return _moodName;
}

-(UIView *)oneView{
    if (!_oneView) {
        _oneView = [[UIView alloc] init];
        _oneView.layer.cornerRadius = 1;
        _oneView.clipsToBounds = YES;
        _oneView.backgroundColor = [UIColor COLOR_RGB];
    }
    return _oneView;
}

-(UIView *)view{
    if (!_view) {
        _view = [[UIView alloc] init];
        _view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.6];
        _view.layer.borderWidth = 1;
        _view.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
    return _view;
}

-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.text = @"今天11:50";
        _timeLabel.font = [UIFont systemFontOfSize:10];
        _timeLabel.textColor = [UIColor blackColor];
    }
    return _timeLabel;
}






- (void)awakeFromNib {
    // Initialization code
}



@end










