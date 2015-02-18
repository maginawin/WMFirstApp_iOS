//
//  CardObject.h
//  WMFirstApp
//
//  Created by wangwendong on 15/2/17.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardView.h"
#import "Card.h"

@protocol CardObjectDelegate <NSObject>

@required

- (void)cardObjectNoCard;

@end

@interface CardObject : NSObject

@property (nonatomic, weak) id<CardObjectDelegate> delegate;

+ (CardObject*)shardInstance;

- (Card*)getARandomCard;

- (void)refreshCard;

@end
