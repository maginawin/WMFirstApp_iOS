//
//  Card.h
//  WMFirstApp
//
//  Created by wangwendong on 15/2/17.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Card : NSObject

@property (nonatomic, strong) NSString* cardType;

@property (nonatomic, strong) UIColor* cardColor;

@property (nonatomic, strong) NSString* cardNumber;

@end
