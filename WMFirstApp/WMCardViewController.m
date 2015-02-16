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
@property (weak, nonatomic) IBOutlet WMCardView *cardView1;
@property (weak, nonatomic) IBOutlet WMCardView *cardView2;
@property (weak, nonatomic) IBOutlet WMCardView *cardView3;

@property (strong, nonatomic) NSMutableArray* hasCardArray;

@property (strong, nonatomic) WMCardArrayObject* cardArray;

@end

@implementation WMCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cardView.datasource =  self;
    _cardView.delegate = self;
    _cardView.tag = 0;
    
    _cardView1.datasource = self;
    _cardView1.delegate = self;
    _cardView1.tag = 1;
    
    _cardView2.datasource = self;
    _cardView2.delegate = self;
    _cardView2.tag = 2;
    
    _cardView3.datasource = self;
    _cardView3.delegate = self;
    _cardView3.tag = 3;
    
    _hasCardArray = [[NSMutableArray alloc] init];
    [_hasCardArray addObject:[NSNumber numberWithInteger:_cardView.cardViewNumber]];
    [_hasCardArray addObject:[NSNumber numberWithInteger:_cardView1.cardViewNumber]];
    [_hasCardArray addObject:[NSNumber numberWithInteger:_cardView2.cardViewNumber]];
    [_hasCardArray addObject:[NSNumber numberWithInteger:_cardView3.cardViewNumber]];
    _cardArray = [[WMCardArrayObject alloc] initWMCardArrayObject];

    _cardView.cardViewNumber = arc4random() % 54; // 取 0 ~ 53 之间的数
}

#pragma mark - Datasource

- (NSString*)cardViewCardType:(NSInteger)cardViewTag {
    NSString* result = [[NSString alloc] init];
    if (cardViewTag == 0) {
        result = [[_cardArray.cardArray objectAtIndex:_cardView.cardViewNumber] cardType];
    } else if (cardViewTag == 1) {
        result = [[_cardArray.cardArray objectAtIndex:_cardView1.cardViewNumber] cardType];
    } else if (cardViewTag == 2) {
        result = [[_cardArray.cardArray objectAtIndex:_cardView2.cardViewNumber] cardType];
    } else if (cardViewTag == 3) {
        result = [[_cardArray.cardArray objectAtIndex:_cardView3.cardViewNumber] cardType];
    }
    return result;
}

- (UIColor*)cardViewCardColor:(NSInteger)cardViewTag {
    UIColor* result = [[UIColor alloc] init];
    if (cardViewTag == 0) {
        result = [[_cardArray.cardArray objectAtIndex:_cardView.cardViewNumber] cardColor];
    } else if (cardViewTag == 1) {
        result = [[_cardArray.cardArray objectAtIndex:_cardView1.cardViewNumber] cardColor];
    } else if (cardViewTag == 2) {
        result = [[_cardArray.cardArray objectAtIndex:_cardView2.cardViewNumber] cardColor];
    } else if (cardViewTag == 3) {
        result = [[_cardArray.cardArray objectAtIndex:_cardView3.cardViewNumber] cardColor];
    }
    return result;

}

- (NSString*)cardViewCardNumber:(NSInteger)cardViewTag {
    NSString* result = [[NSString alloc] init];
    if (cardViewTag == 0) {
        result = [[_cardArray.cardArray objectAtIndex:_cardView.cardViewNumber] cardNumber];
    } else if (cardViewTag == 1) {
        result = [[_cardArray.cardArray objectAtIndex:_cardView1.cardViewNumber] cardNumber];
    } else if (cardViewTag == 2) {
        result = [[_cardArray.cardArray objectAtIndex:_cardView2.cardViewNumber] cardNumber];
    } else if (cardViewTag == 3) {
        result = [[_cardArray.cardArray objectAtIndex:_cardView3.cardViewNumber] cardNumber];
    }
    return result;
}

#pragma mark - Delegate

- (void)cardViewRotateTag:(NSInteger)cardViewTag {
    NSInteger temp = arc4random() % 54;
    while ([_hasCardArray containsObject:[NSNumber numberWithInteger:temp]]) {
        temp = arc4random() % 54;
    }
    if (cardViewTag == 0) {
        _cardView.cardViewNumber = temp;
    } else if (cardViewTag == 1) {
        _cardView1.cardViewNumber = temp;
    } else if (cardViewTag == 2) {
        _cardView2.cardViewNumber = temp;
    } else if (cardViewTag == 3) {
        _cardView3.cardViewNumber = temp;
    }
}

@end
