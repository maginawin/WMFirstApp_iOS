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
- (NSString*)cardViewCardType:(NSInteger)cardViewTag;
- (UIColor*)cardViewCardColor:(NSInteger)cardViewTag;
- (NSString*)cardViewCardNumber:(NSInteger)cardViewTag;

@end

@protocol WMCardViewDelegate <NSObject>

@required
- (void)cardViewRotateTag:(NSInteger)cardViewTag;

@end

@interface WMCardView : UIView

@property (weak, nonatomic) id<WMCardViewDatasource> datasource;
@property (weak, nonatomic) id<WMCardViewDelegate> delegate;

//+ (id)sharedInstance;

@property (nonatomic) NSInteger cardViewNumber;

- (void)getNewCardView;

@end
