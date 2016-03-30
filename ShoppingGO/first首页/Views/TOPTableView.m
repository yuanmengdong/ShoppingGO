//
//  TOPTableView.m
//  ShoppingGO
//
//  Created by rimi on 16/3/28.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "TOPTableView.h"

#import "UserModel.h"
#import "TableViewCell.h"

@interface TOPTableView ()

{
    NSMutableArray * tableData;
}

@end

@implementation TOPTableView

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
    UserModel *user = [[UserModel alloc] init];
    [user setUsername:@"2331"];
    [user setIntroduction:@"我是胖虎我怕谁sajdads!!"];
    [user setImagePath:@"7.jpg"];
    [user setImageHeadPath:@"1.jpg"];
    UserModel *user2 = [[UserModel alloc] init];
    [user2 setUsername:@"268"];
    [user2 setIntroduction:@"我是多啦A梦我有肚子!!"];
    [user2 setImagePath:@"6.jpg"];
    [user2 setImageHeadPath:@"2.jpg"];
    UserModel *user3 = [[UserModel alloc] init];
    [user3 setUsername:@"4566"];
    [user3 setIntroduction:@"我是大雄我谁都怕，"];
    [user3 setImagePath:@"5.jpg"];
    [user3 setImageHeadPath:@"3.jpg"];
    UserModel *user4 = [[UserModel alloc] init];
    [user4 setUsername:@"478"];
    [user4 setIntroduction:@"我是大雄我谁都怕，"];
    [user4 setImagePath:@"4.jpg"];
    [user4 setImageHeadPath:@"4.jpg"];
    UserModel *user5 = [[UserModel alloc] init];
    [user5 setUsername:@"354"];
    [user5 setIntroduction:@"我是大雄我谁都怕，"];
    [user5 setImagePath:@"3.jpg"];
    [user5 setImageHeadPath:@"5.jpg"];
    UserModel *user6 = [[UserModel alloc] init];
    [user6 setUsername:@"0987"];
    [user6 setIntroduction:@"我是大雄我谁都怕，"];
    [user6 setImagePath:@"2.jpg"];
    [user6 setImageHeadPath:@"6.jpg"];
    UserModel *user7 = [[UserModel alloc] init];
    [user7 setUsername:@"3543"];
    [user7 setIntroduction:@"我是大雄我谁都怕，"];
    [user7 setImagePath:@"1.jpg"];
    [user7 setImageHeadPath:@"7.jpg"];
    
    
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
    TableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
//    if (!cell) {
//        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }
    
    UserModel * user = [tableData objectAtIndex:indexPath.row];
    cell.name.text = user.username;
    [cell.userImage setImage:[UIImage imageNamed:user.imagePath]];
    [cell.headImage setImage:[UIImage imageNamed:user.imageHeadPath]];
    //    [cell setIntroductionText:user.introduction];
    cell.introduction.text = user.introduction;
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    //    UILabel *label = [[UILabel alloc] init];
    //    label.font = [UIFont fontWithName:@"OpenType TrueType" size:15];
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}

#pragma mark - getter

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
                _tableView.center = self.center;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithWhite:1 alpha:1];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
        _tableView.rowHeight = 260;
        [_tableView registerClass:[TableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
    
}

@end















