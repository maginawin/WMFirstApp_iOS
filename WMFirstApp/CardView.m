//
//  CardView.m
//  WMFirstApp
//
//  Created by wangwendong on 15/2/17.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import "CardView.h"

@interface CardView()

@property (nonatomic, strong) UIView* backgroundView;
@property (nonatomic, strong) UIButton* clickBtn;

@end

@implementation CardView

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setDefault];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setDefault];
    }
    return self;
}

- (void)setDefault {
    [self setBackground];
    _isShow = NO;
    [self setupCardLabel];
}

- (void)setBackground {
    self.layer.cornerRadius = 4.0;
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor whiteColor];
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.0;
    
    _backgroundView = [[UIView alloc] initWithFrame:self.bounds];
    _backgroundView.backgroundColor = [UIColor greenColor];
    _backgroundView.layer.zPosition = 1000.0;
    [self addSubview:_backgroundView];
    
    _clickBtn = [[UIButton alloc] initWithFrame:self.bounds];
    _clickBtn.layer.zPosition = 2000.0;
    _clickBtn.backgroundColor = [UIColor clearColor];
    [_clickBtn addTarget:self action:@selector(handleClickBtn) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_clickBtn];
    
}

- (void)handleClickBtn {
    _isShow = !_isShow;
    if (_isShow) {
        [self show];
        [_delegate cardViewShow:self.tag];
    } else {
        [self hidden];
        [_delegate cardViewHidden:self.tag];
    }
}

- (void)setupCardLabel {
    _cardType = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height / 2)];
    _cardType.font = [UIFont systemFontOfSize:32];
    _cardType.textAlignment = NSTextAlignmentCenter;
    _cardType.layer.zPosition = 500.0;
    [self addSubview:_cardType];
    
    _cardNumber = [[UILabel alloc] initWithFrame:CGRectMake(0, self.bounds.size.height / 2, self.bounds.size.width, self.bounds.size.height / 2)];
    _cardNumber.font = [UIFont systemFontOfSize:18];
    _cardNumber.textColor = [UIColor blackColor];
    _cardNumber.textAlignment = NSTextAlignmentCenter;
    _cardNumber.layer.zPosition = 500.0;
    [self addSubview:_cardNumber];
}

- (void)setCard:(Card*)card {
    _cardType.textColor = card.cardColor;
    _cardType.text = card.cardType;
    
    _cardNumber.text = card.cardNumber;
    
    [_clickBtn setEnabled:YES];
}

- (void)show {
    CATransition* transition = [CATransition animation];
    transition.duration = 0.3;
    transition.type = @"oglFlip";
    transition.subtype = kCATransitionFromRight;
    [self.layer addAnimation:transition forKey:nil];
    _backgroundView.hidden = YES;
    _isShow = YES;
}

- (void)hidden {
    CATransition* transition = [CATransition animation];
    transition.duration = 0.2;
    transition.type = @"oglFlip";
    transition.subtype = kCATransitionFromLeft;
    [self.layer addAnimation:transition forKey:nil];
    _backgroundView.hidden = NO;
    _isShow = NO;
    
}

- (void)clickBtnNotEnable {
    [_clickBtn setEnabled:NO];
}

@end
