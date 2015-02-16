//
//  WMCardView.h
//  WMFirstApp
//
//  Created by wangwendong on 15/2/16.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMCardView : UIView

//+ (id)sharedInstance;

- (void)getWithCardType:(NSString*)cardType cardColor:(UIColor*)cardColor cardNumber:(NSInteger)cardNumber;

@end
