//
//  ICMeTableHeadView.h
//  ImageChat
//
//  Created by FigureWang on 17/1/18.
//  Copyright © 2017年 Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ICMeTableHeadView;
@protocol ICMeTableHeadViewDelegate <NSObject>

- (void)ICMeTableHeadView:(ICMeTableHeadView*)headView buttonAction:(UIButton*)sender;

@end

@interface ICMeTableHeadView : UIView

@property (nonatomic, weak) id<ICMeTableHeadViewDelegate> delegate;
- (void)switchToLoginState;

@end
