//
//  XHPaggingNavbar.m
//  XHTwitterPagging
//
//  Created by 曾 宪华 on 14-6-20.
//  Copyright (c) 2014年 曾宪华 QQ群: (142557668) QQ:543413507  Gmail:xhzengAIB@gmail.com. All rights reserved.
//

#import "HTPaggingNavbar.h"
#import "UIView+LSAdditions.h"

#define kXHiPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)

#define kXHLabelBaseTag 1000

#define kXHRadie 3.2



@interface HTPaggingNavbar () {
    CGFloat _mainScreenWidth;
    
    UIView *_rightView;
    NSMutableArray *_btnList;
    NSInteger sumCount;
}

/**
 *  分页指示器
 */

@end

@implementation HTPaggingNavbar

#pragma mark - DataSource

- (void)reloadData {
    if (!self.titles.count) {
        return;
    }
}

#pragma mark - Propertys
- (void)setCurrentPage:(NSInteger)currentPage {
    _currentPage = currentPage;
    
    [_btnList enumerateObjectsUsingBlock:^(UIButton *sBtton, NSUInteger idx, BOOL *stop) {
        if (_currentPage == idx) {
            [sBtton setBackgroundImage:[self checkAndSetBackGroundImageSelectd:idx] forState:UIControlStateNormal];
            [sBtton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        }else{
            [sBtton setBackgroundImage:[self checkAndSetBackGroundImage:idx] forState:UIControlStateNormal];
            [sBtton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }];  
}

- (void)setContentOffset:(CGPoint)contentOffset {
//    _contentOffset = contentOffset;
//    CGFloat xOffset = contentOffset.x;
//    CGFloat normalWidth = CGRectGetWidth([[UIScreen mainScreen] bounds]);
//    CGFloat xLine = (xOffset/normalWidth)*PageWidth;
//    [UIView animateWithDuration:0.15 animations:^{
////        _bgLineView.left = xLine;
//    } completion:^(BOOL finished) {
//        
//    }];
}

#pragma mark - Life Cycle

- (id)initWithFrame:(CGRect)frame withNumber:(NSInteger) pageCount  withTitles:(NSArray *)titles{
    self = [super initWithFrame:frame];
    if (self) {
        sumCount = pageCount;
        _titles = [[NSArray alloc] initWithArray:titles];
        // Initialization code
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _mainScreenWidth = [[UIScreen mainScreen] bounds].size.width;
        _rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width-2, 31)];
        _rightView.backgroundColor = [UIColor clearColor];
        [self addSubview:_rightView];
        [self createButtonView];
    }
    return self;
}

- (void)dealloc {
}
-(void)createButtonView
{
    _btnList = [NSMutableArray array];
    for (int i = 0; i<sumCount; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake( i*(self.width/sumCount), 0, (self.width/sumCount), 31);
        button.tag = i + 100;
        [button setTitle:_titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(didClickHeadButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [button setBackgroundImage:[self checkAndSetBackGroundImage:i] forState:UIControlStateNormal];
        [button setBackgroundImage:[self checkAndSetBackGroundImage:i] forState:UIControlStateHighlighted];
        if (i == 0) {
             [button setBackgroundImage:[self checkAndSetBackGroundImageSelectd:i] forState:UIControlStateNormal];
             [button setBackgroundImage:[self checkAndSetBackGroundImageSelectd:i] forState:UIControlStateHighlighted];
             [button setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
             [button setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
        }
        [_rightView addSubview:button];
        [_btnList addObject:button];
    }
}
-(void)didClickHeadButtonAction:(UIButton *)sender
{
    self.didChangedIndex(sender.tag - 100);
}

#pragma mark
#pragma mark button 默认状态背景图片
- (UIImage *)checkAndSetBackGroundImage:(NSInteger)whitchIcon {
    switch (whitchIcon) {
        case 0:
            return [UIImage imageNamed:@"3左未"];
            break;
        case 1:
        {
            return sumCount == 2?[UIImage imageNamed:@"3右未"]:[UIImage imageNamed:@"3中未"];
        }
            break;
        case 2:
            return [UIImage imageNamed:@"3右未"];
            break;
        default:
            return nil;
            break;
    }
}

#pragma mark
#pragma mark button 选中状态背景图片
- (UIImage *)checkAndSetBackGroundImageSelectd:(NSInteger)whitchIcon {
    switch (whitchIcon) {
        case 0:
            return [UIImage imageNamed:@"3左点击"];
            break;
        case 1:
            return sumCount == 2?[UIImage imageNamed:@"3右点击"]:[UIImage imageNamed:@"3中点击"];
            break;
        case 2:
            return [UIImage imageNamed:@"3右点击"];
            break;
        default:
            return nil;
            break;
    }
}

@end
