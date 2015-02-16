//
//  WMCardViewController.m
//  WMFirstApp
//
//  Created by wangwendong on 15/2/16.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import "WMCardViewController.h"

@interface WMCardViewController ()

@property (weak, nonatomic) IBOutlet WMCardView *cardView;
@property (strong, nonatomic) WMCardArrayObject* cardArray;

@end

@implementation WMCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cardView.datasource =  self;
    _cardView.delegate = self;
    _cardArray = [[WMCardArrayObject alloc] initWMCardArrayObject];

    _cardView.cardViewTag = arc4random() % 54; // 取 0 ~ 53 之间的数
}

#pragma mark - Datasource

- (NSString*)cardViewCardType{
    return [[_cardArray.cardArray objectAtIndex:_cardView.cardViewTag] cardType];
}

- (UIColor*)cardViewCardColor {
    return [[_cardArray.cardArray objectAtIndex:_cardView.cardViewTag] cardColor];
}

- (NSString*)cardViewCardNumber {
    return [[_cardArray.cardArray objectAtIndex:_cardView.cardViewTag] cardNumber];
}

#pragma mark - Delegate

- (void)cardViewRotate {
    _cardView.cardViewTag = arc4random() % 54;
}

@end
