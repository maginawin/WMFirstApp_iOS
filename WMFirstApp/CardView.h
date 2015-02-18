//
//  CardView.h
//  WMFirstApp
//
//  Created by wangwendong on 15/2/17.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"

@protocol CardViewDelegate <NSObject>

@required

- (void)cardViewShow:(NSInteger)cardViewTag;

- (void)cardViewHidden:(NSInteger)cardViewTag;

@end

@interface CardView : UIView

@property (nonatomic, weak) id<CardViewDelegate> delegate;

@property (nonatomic) BOOL isShow;

@property (nonatomic, strong) UILabel* cardType;
@property (nonatomic, strong) UILabel* cardNumber;

- (void)setCard:(Card*)card;

- (void)show;

- (void)hidden;

- (void)clickBtnNotEnable;

@end
