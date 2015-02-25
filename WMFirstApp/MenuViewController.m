//
//  MenuViewController.m
//  WMFirstApp
//
//  Created by wangwendong on 15/2/25.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)menu01Click:(id)sender {
    [_delegate menuViewControllerMenu:0];
}
- (IBAction)menu02Click:(id)sender {
    [_delegate menuViewControllerMenu:1];
}
- (IBAction)menu03Click:(id)sender {
    [_delegate menuViewControllerMenu:2];
}
@end
