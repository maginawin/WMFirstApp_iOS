//
//  ViewController.m
//  WMFirstApp
//
//  Created by wangwendong on 15/2/4.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *menuButton;
@property (nonatomic) BOOL menuOpen;
@property (weak, nonatomic) IBOutlet UIView *blueButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)menuClick:(id)sender {
    if (!self.menuOpen) {
        [self menuButtonOpen];
        self.menuOpen = YES;
        [self openBlueButtonRotate:YES];
    } else {
        [self menuButtonClose];
        self.menuOpen = NO;
        [self openBlueButtonRotate:NO];
    }
}

- (void)setVariate {
    self.menuOpen = NO;
}

#pragma mark - Tool

- (void)menuButtonOpen {
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D fromValue = _menuButton.layer.transform;
    animation.removedOnCompletion = YES;
    CATransform3D toValue = CATransform3DRotate(fromValue, M_PI_4, 0, 0, 1);
    animation.fromValue = [NSValue valueWithCATransform3D:fromValue];
    animation.toValue = [NSValue valueWithCATransform3D:toValue];
    animation.duration = 0.1;
    animation.repeatCount = 3;
    _menuButton.layer.transform = toValue;
    [_menuButton.layer addAnimation:animation forKey:nil];
}

- (void)menuButtonClose {
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D fromValue = _menuButton.layer.transform;
    CATransform3D toValue = CATransform3DRotate(fromValue, -M_PI_4, 0, 0, 1);
    animation.fromValue = [NSValue valueWithCATransform3D:fromValue];
    animation.toValue = [NSValue valueWithCATransform3D:toValue];
    animation.duration = 0.1f;
    animation.repeatCount = 3;
    animation.removedOnCompletion = YES;
    _menuButton.layer.transform = toValue;
    [_menuButton.layer addAnimation:animation forKey:nil];
}

// Blue button
- (void)openBlueButtonRotate:(BOOL)open {
    CABasicAnimation* animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    CATransform3D fromValue = _blueButton.layer.transform;
    CATransform3D toValue = CATransform3DRotate(fromValue, 2 * M_PI_4, 0, 0, 1);
    animation.fromValue = [NSValue valueWithCATransform3D:fromValue];
    animation.toValue = [NSValue valueWithCATransform3D:toValue];
    animation.duration = 0.4;
    animation.repeatCount = 100000;
    animation.removedOnCompletion = YES;
    if (open) {
        _blueButton.layer.transform = toValue;
        [_blueButton.layer addAnimation:animation forKey:nil];
    } else {
        [_blueButton.layer removeAllAnimations];
    }
}

@end
