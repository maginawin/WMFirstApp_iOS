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
        _progressLayer.strokeEnd = 0.777;
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
    self.backgroundColor = [UIColor lightGrayColor];
    CGFloat radius = (self.frame.size.width / 2) - CIRCLE_LINE_WIDTH;
    UIBezierPath* path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.bounds.size.width / 2, self.bounds.size.height /2) radius:radius startAngle:DEGREES_TO_RADIANS(-90) endAngle:DEGREES_TO_RADIANS(270) clockwise:YES];
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
    [gradient0 setEndPoint:CGPointMake(0.5, 1)];
    [gradientLayer addSublayer:gradient0];
    CAGradientLayer* gradient1 = [CAGradientLayer layer];
    gradient1.frame = CGRectMake(self.frame.size.width / 2, 0, self.frame.size.width /2, self.frame.size.height);
    [gradient1 setColors:[self colorsForRight]];
    [gradient1 setStartPoint:CGPointMake(0.5, 0)];
    [gradient1 setEndPoint:CGPointMake(0.5, 1)];
    [gradientLayer addSublayer:gradient1];
    
    [gradientLayer setMask:_progressLayer];
    [self.layer addSublayer:gradientLayer];
//    [self.layer addSublayer:_progressLayer];
}

- (NSArray*)colorsForRight {
    NSMutableArray* colors = [NSMutableArray new];
    [colors addObject:(id)[UIColor colorWithRed:243/255.0 green:6/255.0 blue:0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:247/255.0 green:73/255.0 blue:10/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:251/255.0 green:134/255.0 blue:21/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:244/255.0 green:192/255.0 blue:28/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:234/255.0 green:251/255.0 blue:38/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:191/255.0 green:241/255.0 blue:22/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:134/255.0 green:237/255.0 blue:0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:78/255.0 green:231/255.0 blue:0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:49/255.0 green:200/255.0 blue:0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:52/255.0 green:201/255.0 blue:83/255. alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:56/255.0 green:200/255.0 blue:147/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:60/255.0 green:198/255.0 blue:201/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:0 green:160/255.0 blue:233/255.0 alpha:1].CGColor];
    return colors;
}

- (NSArray*)colorsForLeft {
    NSMutableArray* colors = [NSMutableArray new];
    [colors addObject:(id)[UIColor colorWithRed:243/255.0 green:6/255.0 blue:0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:242/255.0 green:5/255.0 blue:75/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:242/255.0 green:9/255.0 blue:137/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:242/255.0 green:10/255.0 blue:182/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:241/255.0 green:13/255.0 blue:222/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:187/255.0 green:7/255.0 blue:216/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:133/255.0 green:0 blue:211/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:66/255.0 green:1/255.0 blue:193/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:0 green:0 blue:122/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:13/255.0 green:69/255.0 blue:216/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:37/255.0 green:122/255.0 blue:228/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:53/255.0 green:163/255.0 blue:240/255.0 alpha:1].CGColor];
    [colors addObject:(id)[UIColor colorWithRed:0 green:160/255.0 blue:233/255.0 alpha:1].CGColor];
return colors;
}

@end
