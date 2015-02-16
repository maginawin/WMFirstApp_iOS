//
//  WMCardObject.h
//  WMFirstApp
//
//  Created by wangwendong on 15/2/16.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WMCardObject : NSObject

@property (strong, nonatomic) NSString* cardType;
@property (strong, nonatomic) UIColor* cardColor;
@property (nonatomic, strong) NSString* cardNumber;

@end
