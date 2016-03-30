//
//  TableViewCell.h
//  首页测试1
//
//  Created by rimi on 16/3/18.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (nonatomic, retain)UILabel * name;
@property (nonatomic, retain)UILabel * introduction;
@property (nonatomic, retain)UIImageView * userImage;
@property (nonatomic, retain)UIImageView * headImage;

-(void)setIntroductionText:(NSString*)text;
-(id)initWithReuseIdentifier:(NSString*)reuseIdentifier;

@property (nonatomic, strong) NSDictionary *contentDictionary;

@end
