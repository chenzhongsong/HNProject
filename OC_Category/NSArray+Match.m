//
//  NSArray+Match.m
//  HNProject
//
//  Created by eliteall on 2017/1/9.
//  Copyright © 2017年 chenzhongsong. All rights reserved.
//

#import "NSArray+Match.h"

@implementation NSArray (Match)

+ (NSMutableArray *)matchMobileLink:(NSString *)pattern {
    
//    NSMutableArray *linkArr = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *linkArr = [NSMutableArray array];
    NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:@"(\\(86\\))?(13[0-9]|15[0-35-9]|18[0125-9])\\c|{8}" options:NSRegularExpressionDotMatchesLineSeparators|NSRegularExpressionCaseInsensitive error:nil];
    NSArray *array = [regular matchesInString:pattern options:0 range:NSMakeRange(0, [pattern length])];
    for (NSTextCheckingResult *result in array) {
        NSString *string = [pattern substringWithRange:result.range];
        NSMutableDictionary *dic =[NSMutableDictionary dictionaryWithObjectsAndKeys:string,NSStringFromRange(result.range), nil];
        [linkArr addObject:dic];
    }
    NSLog(@"linkArr = %@",linkArr);
    return linkArr;
}

+ (NSMutableArray *)matchWebLink:(NSString *)pattern {
    
//    NSMutableArray *linkArr = [NSMutableArray arrayWithCapacity:0];
    NSMutableArray *linkArr = [NSMutableArray array];
    NSRegularExpression *regular = [[NSRegularExpression alloc] initWithPattern:@"((http[s]{0,1}|ftp)://[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\c|+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)|(www.[a-zA-Z0-9\\.\\-]+\\.([a-zA-Z]{2,4})(:\\c|+)?(/[a-zA-Z0-9\\.\\-~!@#$%^&*+?:_/=<>]*)?)" options:NSRegularExpressionDotMatchesLineSeparators|NSRegularExpressionCaseInsensitive error:nil];
    NSArray *array = [regular matchesInString:pattern options:0 range:NSMakeRange(0, [pattern length])];
    for (NSTextCheckingResult *result in array) {
        NSString *string = [pattern substringWithRange:result.range];
        NSMutableDictionary *dic =[NSMutableDictionary dictionaryWithObjectsAndKeys:string,NSStringFromRange(result.range), nil];
        [linkArr addObject:dic];
    }
    NSLog(@"linkArr = %@",linkArr);
    return linkArr;
}


@end


















































