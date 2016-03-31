//
//  VShopTableView.m
//  ShoppingGO
//
//  Created by rimi on 16/3/28.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "VShopTableView.h"
#import "UserModel3.h"
#import "VShopTableViewCell.h"

@interface VShopTableView ()

{
    NSMutableArray * tableData;
    //    int _arrayNumber;
}

@property (nonatomic, assign)NSInteger arrayNumber;

@end


@implementation VShopTableView

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
    
    
    
}

-(void)initialiUserInterface{
   
    
    [self addSubview:self.tableView];
    
}

#pragma mark - UITableViewCell

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    VShopTableViewCell * cell = [self tableView:_tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString * identifier = @"cell";
    VShopTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[VShopTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    UserModel3 * user = [tableData objectAtIndex:indexPath.row];
    cell.dataSource = @[@"2", @"3"];
    _arrayNumber = cell.dataSource.count;
    cell.numberGood.text = user.username;
    [cell.headImage setImage:[UIImage imageNamed:user.imageHeadPath]];
    [cell setIntroductionText:(_arrayNumber)];
    cell.introduction.text = user.introduction;
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    
    //    UILabel *label = [[UILabel alloc] init];
    //    label.font = [UIFont fontWithName:@"OpenType TrueType" size:15];
    
    return cell;
}




- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //    TableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //    cell.selected = NO;
    
}

#pragma mark - getter

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.frame style:UITableViewStylePlain];
        //        _tableView.center = self.view.center;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
        //        _tableView.rowHeight = 400;
        [_tableView registerClass:[VShopTableViewCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tableView;
    
}

@end



















