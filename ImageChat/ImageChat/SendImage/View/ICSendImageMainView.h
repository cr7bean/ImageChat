//
//  ICSendImageMainView.h
//  ImageChat
//
//  Created by FigureWang on 17/1/17.
//  Copyright © 2017年 Long. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SendImageButtonType) {
    SendImageButtonTypeClose = 0,
    SendImageButtonTypeCapture,
    SendImageButtonTypeAlbum,
};


@class ICSendImageMainView;
@protocol  ICSendImageMainViewDelegate <NSObject>

- (void)SendImageMainView:(ICSendImageMainView*)view buttonActionType:(SendImageButtonType)actionType;

@end


@interface ICSendImageMainView : UIView

@property (nonatomic, weak) id<ICSendImageMainViewDelegate> delegate;

@end
