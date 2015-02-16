//
//  WMCardView.m
//  WMFirstApp
//
//  Created by wangwendong on 15/2/16.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import "WMCardView.h"

#define SELF_WIDTH self.bounds.size.width
#define SELF_HEIGHT self.bounds.size.height

@interface WMCardView()

@property (nonatomic, strong) UILabel* cardTypeLabel;
@property (nonatomic, strong) UILabel* cardNumberLabel;
@property (nonatomic, strong) UIButton* cardButton;
@property (nonatomic, strong) UIView* backgroudView;
@property (nonatomic) BOOL isShow;

@end

@implementation WMCardView
static id sharedInstance;

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self addBorder];
        [self addCardViewLabel];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addBorder];
        [self addCardViewLabel];
    }
    return self;
}
//
//+ (id)sharedInstance {
//    if (!sharedInstance) {
//        sharedInstance = [super init];
//    }
//    return sharedInstance;
//}

- (void)getNewCardView {
    
}

#pragma mark - Tools

- (void)addBorder {
    self.layer.cornerRadius = 6.0f;
    self.layer.masksToBounds = YES;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1;
}

- (void)addCardViewLabel {
//    if (!_cardTypeLabel) {
        _cardTypeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SELF_WIDTH, SELF_HEIGHT / 2)];
        _cardTypeLabel.textAlignment = NSTextAlignmentCenter;
        _cardTypeLabel.font = [UIFont systemFontOfSize:32];
        [self addSubview:_cardTypeLabel];
//    }
//    if (!_cardNumberLabel) {
        _cardNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, SELF_HEIGHT / 2, SELF_WIDTH, SELF_HEIGHT / 2)];
        _cardNumberLabel.textAlignment = NSTextAlignmentCenter;
        _cardNumberLabel.textColor = [UIColor darkTextColor];
        _cardNumberLabel.font = [UIFont systemFontOfSize:24];
        [self addSubview:_cardNumberLabel];
        
        _backgroudView = [[UIView alloc] initWithFrame:self.bounds];
        _backgroudView.backgroundColor = [UIColor greenColor];
        [self addSubview:_backgroudView];
        
        _cardButton = [[UIButton alloc] initWithFrame:self.bounds];
        _cardButton.backgroundColor = [UIColor clearColor];
        [_cardButton addTarget:self action:@selector(handleCardClick:) forControlEvents:UIControlEventTouchUpInside];
        _isShow = NO;
    [self addSubview:_cardButton];
    self.cardViewTag = 1;
//    }
}

- (void)handleCardClick:(id)sender {
     NSLog(@"click");
    _isShow = !_isShow;
    [self rotateClick:_isShow];
}

- (void)rotateClick:(BOOL)isShow {
    CATransition* transition = [CATransition animation];
    transition.duration = 0.6;
    transition.type = @"oglFlip";
    transition.subtype = kCATransitionFromLeft;
    if (_isShow) {
        [_delegate cardViewRotate];
        [self addCardTypeLabel:[_datasource cardViewCardType] cardColor:[_datasource cardViewCardColor] AndCardNumberLabel:[_datasource cardViewCardNumber]];
        _backgroudView.hidden = YES;
    } else {
        _backgroudView.hidden = NO;
    }
    [self.layer addAnimation:transition forKey:nil];
}

- (void)addCardTypeLabel:(NSString*)cardType cardColor:(UIColor*)cardColor AndCardNumberLabel:(NSString*)cardNumber {
    
    _cardTypeLabel.text = cardType;
    _cardTypeLabel.textColor = cardColor;
    
    _cardNumberLabel.text = cardNumber;
}

@end
