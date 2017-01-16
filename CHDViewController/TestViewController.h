//
//  TestViewController.h
//  CHDControllerScroll
//
//  Created by chd on 15-4-10.
//  Copyright (c) 2015年 chd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UICollectionView *theCollection;
@property (nonatomic, retain) NSString *TheTitle;
@end
