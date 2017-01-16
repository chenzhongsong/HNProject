//
//  ZYViewController.h
//  Mulit_SelectCell
//
//  Created by Camille on 15/9/10.
//  Copyright (c) 2015年 zhy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

{
    NSMutableArray* _dataArray;
    
    int _selectRow;
    
    
    NSMutableArray* _mulitSelectArray;
}

@end
