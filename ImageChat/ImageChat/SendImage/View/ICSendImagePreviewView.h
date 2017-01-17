//
//  ICSendImagePreviewView.h
//  ImageChat
//
//  Created by FigureWang on 17/1/17.
//  Copyright © 2017年 Long. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AVCaptureSession;
@class AVCaptureVideoPreviewLayer;

@interface ICSendImagePreviewView : UIView

@property (nonatomic, readonly) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (nonatomic) AVCaptureSession *session;


@end
