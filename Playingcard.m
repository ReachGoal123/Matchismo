//
//  Playingcard.m
//  Matchismo
//
//  Created by wanglin on 14-12-29.
//  Copyright (c) 2014年 Tarena. All rights reserved.
//

#import "Playingcard.h"

@implementation Playingcard

-(void)setSuit:(NSString *)suit
{
    if ([(@[@"1",@"2",@"3",@"4"]containsObject:suit) ] ){
        _suit=suit;
    }
}

@end
