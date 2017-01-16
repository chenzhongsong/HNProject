//
//  CHDViewController.h
//  CHDControllerScroll
//
//  Created by chd on 15-4-10.
//  Copyright (c) 2015年 chd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CHDViewController : UIViewController<UIScrollViewDelegate>
//两个数组元素个数要相同
@property (nonatomic, retain) NSMutableArray *ScrollControllersArr;
@property (nonatomic, retain) NSMutableArray *nameArr;
@property float ControllerHeight;
@end
