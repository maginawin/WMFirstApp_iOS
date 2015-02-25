//
//  MenuViewController.h
//  WMFirstApp
//
//  Created by wangwendong on 15/2/25.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuViewControllerDelegate <NSObject>

@required

- (void)menuViewControllerMenu:(NSInteger)menuTag;

@end

@interface MenuViewController : UIViewController

@property (weak, nonatomic) id<MenuViewControllerDelegate> delegate;

@end
