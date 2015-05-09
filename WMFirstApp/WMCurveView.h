//
//  WMCurveView.h
//  WMCurveView
//
//  Created by wangwendong on 15/5/9.
//  Copyright (c) 2015年 WM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WMCurveView : UIView

@property (strong, nonatomic) UIBezierPath* leftPath;
@property (strong, nonatomic) CAShapeLayer* leftLayer;

- (void)strokeLeftCurveWithPointArray:(NSArray*)valueArray;

- (void)addLeftValue:(NSNumber*)value;

@property (strong, nonatomic) UIBezierPath* rightPath;
@property (strong, nonatomic) CAShapeLayer* rightLayer;

- (void)strokeRightCurveWithPointArray:(NSArray*)valueArray;

- (void)addRightValue:(NSNumber*)value;

@end
