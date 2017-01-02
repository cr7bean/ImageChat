//
//  AppDelegate.m
//  ImageChat
//
//  Created by FigureWang on 17/1/2.
//  Copyright © 2017年 Long. All rights reserved.
//

#import "AppDelegate.h"
#import "ICImageTabBarViewController.h"
#import "UIColor+ICHex.h"
#import "Macro.h"
#import <CocoaLumberjack/CocoaLumberjack.h>




@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame: [UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    ICImageTabBarViewController *tabBarController = [[ICImageTabBarViewController alloc] init];
    self.window.rootViewController = tabBarController;
    
    [self customizeNavigationBar];
    [self configurateLogSystem];

    [self.window makeKeyAndVisible];
    return YES;
}

#pragma mark - customize

- (void)customizeNavigationBar {
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor: [UIColor colorWithHex:NAVIGATIONBAR_COLOR]];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setBackgroundImage:[UIImage new]
                                      forBarPosition:UIBarPositionAny
                                          barMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setShadowImage: [UIImage new]];
    
}

- (void)configurateLogSystem {
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [DDLog addLogger:[DDASLLogger sharedInstance]];
}




@end
