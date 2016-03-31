//
//  VShopTableViewCell.h
//  ShoppingGO
//
//  Created by rimi on 16/3/28.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VShopTableViewCell : UITableViewCell

@property (nonatomic, retain)UILabel * name;
@property (nonatomic, retain)UILabel * introduction;
@property (nonatomic, retain)UIImageView * headImage;
@property (nonatomic, retain)UILabel * numberGood;
@property (nonatomic, retain)UILabel * timeLabel;
@property (nonatomic, retain)UILabel * mood;
@property (nonatomic, strong)NSArray * dataSource;

-(void)setIntroductionText:(NSInteger )text;
-(id)initWithReuseIdentifier:(NSString*)reuseIdentifier;

@end
