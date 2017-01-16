//
//  AdjustNumViewController.m
//  HNProject
//
//  Created by eliteall on 2017/1/11.
//  Copyright © 2017年 chenzhongsong. All rights reserved.
//

#import "AdjustNumViewController.h"
#import "HJCAjustNumButton.h"

@interface AdjustNumViewController ()

@end

@implementation AdjustNumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    // 创建对象
    HJCAjustNumButton *btn = [[HJCAjustNumButton alloc] init];
    
    // 设置Frame，如不设置则默认为(0, 0, 110, 30)
    btn.frame = CGRectMake(100, 200, 100, 25);
    
    // 内容更改的block回调
    btn.callBack = ^(NSString *currentNum){
        NSLog(@"%@", currentNum);
    };
    
    // 加到父控件上
    [self.view addSubview:btn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
