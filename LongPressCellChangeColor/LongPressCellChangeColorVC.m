//
//  LongPressCellChangeColorVC.m
//  HNProject
//
//  Created by eliteall on 2017/1/11.
//  Copyright © 2017年 chenzhongsong. All rights reserved.
//

#import "LongPressCellChangeColorVC.h"

@interface LongPressCellChangeColorVC ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableview;
@end

@implementation LongPressCellChangeColorVC
#pragma mark init
- (UITableView *)tableview{
    if (!_tableview) {
        _tableview = [[UITableView alloc]init];
    }
    return _tableview;
}
#pragma mark System Action
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBaseInfo];
}
#pragma mark OtherAction
- (void)initBaseInfo{
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressGesturecognized:)];
    [self.tableview addGestureRecognizer:longPress];
    self.tableview.frame = CGRectMake(0, 50, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-50);
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    //    self.tableview.separatorStyle
    self.tableview.scrollEnabled = NO;
    self.tableview.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableview];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark tableDelegate
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *defaultIde = @"defaultIde";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:defaultIde];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:defaultIde];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
#pragma mark OtherAction
- (void)longPressGesturecognized:(id)sender{
    UILongPressGestureRecognizer *longPress = (UILongPressGestureRecognizer *)sender;
    UIGestureRecognizerState state = longPress.state;//这是长按手势的状态   下面switch用到了
    CGPoint location = [longPress locationInView:self.tableview];
    CGPoint uplocation = location;
    uplocation.y = location.y +50;
    CGPoint downlocation = location;
    downlocation.y = downlocation.y -50;
    NSIndexPath *indexPath = [self.tableview indexPathForRowAtPoint:location];
    NSIndexPath *indexPath1 = [self.tableview indexPathForRowAtPoint:uplocation];
    NSIndexPath *indexPath2 = [self.tableview indexPathForRowAtPoint:downlocation];
    switch (state) {
        case UIGestureRecognizerStateBegan:
        {
            if (indexPath) {
                UITableViewCell *cell = [self.tableview cellForRowAtIndexPath:indexPath];
                cell.backgroundColor = [UIColor redColor];
                
            }
            break;
        }
        case UIGestureRecognizerStateChanged:
        {
            if (indexPath) {
                UITableViewCell *cell = [self.tableview cellForRowAtIndexPath:indexPath];
                cell.backgroundColor = [UIColor redColor];
                if (indexPath1) {
                    UITableViewCell *cell1 = [self.tableview cellForRowAtIndexPath:indexPath1];
                    cell1.backgroundColor = [UIColor whiteColor];
                }
                if (indexPath2) {
                    UITableViewCell *cell2 = [self.tableview cellForRowAtIndexPath:indexPath2];
                    cell2.backgroundColor = [UIColor whiteColor];
                }
            }
            break;
        }
            default:
            
            break;
    }
}
@end
