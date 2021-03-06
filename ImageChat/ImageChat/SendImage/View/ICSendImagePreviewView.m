//
//  ICSendImagePreviewView.m
//  ImageChat
//
//  Created by FigureWang on 17/1/17.
//  Copyright © 2017年 Long. All rights reserved.
//

@import AVFoundation;
#import "ICSendImagePreviewView.h"

@implementation ICSendImagePreviewView

+ (Class)layerClass {
    return [AVCaptureVideoPreviewLayer class];
}

- (AVCaptureVideoPreviewLayer *)videoPreviewLayer
{
    AVCaptureVideoPreviewLayer *captureLayer = (AVCaptureVideoPreviewLayer *)self.layer;
    captureLayer.videoGravity = AVLayerVideoGravityResize;
    return captureLayer;
}

- (AVCaptureSession *)session
{
    return self.videoPreviewLayer.session;
}

- (void)setSession:(AVCaptureSession *)session
{
    self.videoPreviewLayer.session = session;
}

@end
