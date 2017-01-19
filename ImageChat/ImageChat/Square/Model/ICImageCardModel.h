//
//  ICImageCardModel.h
//  ImageChat
//
//  Created by FigureWang on 17/1/4.
//  Copyright © 2017年 Long. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ICImageCardModel;
@interface ICImageCardListModel : NSObject

@property (nonatomic, assign) BOOL hasMore;
@property (nonatomic, copy) NSArray<ICImageCardModel *> *photolist;

@end

@interface ICImageCardModel : NSObject

@property (nonatomic, copy) NSString *photoNo;
@property (nonatomic, copy) NSString *imageUrl;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *postName;
@property (nonatomic, copy) NSString *province;
@property (nonatomic, assign, getter=isFavorite) BOOL favorite;
@property (nonatomic, copy) NSString *reason;

@end
