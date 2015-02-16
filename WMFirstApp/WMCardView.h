//
//  WMCardView.h
//  WMFirstApp
//
//  Created by wangwendong on 15/2/16.
//  Copyright (c) 2015年 wangwendong. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WMCardViewDatasource <NSObject>

@required

- (NSString*)cardViewCardType;
- (UIColor*)cardViewCardColor;
- (NSString*)cardViewCardNumber;



@end

@protocol WMCardViewDelegate <NSObject>

@required
- (void)cardViewRotate;

@end

@interface WMCardView : UIView

@property (weak, nonatomic) id<WMCardViewDatasource> datasource;
@property (weak, nonatomic) id<WMCardViewDelegate> delegate;

@property (nonatomic) NSInteger cardViewTag;

//+ (id)sharedInstance;

- (void)getNewCardView;

@end
