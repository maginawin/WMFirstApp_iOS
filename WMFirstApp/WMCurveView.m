//
//  WMCurveView.m
//  WMCurveView
//
//  Created by wangwendong on 15/5/9.
//  Copyright (c) 2015年 WM. All rights reserved.
//

#import "WMCurveView.h"

#define CURVE_MAX_X_SHOWS (20)
#define CURVE_LINE_WiDTH (2)

@interface WMCurveView()

@property (strong, nonatomic) NSMutableArray* leftPointsArray;
@property (strong, nonatomic) NSMutableArray* rightPointsArray;

@end

@implementation WMCurveView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {

    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)awakeFromNib {
    [self setupViews];
}

- (void)setupViews {
    _leftPath = [UIBezierPath bezierPath];
    _leftLayer = [CAShapeLayer layer];
    _leftLayer.frame = self.bounds;
    _leftLayer.fillColor = [UIColor clearColor].CGColor;
#warning left color set
    _leftLayer.strokeColor = [UIColor redColor].CGColor;
    _leftLayer.strokeStart = 0;
    _leftLayer.strokeEnd = 1.0;
    _leftLayer.lineWidth = CURVE_LINE_WiDTH;
    [self.layer addSublayer:_leftLayer];
    
    _rightPath = [UIBezierPath bezierPath];
    _rightLayer = [CAShapeLayer layer];
    _rightLayer.frame = self.bounds;
    _rightLayer.fillColor = [UIColor clearColor].CGColor;
#warning right color set
    _rightLayer.strokeColor = [UIColor blueColor].CGColor;
    _rightLayer.strokeStart = 0;
    _rightLayer.strokeEnd = 1.0;
    _rightLayer.lineWidth = CURVE_LINE_WiDTH;
    [self.layer addSublayer:_rightLayer];
}

- (void)strokeLeftCurveWithPointArray:(NSArray*)valueArray {
    [self strokeCurveWithPointArray:valueArray atLayer:_leftLayer withPath:_leftPath];
}

- (void)addLeftValue:(NSNumber*)value {
    [_leftPointsArray addObject:value];
    if (_leftPointsArray.count > CURVE_MAX_X_SHOWS) {
        [_leftPointsArray removeObjectsInRange:NSMakeRange(0, _leftPointsArray.count - CURVE_MAX_X_SHOWS)];
    }
    [self strokeLeftCurveWithPointArray:_leftPointsArray];
}

- (void)strokeRightCurveWithPointArray:(NSArray *)valueArray {
    [self strokeCurveWithPointArray:valueArray atLayer:_rightLayer withPath:_rightPath];
}

- (void)addRightValue:(NSNumber*)value {
    [_rightPointsArray addObject:value];
    if (_rightPointsArray.count > CURVE_MAX_X_SHOWS) {
        [_rightPointsArray removeObjectsInRange:NSMakeRange(0, _rightPointsArray.count - CURVE_MAX_X_SHOWS)];
    }
    [self strokeRightCurveWithPointArray:_rightPointsArray];
}

- (NSMutableArray*)pointArrayFromValueArray:(NSArray*)valueArray {
    NSMutableArray* result = [NSMutableArray array];
    if (valueArray) {
        for (int i = 0; i < valueArray.count; i++) {
            CGFloat x = self.bounds.size.width * i / (CURVE_MAX_X_SHOWS - 1);
            CGFloat y = self.bounds.size.height * (1 - [valueArray[i] floatValue]);
            NSValue* value = [NSValue valueWithCGPoint:CGPointMake(x, y)];
            [result addObject:value];
        }
    }
    if (result.count > CURVE_MAX_X_SHOWS) {
        [result subarrayWithRange:NSMakeRange(result.count - 20, 20)];
    }
    [result insertObject:result.firstObject atIndex:0];
    [result addObject:result.lastObject];
    return result;
}

- (void)strokeCurveWithPointArray:(NSArray *)valueArray atLayer:(CAShapeLayer*)aLayer withPath:(UIBezierPath*)aPath {
    dispatch_async(dispatch_get_main_queue(), ^ {
        if (valueArray) {
            if ([aLayer isEqual:_leftLayer]) {
                _leftPointsArray = [valueArray mutableCopy];
            } else if ([aLayer isEqual:_rightLayer]) {
                _rightPointsArray = [valueArray mutableCopy];
            } else {
                return;
            }
            NSMutableArray* newPointArray = [self pointArrayFromValueArray:valueArray];
            CGPoint startPoint = [newPointArray.firstObject CGPointValue];
            [aPath removeAllPoints];
            [aPath moveToPoint:startPoint];
            for (int i = 1; i < newPointArray.count - 2; i++) {
                CGPoint p0 = [newPointArray[i - 1] CGPointValue];
                CGPoint p1 = [newPointArray[i] CGPointValue];
                CGPoint p2 = [newPointArray[i + 1] CGPointValue];
                CGPoint p3 = [newPointArray[i + 2] CGPointValue];
                
                for (int i = 1; i < 50; i++) {
                    float t = (float) i * (1.0f / (float) 50);
                    float tt = t * t;
                    float ttt = tt * t;
                    
                    CGPoint pi;
                    // intermediate point
                    pi.x = 0.5 * (2*p1.x+(p2.x-p0.x)*t + (2*p0.x-5*p1.x+4*p2.x-p3.x)*tt + (3*p1.x-p0.x-3*p2.x+p3.x)*ttt);
                    pi.y = 0.5 * (2*p1.y+(p2.y-p0.y)*t + (2*p0.y-5*p1.y+4*p2.y-p3.y)*tt + (3*p1.y-p0.y-3*p2.y+p3.y)*ttt);
                    [aPath addLineToPoint:pi];
                }
                // Now add p2
                [aPath addLineToPoint:p2];
            }
            aLayer.path = aPath.CGPath;
        }
    });
}

@end
