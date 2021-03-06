//
//  ICSendImageViewController.m
//  ImageChat
//
//  Created by FigureWang on 17/1/12.
//  Copyright © 2017年 Long. All rights reserved.
//

@import Masonry;
@import AVFoundation;
#import "ICSendImageViewController.h"
#import "UIViewController+ICTitleView.h"
#import "ICSendImageMainView.h"
#import "UIImage+ICHelper.h"
#import "ICSendImageEditViewController.h"

@interface ICSendImageViewController ()<ICSendImageMainViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong)  ICSendImageMainView *mainView;
@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) AVCaptureDevice *device;
@property (nonatomic, strong) AVCaptureDeviceInput *deviceInput;
@property (nonatomic, strong) AVCaptureStillImageOutput *imageOutput;

@end

@implementation ICSendImageViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurateSubviews];
    [self captureAuthorizationStatus];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.session startRunning];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.session stopRunning];
}

#pragma Configure Subviews

- (void)configurateSubviews {
    [self ic_titleViewWithImage:[UIImage imageNamed:@"上传"] text:@"发布"];
    self.mainView = [ICSendImageMainView new];
    self.mainView.delegate = self;
    [self.view addSubview:self.mainView];
    [self.mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
}

#pragma mark - Image Capture


- (void)captureAuthorizationStatus {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    switch (status) {
        case AVAuthorizationStatusNotDetermined: {
            DDLogDebug(@"AVAuthorizationStatusNotDetermined");
            break;
        }
        case AVAuthorizationStatusRestricted: {
            DDLogDebug(@"AVAuthorizationStatusRestricted");
            break;
        }
        case AVAuthorizationStatusDenied: {
            DDLogDebug(@"AVAuthorizationStatusDenied");
            break;
        }
        case AVAuthorizationStatusAuthorized: {
            [self configureCaptureSession];
            [self.mainView showPreviewView];
            DDLogDebug(@"AVAuthorizationStatusAuthorized");
            break;
        }
    }
}

- (void)configureCaptureSession {
    self.session = [AVCaptureSession new];
    self.session.sessionPreset = AVCaptureSessionPresetMedium;
    self.mainView.camPreviewView.session = self.session;
    self.device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (!self.device) {
        DDLogDebug(@"Camera device not available");
        return;
    }
    NSError *error = nil;
    self.deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:&error];
    if (!self.deviceInput) {
        DDLogDebug(@"Device input error: %@", error);
    }
    if ([self.session canAddInput:self.deviceInput]) {
         [self.session addInput:self.deviceInput];
    }
    self.imageOutput = [AVCaptureStillImageOutput new];
    NSDictionary *imageOutputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG, AVVideoCodecKey, nil];
    self.imageOutput.outputSettings = imageOutputSettings;
    if ([self.session canAddOutput:self.imageOutput]) {
        [self.session addOutput:self.imageOutput];
    }
}





#pragma mark - ICSendImageMainView Delegate

- (void)SendImageMainView:(ICSendImageMainView *)view buttonActionType:(SendImageButtonType)actionType {
    switch (actionType) {
        case SendImageButtonTypeClose: {
            [self close];
            break;
        }
        case SendImageButtonTypeCapture: {
            [self capture];
            break;
        }
        case SendImageButtonTypeAlbum: {
            [self album];
            break;
        }
    }
}

// Actions
- (void)close {
    self.tabBarController.selectedIndex = 0;
}

- (void)capture {
    AVCaptureConnection *imageConnection = [self.imageOutput connectionWithMediaType:AVMediaTypeVideo];
    [self.imageOutput captureStillImageAsynchronouslyFromConnection:imageConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
        UIImage *newImage = [UIImage ic_imageWithImage:[UIImage imageWithData:imageData] scaledToSize:SCREEN_SIZE];
        dispatch_async(dispatch_get_main_queue(), ^{
            ICSendImageEditViewController *controller = [[ICSendImageEditViewController alloc] initWithImage:newImage];
            UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
            [self presentViewController:navigationController animated:YES completion:nil];
        });
        DDLogDebug(@"Capture image Success");
    }];
    
}

- (void)album {
    [self.session stopRunning];
    UIImagePickerController *pickController = [UIImagePickerController new];
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        pickController.navigationBar.tintColor = [UIColor whiteColor];
        pickController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
        pickController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        pickController.allowsEditing = NO;
        pickController.delegate = self;
        [self presentViewController:pickController animated:YES completion:nil];
    }
}


#pragma mark - UIImagePickerController Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *newImage = info[UIImagePickerControllerOriginalImage];
    ICSendImageEditViewController *controller = [[ICSendImageEditViewController alloc] initWithImage:newImage];
    [picker pushViewController:controller animated:YES];
}



@end
