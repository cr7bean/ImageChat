//
//  ICMeSaveImageTableViewCell.h
//  ImageChat
//
//  Created by FigureWang on 17/1/18.
//  Copyright © 2017年 Long. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ICMeSettingTableViewCell : UITableViewCell

- (void)configureViewContentAtIndexPath:(NSIndexPath*)indexPath
                              subtitles:(NSMutableArray*)subtitles
                             isSwitchOn:(BOOL)switchState;

@end
