//
//  NSArray+Match.h
//  HNProject
//
//  Created by eliteall on 2017/1/9.
//  Copyright © 2017年 chenzhongsong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Match)
//手机号正则
+ (NSMutableArray *)matchMobileLink:(NSString *)pattern;
//网址的正则
+ (NSMutableArray *)matchWebLink:(NSString *)pattern;

@end
