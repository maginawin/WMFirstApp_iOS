//
//  WMColorfullCircleView.m
//  WMFirstApp
//
//  Created by wangwendong on 15/4/29.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import "WMColorfullCircleView.h"

#define DEGREES_TO_RADIANS(angle) (M_PI * (angle) / 180.0)
//#define CIRCLE_RADIUS 40
#define CIRCLE_LINE_WIDTH 4

@interface WMColorfullCircleView()

@property (strong, nonatomic) CAShapeLayer* progressLayer;

@end

@implementation WMColorfullCircleView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupInit];
    }
    return self;
}

- (void)setupInit {
    CGFloat radius = (self.frame.size.width / 2) - CIRCLE_LINE_WIDTH;
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height /2) radius:radius startAngle:DEGREES_TO_RADIANS(-90) endAngle:DEGREES_TO_RADIANS(270) clockwise:YES];
    
    CAShapeLayer* bgLayer = [CAShapeLayer layer];
    bgLayer.path = path.CGPath;
    bgLayer.strokeColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:0.5].CGColor;
    bgLayer.fillColor = [UIColor clearColor].CGColor;
    bgLayer.lineCap = kCALineCapButt;
    bgLayer.lineWidth = CIRCLE_LINE_WIDTH;
    bgLayer.strokeStart = 0;
    bgLayer.strokeEnd = 1.0;
//    [self.layer addSublayer:bgLayer];
    
    _progressLayer = [CAShapeLayer layer];
//    _progressLayer.frame = self.bounds;
    _progressLayer.fillColor = [UIColor clearColor].CGColor;
    _progressLayer.strokeColor = [UIColor whiteColor].CGColor;
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.lineWidth = CIRCLE_LINE_WIDTH;
    _progressLayer.path = path.CGPath;
    _progressLayer.strokeStart = 0;
    _progressLayer.strokeEnd = 1.0;
    
    CALayer* gradientLayer = [CALayer layer];
    CAGradientLayer* gradient0 = [CAGradientLayer layer];
    gradient0.frame = CGRectMake(0, 0, self.frame.size.width / 2, self.frame.size.height);
    [gradient0 setColors:[self colorsForLeft]];
    [gradient0 setStartPoint:CGPointMake(0.5, 0)];
    [gradient0 setEndPoint:CGPointMake(0.5, 0.98)];
    [gradientLayer addSublayer:gradient0];
    CAGradientLayer* gradient1 = [CAGradientLayer layer];
    gradient1.frame = CGRectMake(self.frame.size.width / 2, 0, self.frame.size.width /2, self.frame.size.height);
    [gradient1 setColors:[self colorsForRight]];
    [gradient1 setStartPoint:CGPointMake(0.5, 0)];
    [gradient1 setEndPoint:CGPointMake(0.5, 0.98)];
    [gradientLayer addSublayer:gradient1];
    
    [gradientLayer setMask:_progressLayer];
    [self.layer addSublayer:gradientLayer];
}

- (NSArray*)colorsForRight {
    NSMutableArray* colors = [NSMutableArray new];
    [colors addObject:(id)[UIColor colorWithRed:227/255.0 green:25/255.0 blue:18/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:233/255.0 green:75/255.0 blue:22/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:251/255.0 green:134/255.0 blue:21/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:244/255.0 green:192/255.0 blue:28/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:220/255.0 green:210/255.0 blue:67/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:182/255.0 green:211/255.0 blue:56/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:140/255.0 green:195/255.0 blue:45/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:108/255.0 green:185/255.0 blue:45/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:76/255.0 green:177/255.0 blue:52/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:75/255.0 green:179/255.0 blue:85/255. alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:71/255.0 green:183/255.0 blue:138/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:60/255.0 green:198/255.0 blue:201/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:76/255.0 green:184/255.0 blue:234/255.0 alpha:1].CGColor];
    return colors;
}

- (NSArray*)colorsForLeft {
    NSMutableArray* colors = [NSMutableArray new];
    [colors addObject:(id)[UIColor colorWithRed:227/255.0 green:25/255.0 blue:18/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:242/255.0 green:5/255.0 blue:75/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:242/255.0 green:9/255.0 blue:137/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:242/255.0 green:10/255.0 blue:182/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:241/255.0 green:13/255.0 blue:222/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:187/255.0 green:7/255.0 blue:216/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:133/255.0 green:0 blue:211/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:66/255.0 green:1/255.0 blue:193/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:29/255.0 green:43/255.0 blue:222/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:13/255.0 green:69/255.0 blue:216/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:37/255.0 green:122/255.0 blue:228/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:53/255.0 green:163/255.0 blue:240/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:76/255.0 green:184/255.0 blue:234/255.0 alpha:1].CGColor];
    return colors;
}

- (void)updateCurrentProgress:(CGFloat)currentProgress {
    _currentProgress = currentProgress;
    NSLog(@"progress %.2f", currentProgress);
    _progressLayer.strokeEnd = currentProgress;
}

@end
