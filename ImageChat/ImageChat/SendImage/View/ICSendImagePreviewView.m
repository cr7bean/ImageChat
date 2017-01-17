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

@end
