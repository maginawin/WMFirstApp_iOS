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

@end

@implementation WMCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_cardView getWithCardType:@"♥︎" cardColor:[UIColor redColor] cardNumber:8];
}

@end
