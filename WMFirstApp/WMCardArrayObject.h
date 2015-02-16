//
//  WMCardArrayObject.h
//  WMFirstApp
//
//  Created by wangwendong on 15/2/16.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WMCardObject.h"

@interface WMCardArrayObject : NSObject

@property (nonatomic, strong) NSMutableArray* cardArray;

- (WMCardArrayObject*)initWMCardArrayObject;

@end
