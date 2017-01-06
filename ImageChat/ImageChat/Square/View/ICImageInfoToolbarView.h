//
//  ICImageInfoToolbarView.h
//  ImageChat
//
//  Created by FigureWang on 17/1/5.
//  Copyright © 2017年 Long. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ImageInfoToolbarActionType) {
    ImageInfoToolbarActionTypeCollect = 0,
    ImageInfoToolbarActionTypeDownload,
    ImageInfoToolbarActionTypeDelete,
    ImageInfoToolbarActionTypeShare
};

@class ICImageInfoToolbarView;
@protocol ICImageInfoToolbarViewDelegate <NSObject>

- (void)ICImageInfoToolbarView:(ICImageInfoToolbarView*)toolbarView didTouched:(ImageInfoToolbarActionType)actionType;

@end


@interface ICImageInfoToolbarView : UIView

@property (nonatomic, weak) id<ICImageInfoToolbarViewDelegate> delegate;


@end
