//
//  CardGameViewController.m
//  WMFirstApp
//
//  Created by wangwendong on 15/2/17.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import "CardGameViewController.h"

@interface CardGameViewController ()

@property (strong, nonatomic) CardView* firstCard;
@property (strong, nonatomic) CardView* secondCard;

@property (nonatomic) NSInteger cardScore;

@property (weak, nonatomic) IBOutlet CardView *cardView0;
@property (weak, nonatomic) IBOutlet CardView *cardView1;
@property (weak, nonatomic) IBOutlet CardView *cardView2;
@property (weak, nonatomic) IBOutlet CardView *cardView3;
@property (weak, nonatomic) IBOutlet CardView *cardView4;

@property (weak, nonatomic) IBOutlet CardView *cardView5;
@property (weak, nonatomic) IBOutlet CardView *cardView6;
@property (weak, nonatomic) IBOutlet CardView *cardView7;
@property (weak, nonatomic) IBOutlet CardView *cardView8;
@property (weak, nonatomic) IBOutlet CardView *cardView9;

@property (weak, nonatomic) IBOutlet CardView *cardView10;
@property (weak, nonatomic) IBOutlet CardView *cardView11;
@property (weak, nonatomic) IBOutlet CardView *cardView12;
@property (weak, nonatomic) IBOutlet CardView *cardView13;
@property (weak, nonatomic) IBOutlet CardView *cardView14;

@property (weak, nonatomic) IBOutlet CardView *cardView15;
@property (weak, nonatomic) IBOutlet CardView *cardView16;
@property (weak, nonatomic) IBOutlet CardView *cardView17;
@property (weak, nonatomic) IBOutlet CardView *cardView18;
@property (weak, nonatomic) IBOutlet CardView *cardView19;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *historyScoreLabel;

@end

@implementation CardGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _cardScore = 0;
    _historyScoreLabel.text = @"0";
    _scoreLabel.text = @"0";
    [CardObject shardInstance].delegate = self;
    [self setupCardView];
}

