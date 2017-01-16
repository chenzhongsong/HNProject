//
//  ZYViewController.m
//  Mulit_SelectCell
//
//  Created by Camille on 15/9/10.
//  Copyright (c) 2015年 zhy. All rights reserved.
//

/*
 1、单选表:使用变量记录 被选中的行
 
 2、多选表: 将选中行放在数组中
 */

#import "ZYViewController.h"

@interface ZYViewController ()

@end

@implementation ZYViewController

- (void)dealloc
{
    [_dataArray release];_dataArray = nil;
    [_mulitSelectArray release];_mulitSelectArray = nil;
    [super dealloc];
}



//应用程序 每次加载时，显示多选行

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"____%@",NSHomeDirectory());
    
    //设置初始值，不要默认选中第0行
    _selectRow = -1;
    
    self.title = @"多选表";
    
    self.navigationItem.rightBarButtonItem = [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)] autorelease];
    
    //表
    UITableView* tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [self.view addSubview:tableView];
    [tableView release];
    
    //数据源：
    _dataArray = [[NSMutableArray alloc] init];
    for (int i = 0; i<20; i++) {
        NSString* str = [NSString stringWithFormat:@"%d",i+1];
        [_dataArray addObject:str];
    }
    
    //注册类
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    
#pragma mark -- 取出
    
    //如果文件存在，从本地读取数据，不存在
    
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSString* path = [self getFilePath];
    if (![fileManager fileExistsAtPath:path]) {
        NSLog(@"第一次运行程序，文件不存在，创建空数组");
        //空数组：装有被选中的多行的行号
        _mulitSelectArray = [[NSMutableArray alloc] init];

    }else{
        NSLog(@"文件存在，从本地读取数据");
        //根据文件路径读取 :
        _mulitSelectArray = [[NSMutableArray arrayWithContentsOfFile:path] retain];
    }
    
}

#pragma mark -- 写入

//存储选中的行
- (void)save
{
    //路径：
    NSString* path = [self getFilePath];
    
    BOOL isSuccess = [_mulitSelectArray writeToFile:path atomically:YES];
    if (isSuccess) {
        NSLog(@"写入文件成功");
    }else{
        NSLog(@"写入失败");
    }
    
    for (id object in _mulitSelectArray) {
        NSLog(@"_____%@",object);
    }
    
}

#pragma mark - 
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    /*
    //单选行：给cell设置对号:被选中的行
    if (_selectRow == indexPath.row) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
     */
    
    //字符串
    NSString* selectRow = [NSString stringWithFormat:@"%d",indexPath.row];
    
    //数组中包含当前行号，设置对号
    if ([_mulitSelectArray  containsObject:selectRow]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    
    
    
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}


//选中cell时调用的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    //记录被选中行的行号
     _selectRow = indexPath.row;
    //刷新表
    [tableView reloadData];
    */
    
    //被选中的行：添加到数组中
    //取消行：从数组中移除
    
    NSString*  selectRow  = [NSString stringWithFormat:@"%d",indexPath.row];
    //判断数组中有没有被选中行的行号,
    if ([_mulitSelectArray containsObject:selectRow]) {
        [_mulitSelectArray removeObject:selectRow];
        
    }else{
        [_mulitSelectArray addObject:selectRow];
    }
    
    [tableView reloadData];
    
    
}


- (NSString *)getFilePath
{
    NSString* filePath = [NSHomeDirectory()  stringByAppendingPathComponent:@"Documents/saveData"];
    return filePath;
}

@end











