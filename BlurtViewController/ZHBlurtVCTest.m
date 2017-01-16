//
//  ZHBlurtVCTest.m
//  HNProject
//
//  Created by eliteall on 2017/1/10.
//  Copyright © 2017年 chenzhongsong. All rights reserved.
//

#import "ZHBlurtVCTest.h"
#import "ZHBlurtView.h"

@interface ZHBlurtVCTest ()

@end

@implementation ZHBlurtVCTest

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ZHBlurtView *b = [[ZHBlurtView alloc] initWithFrame:self.view.frame WithHeaderImgHeight:200 iconHeight:100];
    [self.view addSubview:b];
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
