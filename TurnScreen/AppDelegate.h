//
//  AppDelegate.h
//  TurnScreen
//
//  Created by ccc on 15/5/30.
//  Copyright (c) 2015年 www.cccapp.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate,AppEventDelegate>{
    BOOL _isEnterBackground;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) AppViewController *appViewController;


@end

