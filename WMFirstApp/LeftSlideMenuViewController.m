//
//  LeftSlideMenuViewController.m
//  WMFirstApp
//
//  Created by wangwendong on 15/2/21.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import "LeftSlideMenuViewController.h"

@interface LeftSlideMenuViewController ()

@property (nonatomic, strong) MenuViewController* menuVC;
@property (nonatomic, strong) Content01ViewController* content01VC;
@property (weak, nonatomic) IBOutlet UIView *menuView;
@property (nonatomic, strong) UIView* contentView;

@end

@implementation LeftSlideMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIStoryboard* sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    _menuVC = [sb instantiateViewControllerWithIdentifier:@"idMenuVC"];
    _menuVC.view.frame = self.view.bounds;
    _menuVC.delegate = self;
//    [self.view addSubview:_menuVC.view];
    
    _content01VC = [sb instantiateViewControllerWithIdentifier:@"idContent01VC"];
    
    _contentView = [[UIView alloc] init];
    _contentView = _menuVC.view;
    [self.view addSubview:_contentView];
}

#pragma mark - delegate

- (void)menuViewControllerMenu:(NSInteger)menuTag {
    if (menuTag == 0) {
        if (_contentView != _menuVC.view) {
            _contentView = _menuVC.view;
        }
    } else if (menuTag == 1) {
        NSLog(@"menu 02");
        [_content01VC removeFromParentViewController];
        _contentView = _content01VC.view;
        [self.view addSubview:_contentView];
    } else if (menuTag == 2) {
    
    }
}

@end
