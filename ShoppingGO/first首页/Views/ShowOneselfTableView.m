//
//  ShowOneselfTableView.m
//  ShoppingGO
//
//  Created by rimi on 16/3/28.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "ShowOneselfTableView.h"

#import "UserModel3.h"
#import "ShowTableViewCell.h"

@interface ShowOneselfTableView ()

{
    NSMutableArray * tableData;
}

@end

@implementation ShowOneselfTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialiDataSource];
        [self initialiUserInterface];
    }
    return self;
}

-(void)initialiDataSource{
    tableData = [[NSMutableArray alloc] init];
    [self createUserData];
    
}

-(void)initialiUserInterface{
    [self addSubview:self.tableView];
}

-(void)createUserData{
    UserModel3 *user = [[UserModel3 alloc] init];
    [user setUsername:@"2331"];
    [user setIntroduction:@"我是胖虎我怕谁sajdads!!"];
    [user setImagePath:@"1007.jpg"];
    [user setImageHeadPath:@"1001.jpg"];
    UserModel3 *user2 = [[UserModel3 alloc] init];
    [user2 setUsername:@"268"];
    [user2 setIntroduction:@"我是多啦A梦我有肚子!!"];
    [user2 setImagePath:@"1006.jpg"];
    [user2 setImageHeadPath:@"1002.jpg"];
    UserModel3 *user3 = [[UserModel3 alloc] init];
    [user3 setUsername:@"4566"];
    [user3 setIntroduction:@"我是大雄我谁都怕，"];
    [user3 setImagePath:@"1005.jpg"];
    [user3 setImageHeadPath:@"1003.jpg"];
    UserModel3 *user4 = [[UserModel3 alloc] init];
    [user4 setUsername:@"478"];
    [user4 setIntroduction:@"我是大雄我谁都怕，"];
    [user4 setImagePath:@"1004.jpg"];
    [user4 setImageHeadPath:@"1004.jpg"];
    UserModel3 *user5 = [[UserModel3 alloc] init];
    [user5 setUsername:@"354"];
    [user5 setIntroduction:@"我是大雄我谁都怕，"];
    [user5 setImagePath:@"1003.jpg"];
    [user5 setImageHeadPath:@"1005.jpg"];
    UserModel3 *user6 = [[UserModel3 alloc] init];
    [user6 setUsername:@"0987"];
    [user6 setIntroduction:@"我是大雄我谁都怕，"];
    [user6 setImagePath:@"1002.jpg"];
    [user6 setImageHeadPath:@"1006.jpg"];
    UserModel3 *user7 = [[UserModel3 alloc] init];
    [user7 setUsername:@"3543"];
    [user7 setIntroduction:@"我是大雄我谁都怕，"];
    [user7 setImagePath:@"1001.jpg"];
    [user7 setImageHeadPath:@"1007.jpg"];
    
    
    [tableData addObject:user];
    [tableData addObject:user2];
    [tableData addObject:user3];
    [tableData addObject:user4];
    [tableData addObject:user5];
    [tableData addObject:user6];
    [tableData addObject:user7];
}


#pragma mark - UITableViewCell

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [tableData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * identifier = @"cell";
    ShowTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    //    if (!cell) {
    //        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    //    }
    
    UserModel3 * user = [tableData objectAtIndex:indexPath.row];
    cell.numberGood.text = user.username;
    [cell.userImage setImage:[UIImage imageNamed:user.imagePath]];
    [cell.headImage setImage:[UIImage imageNamed:user.imageHeadPath]];
    //    [cell setIntroductionText:user.introduction];
    cell.introduction.text = user.introduction;
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    //    UILabel *label = [[UILabel alloc] init];
    //    label.font = [UIFont fontWithName:@"OpenType TrueType" size:15];
    
    return cell;
}

#pragma mark - getter

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
        _tableView.center = self.center;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
        _tableView.rowHeight = 400;
        [_tableView registerClass:[ShowTableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
    
}



@end
