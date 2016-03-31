//
//  VShopTableViewCell.m
//  ShoppingGO
//
//  Created by rimi on 16/3/28.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "VShopTableViewCell.h"

#import "PhotoCollectionView.h"

#define COLOR_RGB colorWithRed:0.751 green:0.613 blue:0.280 alpha:1.000

@interface VShopTableViewCell ()

@property (nonatomic, strong) UIImageView * goodImage;
@property (nonatomic, retain)PhotoCollectionView * collectionView;
@property (nonatomic, retain)UIView * lineView;
@property (nonatomic, retain)UIImageView * classIfication;

@end

@implementation VShopTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initialiUserInterface];
    }
    return self;
}

-(void)initialiUserInterface{
    _dataSource = @[@"", @""];
    
    //    [self.contentView addSubview:self.userImage];
    
    
    [self addSubview:self.numberGood];
    
    [self addSubview:self.headImage];
    [self addSubview:self.name];
    [self addSubview:self.timeLabel];
    
    [self addSubview:self.introduction];
    [self addSubview:self.collectionView];
    [self addSubview:self.lineView];
    [self addSubview:self.classIfication];
    
    
    
    //    [self addSubview:self.mood];
    [self addSubview:self.goodImage];
    [self addSubview:self.numberGood];
    
    
}

- (void)layoutSubviews {
    
    self.headImage.frame = CGRectMake(0, 0, 50, 50);
    self.headImage.center = CGPointMake(40, 40);
    self.name.frame = CGRectMake(0, 0, 150, 40);
    self.name.center = CGPointMake(150, 35);
    self.timeLabel.frame = CGRectMake(0, 0, 100, 30);
    self.timeLabel.center = CGPointMake(130, 55);
    
    self.introduction.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame)- 30, 60);
    self.introduction.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, CGRectGetHeight(self.bounds) - 40);
    
    self.mood.frame = CGRectMake(0, 0, 100, 30);
    self.mood.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, self.contentView.bounds.size.height / 2);
    
    self.goodImage.frame = CGRectMake(0, 0, 20, 20);
    self.goodImage.center = CGPointMake([UIScreen mainScreen].bounds.size.width - 80, self.contentView.bounds.size.height - 70);
    self.numberGood.frame = CGRectMake(0, 0, 50, 30);
    self.numberGood.center = CGPointMake([UIScreen mainScreen].bounds.size.width - 40, self.contentView.bounds.size.height - 70);
    
    self.collectionView.center = self.contentView.center;
    self.lineView.center = CGPointMake(self.contentView.bounds.size.width / 2, self.contentView.bounds.size.height - 1);
    self.classIfication.center = CGPointMake(25, 108);
}

//赋值 and 自动换行,计算出cell的高度
-(void)setIntroductionText:(NSInteger)text{
    //获得当前cell高度
    CGRect frame = [self frame];
    if (text == 5 || text == 6) {
        frame.size.height = [UIScreen mainScreen].bounds.size.width / 3 * 2 + 170;
    }else if (_dataSource.count == 3){
        frame.size.height = [UIScreen mainScreen].bounds.size.width / 3 + 170;
    }else if (_dataSource.count == 2){
        frame.size.height = [UIScreen mainScreen].bounds.size.width / 2 + 170;
    }else{
        frame.size.height = [UIScreen mainScreen].bounds.size.width + 170;
    }
    
    NSLog(@"%f", self.collectionView.bounds.size.height);
    
    self.frame = frame;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
}



#pragma mark - setter
- (void)setContentDictionary:(NSDictionary *)contentDictionary {
    
}

#pragma mark - getter

-(UIImageView *)classIfication{
    if (!_classIfication) {
        _classIfication = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"classification"]];
        _classIfication.bounds = CGRectMake(0, 0, 50, 50);
    }
    return _classIfication;
}

-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width - 60, 1)];
        
        _lineView.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineView;
}

-(PhotoCollectionView *)collectionView{
    if (!_collectionView) {
        if (_dataSource.count == 5 || _dataSource.count == 6 ) {
            _collectionView = [[PhotoCollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width / 3 * 2 + 4)];
        }else if (_dataSource.count == 3){
            _collectionView = [[PhotoCollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width / 3 + 4)];
        }else if (_dataSource.count == 2){
            _collectionView = [[PhotoCollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width / 2 + 4)];
        }else{
            _collectionView = [[PhotoCollectionView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width + 4)];
        }
        
    }
    return _collectionView;
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


-(UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.text = @"今天11:50";
        _timeLabel.font = [UIFont systemFontOfSize:10];
        _timeLabel.textColor = [UIColor blackColor];
    }
    return _timeLabel;
}

@end
