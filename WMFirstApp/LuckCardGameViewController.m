//
//  LuckCardGameViewController.m
//  WMFirstApp
//
//  Created by wangwendong on 15/2/18.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import "LuckCardGameViewController.h"

@interface LuckCardGameViewController ()

@property (strong, nonatomic) IBOutletCollection(CardView) NSArray *cardView;

@end

@implementation LuckCardGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[CardObject shardInstance] refreshCard];
    [self setupCardView];
}

#pragma mark - IBAction

- (IBAction)refreshClick:(id)sender {
    [self refreshAllCardView];
}

#pragma mark - Tool

- (void)setupCardView {
    for (int i = 0; i < _cardView.count; i++) {
        Card* card = [[CardObject shardInstance] getARandomCard];
        [[_cardView objectAtIndex:i] setCard:card];
        if (!(i % 5) == 0) {
            [[_cardView objectAtIndex:i] show];
        } else {
            [[_cardView objectAtIndex:i] hidden];
        }
    }
}

- (void)refreshAllCardView {
    [[CardObject shardInstance] refreshCard];
    [self setupCardView];
}

@end
