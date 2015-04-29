//
//  Content01ViewController.m
//  WMFirstApp
//
//  Created by wangwendong on 15/2/25.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import "Content01ViewController.h"
#import "WMColorfullCircleView.h"
#import "math.h"

@interface Content01ViewController ()
@property (weak, nonatomic) IBOutlet WMColorfullCircleView *mProgress;

@end

@implementation Content01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)randomCurrentProgress:(id)sender {
    float randomCurrent = (double)arc4random() / 0x100000000;
    NSLog(@"current %.2f",randomCurrent);
    [_mProgress updateCurrentProgress:randomCurrent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
