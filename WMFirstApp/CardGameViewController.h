//
//  CardGameViewController.h
//  WMFirstApp
//
//  Created by wangwendong on 15/2/17.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardView.h"
#import "CardObject.h"

@interface CardGameViewController : UIViewController <CardObjectDelegate, CardViewDelegate, UIAlertViewDelegate>

@end
