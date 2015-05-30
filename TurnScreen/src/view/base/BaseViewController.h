//
//  BaseViewController.h
//  TurnScreen
//
//  Created by ccc on 14/12/17.
//  Copyright (c) 2015年 www.cccapp.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CMMotionManager.h>

@interface BaseViewController : UIViewController<AppEventDelegate>{
    BOOL _statusBarHidden;
}

@property (nonatomic, weak) id <AppEventDelegate> appEventDelegate;

-(void)onMontionShakeEvent;

-(void)applicationDidBecomeActive;

-(void)resetViewFrame:(CGRect)frame;

-(void)showViewAnimation;

@end
