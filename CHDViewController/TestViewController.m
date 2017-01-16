//
//  TestViewController.m
//  CHDControllerScroll
//
//  Created by chd on 15-4-10.
//  Copyright (c) 2015年 chd. All rights reserved.
//

#import "TestViewController.h"
#import "TestCell.h"
@interface TestViewController ()
{
    NSInteger index;
}
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.theCollection.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0 green:(arc4random()%255)/255.0 blue:(arc4random()%255)/255.0 alpha:1];
    [_theCollection registerClass:[TestCell class] forCellWithReuseIdentifier:@"testcell"];
    NSArray *arr = @[@"精选",@"首页",@"美剧",@"内地",@"独播",@"专题",@"片花",@"韩剧",@"台剧",@"泰剧",@"新加坡剧",@"经典剧",@"排行"];
    
    for (int i = 0; i < arr.count; i++) {
        if ([_TheTitle isEqualToString:arr[i]]) {
            index = i;
            break;
        }
    }

    
    

    // Do any additional setup after loading the view.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return (index+1)*10;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TestCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"testcell" forIndexPath:indexPath];
    cell.name.text = _TheTitle;
    return cell;
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
