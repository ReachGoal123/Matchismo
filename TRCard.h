//
//  TRCard.h
//  Matchismo
//
//  Created by wanglin on 14-12-29.
//  Copyright (c) 2014年 Tarena. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TRCard : NSObject
@property(nonatomic,strong)NSString*contents;//牌的内容
@property(nonatomic,getter = isChosen)BOOL chosen;
@property(nonatomic,getter = isMatched)BOOL matched;
-(int)match:(NSArray*)otherCards;
@end
