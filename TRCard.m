//
//  TRCard.m
//  Matchismo
//
//  Created by wanglin on 14-12-29.
//  Copyright (c) 2014年 Tarena. All rights reserved.
//

#import "TRCard.h"

@implementation TRCard
-(int)match:(NSArray*)otherCards
{
    int score=0;
    for(TRCard *card in otherCards){
        if ([card contents isEqualToString:self.contents]) {
            score +=1;
            
        }
    }
    return score;
}
@end
