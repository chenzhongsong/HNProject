//
//  ViewController.m
//  HNProject
//
//  Created by eliteall on 2016/12/23.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "ViewController.h"
#import "CenterViewController.h"
#import "EdgeViewController.h"
#import "EqualSpacingViewController.h"
#import "ScrollViewController.h"

#import "UITableView+AddAnimationToCell.h"
#import "NSArray+Match.h"

#import "HGTabbarController.h"
#import "IndexViewController.h"
#import "CHDViewController.h"
#import "TestViewController.h"
#import "ZYViewController.h"
#import "CollectionViewController.h"
#import "SwipeTableViewController.h"
#import "ZHBlurtVCTest.h"
#import "QRViewController.h"
#import "LongPressCellChangeColorVC.h"
#import "AdjustNumViewController.h"
#import "DeleteCellViewController.h"
#import "PhotoRiverViewController.h"
#import "LocationPickerVC.h"
#import "SwitchViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;

@property (nonatomic, strong) NSArray *titles;
@property (nonatomic, strong) NSArray *cellArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Masony练习例子";
    
    [self.view addSubview:self.tableView];
    
    [self.tableView addAnimationToCell];
    
    [NSArray matchMobileLink:@"+8618236912628883r438ru38r8"];
    [NSArray matchMobileLink:@"https://www.baidu.com|https://www.jianshu.com"];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.titles.count;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentity" forIndexPath:indexPath];
    if (self.titles.count > 0) {
        
        cell.textLabel.text = self.titles[indexPath.row];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
        {
            CenterViewController *centerVC = [[CenterViewController alloc] init];
            [self.navigationController pushViewController:centerVC animated:YES];
        }
            break;
            
        case 1:
        {
            EdgeViewController *edgeVC = [[EdgeViewController alloc] init];
            [self.navigationController pushViewController:edgeVC animated:YES];
        }
            break;
            
        case 2:
        {
            EqualSpacingViewController *equalVC = [[EqualSpacingViewController alloc] init];
            [self.navigationController pushViewController:equalVC animated:YES];
        }
            break;
            
        case 3:
        {
            ScrollViewController *sc = [[ScrollViewController alloc] init];
            [self.navigationController pushViewController:sc animated:YES];
        }
            break;
        case 4:
        {
            HGTabbarController *tab=[[HGTabbarController alloc]init];
            [self.navigationController pushViewController:tab animated:YES];
        }
            break;
        case 5:
        {
            IndexViewController *index=[[IndexViewController alloc]init];
            [self.navigationController pushViewController:index animated:YES];
        }
            break;
        case 6:
        {
            CHDViewController *chd = [[CHDViewController alloc] init];
            NSArray *arr = @[@"精选",@"首页",@"美剧",@"内地",@"独播",@"专题",@"CHD,奏是这么任性",@"片花",@"韩剧",@"台剧",@"泰剧",@"新加坡剧",@"经典剧",@"排行"];
            
            for (int i = 0; i < arr.count; i++) {
                TestViewController *test = [[TestViewController alloc] initWithNibName:nil bundle:nil];
                //放在最下面
                test.TheTitle = arr[i];
                
                
                [chd.ScrollControllersArr addObject:test];
            }
            chd.nameArr = [NSMutableArray arrayWithArray:arr];
            [self presentViewController:chd animated:NO completion:nil];
//            [self.navigationController pushViewController:chd animated:YES];
        }
            break;
            
        case 7:
        {
            ZYViewController* zy = [[ZYViewController alloc] init];
            [self.navigationController pushViewController:zy animated:YES];
        }
            break;
        case 8:
        {
            CollectionViewController* collectionvc = [[CollectionViewController alloc] init];
            [self.navigationController pushViewController:collectionvc animated:YES];
        }
            break;
        case 9:
        {
            UIStoryboard *UpgradeHardware = [UIStoryboard storyboardWithName:@"Choose" bundle:nil];//UpgradeHardware storyboard的名称
            
            UIViewController *firstVC = [UpgradeHardware instantiateViewControllerWithIdentifier:@"ChooseTableView"];//跳转VC的名称
                                         
            [self.navigationController pushViewController:firstVC animated:YES];
        }
            break;
        case 10:
        {
            SwipeTableViewController* swipe = [[SwipeTableViewController alloc] init];
            [self.navigationController pushViewController:swipe animated:YES];
        }
            break;
        case 11:
        {
            ZHBlurtVCTest* blurt = [[ZHBlurtVCTest alloc] init];
            [self.navigationController pushViewController:blurt animated:YES];
        }
            break;
        case 12:
        {
            QRViewController* qrView = [[QRViewController alloc] init];
            [self.navigationController pushViewController:qrView animated:YES];
        }
            break;
        case 13:
        {
            LongPressCellChangeColorVC* longPressCell = [[LongPressCellChangeColorVC alloc] init];
            [self.navigationController pushViewController:longPressCell animated:YES];
        }
            break;
        case 14:
        {
            AdjustNumViewController* adjust = [[AdjustNumViewController alloc] init];
            [self.navigationController pushViewController:adjust animated:YES];
        }
            break;
        case 15:
        {
            DeleteCellViewController* deleteCell = [[DeleteCellViewController alloc] init];
            [self.navigationController pushViewController:deleteCell animated:YES];
        }
            break;
        case 16:
        {
            PhotoRiverViewController* xyzPhoto = [[PhotoRiverViewController alloc] init];
            [self.navigationController pushViewController:xyzPhoto animated:YES];
        }
            break;
        case 17:
        {
            LocationPickerVC* location = [[LocationPickerVC alloc] init];
            [self.navigationController pushViewController:location animated:YES];
        }
            break;
        case 18:
        {
//            SwitchViewController* switchView = [[SwitchViewController alloc] init];
//            [self.navigationController pushViewController:switchView animated:YES];
            
            HTPaggingViewer *pagging =[[HTPaggingViewer alloc] init];
            UINavigationController *navigationController3 = [[UINavigationController alloc] initWithRootViewController:pagging];
            SwitchViewController *questionMainVC= [[SwitchViewController alloc] init];
            questionMainVC.title = @"啦啦";
            questionMainVC.view.backgroundColor = [UIColor grayColor];
            SwitchViewController *masterListVC = [[SwitchViewController alloc] init];
            masterListVC.title = @"哈哈";
            masterListVC.view.backgroundColor = [UIColor yellowColor];
            
            HTPaggingViewer * product3 = (HTPaggingViewer *)navigationController3.topViewController;
            product3.viewControllers = @[masterListVC,questionMainVC];
            
            [self presentViewController:navigationController3 animated:YES completion:nil];
        }
            break;
        default:
            break;
    }
}

#pragma mark - getter and setter

-(NSArray *)titles {
    
    if (!_titles) {
        
        _titles = [NSArray array];
        _titles = @[@"居中显示",@"子视图含边距",@"视图等距离摆放",@"计算ScrollView的contentsize",@"masonry纯代码计算cell高度",@"tableView右侧索引",@"滚动视图",@"多选表----Mulit_SelectCell",@"动态瀑布流--展示网络图片",@"Choose_Mulit",@"Cell侧滑菜单",@"头像Blurt拉伸测试",@"仿微信二维码扫描",@"长按Cell颜色改变",@"加减数字按钮",@"DeleteTableViewCellDemo",@"PhotoRiverViewController",@"地区Picker应用",@"视图切换"];
    }
    return _titles;
}

-(UITableView *)tableView {
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame)) style:UITableViewStylePlain];
        _tableView.tableHeaderView = [UIView new];
        _tableView.tableFooterView = [UIView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentity"];
    }
    return _tableView;
}

@end
