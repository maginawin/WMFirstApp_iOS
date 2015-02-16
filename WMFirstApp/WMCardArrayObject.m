//
//  WMCardArrayObject.m
//  WMFirstApp
//
//  Created by wangwendong on 15/2/16.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import "WMCardArrayObject.h"

@implementation WMCardArrayObject

- (WMCardArrayObject*)initWMCardArrayObject {
    self = [super init];
    if (self) {
        _cardArray = [[NSMutableArray alloc] init];
        [self addCardToArray];
    }
    return self;
}

- (void)addCardToArray {
    for (int i = 0 ; i < 54; i++) {
        WMCardObject* cardOjbect = [[WMCardObject alloc] init];
        NSString* cardType = [[NSString alloc] init];
        UIColor* cardColor = [[UIColor alloc] init];
        NSString* cardNumber = [[NSString alloc] init];
        if (i > 0 && i < 13) { // 红桃
            cardType = @"♥︎";
            cardColor = [UIColor redColor];
            cardNumber = [self getCardNumberWithInt:i];
        } else if (i >= 13 && i < 26) { // 黑桃
            cardType = @"♠︎";
            cardColor = [UIColor blackColor];
            cardNumber = [self getCardNumberWithInt:i];
        } else if (i >= 26 && i < 39) { // 梅花
            cardType = @"♣︎";
            cardColor = [UIColor blackColor];
            cardNumber = [self getCardNumberWithInt:i];
        } else if (i >= 39 && i < 52) { // 方块
            cardType = @"♦︎";
            cardColor = [UIColor redColor];
            cardNumber = [self getCardNumberWithInt:i];
        } else if (i == 52) { // 小王 大鬼
            cardType = @"♔";
            cardColor = [UIColor blackColor];
            cardNumber = @"JOKE";
        } else if (i == 53) {
            cardType = @"♚";
            cardColor = [UIColor redColor];
            cardNumber = @"JOKE";
        }
        cardOjbect.cardType = cardType;
        cardOjbect.cardColor = cardColor;
        cardOjbect.cardNumber = cardNumber;
        [_cardArray addObject:cardOjbect];
    }
}

#pragma mark - Tool

- (NSString*)getCardNumberWithInt:(NSInteger)cardInt {
    NSInteger temp = cardInt % 13;
    NSString* result = [[NSString alloc] init];
    if (temp == 0) {
        result = @"A";
    } else if (temp > 0 && temp < 10) {
        result = [NSString stringWithFormat:@"%d", (int)(temp + 1)];
    } else if (temp == 10) {
        result = @"J";
    } else if (temp == 11) {
        result = @"Q";
    } else if (temp == 12) {
        result = @"K";
    }
    return result;
}

@end
