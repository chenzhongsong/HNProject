//
//  DeleteCellViewController.m
//  HNProject
//
//  Created by eliteall on 2017/1/11.
//  Copyright © 2017年 chenzhongsong. All rights reserved.
//

#import "DeleteCellViewController.h"
#import "UITableViewCell+Delete.h"

@interface DeleteCellViewController ()<UITableViewDataSource,UITableViewDelegate,DeleteCellDelegate>
{
    UITableView* table;
    NSMutableArray* arr;
}
@end

@implementation DeleteCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    arr = [NSMutableArray array];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        for (int i = 0; i < 100; i++) {
            [arr addObject:[NSString stringWithFormat:@"%d",i]];
        }
        table = [[UITableView alloc] initWithFrame:self.view.frame];
        table.dataSource = self;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.view addSubview:table];
        });
    });
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* identifier = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:identifier];
        [cell enableDeleteMethod:YES];
        cell.deleteDelegate = self;
    }else {
        [cell placeDeleteViewWithAnimation:NO];
    }
    cell.textLabel.text = arr[indexPath.row];
    return cell;
}

- (void)deleteAction:(UITableViewCell *)cell {
    NSIndexPath* indexPath = [table indexPathForCell:cell];
    [arr removeObjectAtIndex:indexPath.row];
    [table deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:(UITableViewRowAnimationFade)];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView  deselectRowAtIndexPath:indexPath animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
