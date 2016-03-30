//
//  TableViewCell.m
//  首页测试1
//
//  Created by rimi on 16/3/18.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell ()

@property (nonatomic, strong) UIView *shadowView;
@property (nonatomic, strong) UIImageView * goodImage;

@end

@implementation TableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initialiUserInterface];
    }
    return self;
}

-(void)initialiUserInterface{
    
    
    
    
    
    
    [self.contentView addSubview:self.shadowView];
    
    [self.contentView addSubview:self.userImage];
//    _userImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 50, 180)];
//    _userImage.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, 90);
//    _userImage.contentMode = UIViewContentModeScaleAspectFill;
//    _userImage.clipsToBounds = YES;
//    [self addSubview:_userImage];
//    self.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
//
    [self addSubview:self.name];
//
//    UIView * view = [[UIView alloc] init];
//    view.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
//    view.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, _userImage.bounds.size.height + 25);
//    view.backgroundColor = [UIColor whiteColor];
//    [self.shadowView addSubview:view];
//    
    
    [self addSubview:self.headImage];
    
    [self.shadowView addSubview:self.introduction];
    [self addSubview:self.goodImage];
    

}

- (void)layoutSubviews {
    self.shadowView.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame) - 20, CGRectGetHeight(self.contentView.frame) - 11);
    self.shadowView.center = self.contentView.center;
    
    self.userImage.frame = CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame) - 19, CGRectGetHeight(self.shadowView.frame) - 70);
    self.userImage.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, self.contentView.frame.size.height / 2 - 35 );
    
    self.headImage.frame = CGRectMake(0, 0, 70, 70);
    self.headImage.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, CGRectGetHeight(self.userImage.frame) + 4);
    
    self.introduction.frame = CGRectMake(0, 0, CGRectGetWidth(self.userImage.frame)- 20, 40);
    self.introduction.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, CGRectGetHeight(self.shadowView.frame) - 20);
    
    self.goodImage.frame = CGRectMake(0, 0, 20, 20);
    self.goodImage.center = CGPointMake(CGRectGetWidth(self.shadowView.frame) - 50, CGRectGetHeight(self.userImage.frame) + 24);
    
    self.name.frame = CGRectMake(0, 0, 50, 30);
    self.name.center = CGPointMake(CGRectGetWidth(self.shadowView.frame) - 14, CGRectGetHeight(self.userImage.frame) + 24);
    
}

//赋值 and 自动换行,计算出cell的高度
//-(void)setIntroductionText:(NSString*)text{
//    //获得当前cell高度
//    CGRect frame = [self frame];
//    //文本赋值
//    self.introduction.text = text;
//    //设置label的最大行数
//    self.introduction.numberOfLines = 10;
//    CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width, 1000);
//    CGSize labelSize = [self.introduction.text sizeWithFont:self.introduction.font constrainedToSize:size lineBreakMode:NSLineBreakByClipping];
//    self.introduction.frame = CGRectMake(self.introduction.frame.origin.x, self.introduction.frame.origin.y, labelSize.width, labelSize.height);
//    
//    //计算出自适应的高度
//    frame.size.height = labelSize.height + _userImage.bounds.size.height + 10;
//    
//    self.frame = frame;
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}

#pragma mark - setter
- (void)setContentDictionary:(NSDictionary *)contentDictionary {

}

#pragma mark - getter

- (UIView *)shadowView {
    if (!_shadowView) {
        _shadowView = ({
            UIView *view = [[UIView alloc] init];
            view.backgroundColor = [UIColor whiteColor];
//            view.bounds = CGRectMake(10, 0, 30, 10);
            view.layer.shadowColor = [UIColor blackColor].CGColor;
            view.layer.shadowOffset = CGSizeMake(0, 3);
            view.layer.shadowOpacity = 0.2;
            view;
        });
    }
    return _shadowView;
}

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
        _headImage.layer.cornerRadius = 35;
        _headImage.clipsToBounds = YES;
        _headImage.layer.borderWidth = 3;
        _headImage.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    return _headImage;
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

-(UILabel *)name{
    if (!_name) {
        _name = [[UILabel alloc] init];
        _name.textColor = [UIColor colorWithRed:0.611 green:0.685 blue:0.734 alpha:1.000];
        _name.font = [UIFont systemFontOfSize:14];
    }
    return _name;
}



- (void)awakeFromNib {
    // Initialization code
}



@end
