//
//  ICSearchImageHeadView.h
//  ImageChat
//
//  Created by FigureWang on 17/1/13.
//  Copyright © 2017年 Long. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, ViewContentType) {
    ViewContentTypeHistory,
    ViewContentTypeSuggestion,
};

@interface ICSearchImageHeadView : UIView

@property (nonatomic, assign) ViewContentType contentType;

@end