- (void)setupCardView {
    Card* card0 = [[CardObject shardInstance] getARandomCard];
    [_cardView0 setCard:card0];
    _cardView0.tag = 0;
    _cardView0.delegate = self;
    [_cardView1 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView1.tag = 1;
    _cardView1.delegate = self;
    [_cardView2 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView2.tag = 2;
    _cardView2.delegate = self;
    [_cardView3 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView3.tag = 3;
    _cardView3.delegate = self;
    [_cardView4 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView4.tag = 4;
    _cardView4.delegate = self;
    [_cardView5 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView5.tag = 5;
    _cardView5.delegate = self;
    [_cardView6 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView6.tag = 6;
    _cardView6.delegate = self;
    [_cardView7 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView7.tag = 7;
    _cardView7.delegate = self;
    [_cardView8 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView8.tag = 8;
    _cardView8.delegate = self;
    [_cardView9 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView9.tag = 9;
    _cardView9.delegate = self;
    [_cardView10 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView10.tag = 10;
    _cardView10.delegate = self;
    [_cardView11 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView11.tag = 11;
    _cardView11.delegate = self;
    [_cardView12 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView12.tag = 12;
    _cardView12.delegate = self;
    [_cardView13 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView13.tag = 13;
    _cardView13.delegate = self;
    [_cardView14 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView14.tag = 14;
    _cardView14.delegate = self;
    [_cardView15 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView15.tag = 15;
    _cardView15.delegate = self;
    [_cardView16 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView16.tag = 16;
    _cardView16.delegate = self;
    [_cardView17 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView17.tag = 17;
    _cardView17.delegate = self;
    [_cardView18 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView18.tag = 18;
    _cardView18.delegate = self;
    [_cardView19 setCard:[[CardObject shardInstance] getARandomCard]];
    _cardView19.tag = 19;
    _cardView19.delegate = self;
}

#pragma mark - Delegate

- (void)cardObjectNoCard {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"注意" message:@"没有多余的底牌了!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:@"洗牌", nil];
    alert.alertViewStyle = UIAlertViewStyleDefault;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [[CardObject shardInstance] refreshCard];
    }
}

- (void)cardViewShow:(NSInteger)cardViewTag {
    switch (cardViewTag) {
        case 0: {
            [self setFirstAndSceondCardView:_cardView0];
            break;
        }
        case 1: {
            [self setFirstAndSceondCardView:_cardView1];
            break;
        }
        case 2: {
            [self setFirstAndSceondCardView:_cardView2];
            break;
        }
        case 3: {
            [self setFirstAndSceondCardView:_cardView3];
            break;
        }
        case 4: {
            [self setFirstAndSceondCardView:_cardView4];
            break;
        }
        case 5: {
            [self setFirstAndSceondCardView:_cardView5];
            break;
        }
        case 6: {
            [self setFirstAndSceondCardView:_cardView6];
            break;
        }
        case 7: {
            [self setFirstAndSceondCardView:_cardView7];
            break;
        }
        case 8: {
            [self setFirstAndSceondCardView:_cardView8];
            break;
        }
        case 9: {
            [self setFirstAndSceondCardView:_cardView9];
            break;
        }
        case 10: {
            [self setFirstAndSceondCardView:_cardView10];
            break;
        }
        case 11: {
            [self setFirstAndSceondCardView:_cardView11];
            break;
        }
        case 12: {
            [self setFirstAndSceondCardView:_cardView12];
            break;
        }
        case 13: {
            [self setFirstAndSceondCardView:_cardView13];
            break;
        }
        case 14: {
            [self setFirstAndSceondCardView:_cardView14];
            break;
        }
        case 15: {
            [self setFirstAndSceondCardView:_cardView15];
            break;
        }
        case 16: {
            [self setFirstAndSceondCardView:_cardView16];
            break;
        }
        case 17: {
            [self setFirstAndSceondCardView:_cardView17];
            break;
        }
        case 18: {
            [self setFirstAndSceondCardView:_cardView18];
            break;
        }
        case 19: {
            [self setFirstAndSceondCardView:_cardView19];
            break;
        }
        default:
            
            break;
    }
}

- (void)cardViewHidden:(NSInteger)cardViewTag {
    _firstCard = nil;
    switch (cardViewTag) {
        case 0: {

            break;
        }
        case 1: {

            break;
        }
        case 2: {

            break;
        }
        case 3: {

            break;
        }
        case 4: {

            break;
        }
        case 5: {
            
            break;
        }
        case 6: {
            
            break;
        }
        case 7: {
            
            break;
        }
        case 8: {
            
            break;
        }
        case 9: {
            
            break;
        }
        case 10: {
            
            break;
        }
        case 11: {
            
            break;
        }
        case 12: {
            
            break;
        }
        case 13: {
            
            break;
        }
        case 14: {
            
            break;
        }
        case 15: {
            
            break;
        }
        case 16: {
            
            break;
        }
        case 17: {
            
            break;
        }
        case 18: {
            
            break;
        }
        case 19: {
            
            break;
        }
        default:
            break;
    }
}

#pragma mark - IBAction

- (IBAction)refreshCardClick:(id)sender {
    [[CardObject shardInstance] refreshCard];
    
    _historyScoreLabel.text = [NSString stringWithFormat:@"%d", (int)_cardScore];
    _scoreLabel.text = @"0";
    _cardScore = 0;
    
    [_cardView0 hidden];
    [_cardView1 hidden];
    [_cardView2 hidden];
    [_cardView3 hidden];
    [_cardView4 hidden];
    [_cardView5 hidden];
    [_cardView6 hidden];
    [_cardView7 hidden];
    [_cardView8 hidden];
    [_cardView9 hidden];
    [_cardView10 hidden];
    [_cardView11 hidden];
    [_cardView12 hidden];
    [_cardView13 hidden];
    [_cardView14 hidden];
    [_cardView15 hidden];
    [_cardView16 hidden];
    [_cardView17 hidden];
    [_cardView18 hidden];
    [_cardView19 hidden];
    
    [self setupCardView];
}

#pragma mark - Tool

- (void)setFirstAndSceondCardView:(CardView*)tempCard {
    if (!_firstCard) {
        _firstCard = tempCard;
    } else {
        if (![_firstCard isEqual:tempCard]) {
            if ([tempCard.cardNumber.text isEqual:_firstCard.cardNumber.text]) {
                _cardScore += 3;
            } else if ([tempCard.cardType.text isEqual:_firstCard.cardType.text]) {
                _cardScore += 1;
            } else {
                _cardScore -= 2;
            }
            [_firstCard clickBtnNotEnable];
            [tempCard clickBtnNotEnable];
            _firstCard = nil;
            _scoreLabel.text = [NSString stringWithFormat:@"%d", (int)_cardScore];
        }
    }
}

@end
