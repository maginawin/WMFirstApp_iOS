//
//  CardObject.m
//  WMFirstApp
//
//  Created by wangwendong on 15/2/17.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import "CardObject.h"

@interface CardObject()

@property (nonatomic, strong) NSMutableArray* cardArray;

@end

@implementation CardObject
static CardObject* cardObject;

+ (CardObject*)shardInstance {
    if (!cardObject) {
        cardObject = [[super alloc] init];
        cardObject.cardArray = [[NSMutableArray alloc] init];
        [cardObject initCardArray];
    }
    return cardObject;
}

#pragma mark - implementation

- (Card*)getARandomCard {
    NSInteger count = cardObject.cardArray.count;
    if (count <= 0) {
        [_delegate cardObjectNoCard];
        return nil;
    }
    NSInteger tempIndex = arc4random() % count;
    Card* card = [cardObject.cardArray objectAtIndex:tempIndex];
    [cardObject.cardArray removeObjectAtIndex:tempIndex];
    return card;
}

- (void)refreshCard {
    [cardObject.cardArray removeAllObjects];
    [cardObject initCardArray];
}

#pragma mark - Tool

- (void)initCardArray {
    for (int i = 0; i < 54; i++) {
        Card* card = [[Card alloc] init];
        if (i >= 0 && i < 13) { // 红桃
            card.cardType = @"♥︎";
            card.cardColor = [UIColor redColor];
            card.cardNumber = [self getNumberFromNSInteger:(int)(i % 13 + 1)];
        } else if (i >= 13 && i < 26) { // 黑桃
            card.cardType = @"♠︎";
            card.cardColor = [UIColor blackColor];
            card.cardNumber = [self getNumberFromNSInteger:(int)(i % 13 + 1)];
        } else if (i >= 26 && i < 39) { // 梅花
            card.cardType = @"♣︎";
            card.cardColor = [UIColor blackColor];
            card.cardNumber = [self getNumberFromNSInteger:(int)(i % 13 + 1)];
        } else if (i >= 39 && i < 52) { // 方块
            card.cardType = @"♦︎";
            card.cardColor = [UIColor redColor];
            card.cardNumber = [self getNumberFromNSInteger:(int)(i % 13 + 1)];
        } else if (i == 52) { // 小王
            card.cardType = @"♔";
            card.cardColor = [UIColor blackColor];
            card.cardNumber = [NSString stringWithFormat:@"JOKE"];
        } else if (i == 53) { // 大王
            card.cardType = @"♚";
            card.cardColor = [UIColor redColor];
            card.cardNumber = [NSString stringWithFormat:@"JOKE"];
        }
        [_cardArray addObject:card];
    }
}

- (NSString*)getNumberFromNSInteger:(NSInteger)i {
    if (i == 1) {
        return @"A";
    } else if (i == 11) {
        return @"J";
    } else if (i == 12) {
        return @"Q";
    } else if (i == 13) {
        return @"K";
    } else {
        return [NSString stringWithFormat:@"%d", (int)i];
    }
}

@end
