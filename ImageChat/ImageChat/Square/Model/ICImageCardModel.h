//
//  ICImageCardModel.h
//  ImageChat
//
//  Created by FigureWang on 17/1/4.
//  Copyright © 2017年 Long. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ICImageCardModel : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *dateTitle;
@property (nonatomic, copy) NSString *subtitle;

@end
