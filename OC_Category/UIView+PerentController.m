//
//  UIView+PerentController.m
//  HNProject
//
//  Created by eliteall on 2016/12/23.
//  Copyright © 2016年 chenzhongsong. All rights reserved.
//

#import "UIView+PerentController.h"

@implementation UIView (PerentController)
//http://blog.csdn.net/chun799/article/details/8223612
- (UIViewController *)parentController {
    UIResponder *responder = [self nextResponder];
    while (responder) {
        if ([responder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)responder;
        }
        responder = [responder nextResponder];
    }
    return nil;
}

@end
