//
//  TestCell.m
//  CHDControllerScroll
//
//  Created by chd on 15-4-10.
//  Copyright (c) 2015年 chd. All rights reserved.
//

#import "TestCell.h"

@implementation TestCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"TestCell" owner:self options:nil]lastObject];
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
    
}

@end
