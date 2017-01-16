//
//  MasonyUtil.h
//  HNProject
//
//  Created by eliteall on 2017/1/5.
//  Copyright © 2017年 chenzhongsong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MasonyUtil : NSObject

//居中显示
+ (void)centerView:(UIView *)view size:(CGSize)size;


//含有边距
+ (void)view:(UIView *)view EdgeInset:(UIEdgeInsets)edgeInsets;


//view的数目大于两个
+ (void)equalSpacingView:(NSArray *)views
               viewWidth:(CGFloat)width
              viewHeight:(CGFloat)height
          superViewWidth:(CGFloat)superViewWidth;



@end
