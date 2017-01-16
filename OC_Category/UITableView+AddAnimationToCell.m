//
//  UITableView+AddAnimationToCell.m
//  HNProject
//
//  Created by eliteall on 2017/1/9.
//  Copyright © 2017年 chenzhongsong. All rights reserved.
//

#import "UITableView+AddAnimationToCell.h"

@implementation UITableView (AddAnimationToCell)

- (void)addAnimationToCell {
    
    [self reloadData];
    
    //延迟
    CGFloat delay = 0.05;
    for (UITableViewCell *cell in self.visibleCells) {
        cell.transform = CGAffineTransformMakeTranslation(0, self.bounds.size.width);
    }
    
    for (int i = 0; i<self.visibleCells.count; i++) {
        UITableViewCell *cell = self.visibleCells[i];
        CGFloat cellDelay = delay * i;
        [UIView animateWithDuration:1.0 delay:cellDelay usingSpringWithDamping:0.5 initialSpringVelocity:10 options:UIViewAnimationOptionCurveEaseIn animations:^{
            cell.transform = CGAffineTransformMakeTranslation(0, 0);
        } completion:^(BOOL finished) {
            
        }];
    }
}

@end
