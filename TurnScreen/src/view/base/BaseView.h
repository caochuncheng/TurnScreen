//
//  BaseView.h
//  TurnScreen
//
//  Created by ccc on 14/11/25.
//  Copyright (c) 2015年 www.cccapp.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

@property (nonatomic, weak) id <AppEventDelegate> appEventDelegate;

-(void)resetViewFrame:(CGRect)frame;

-(void)showViewAnimation;
-(void)startViewAnimation;
-(void)pauseViewAnimation;
-(void)resumeViewAnimation;
-(void)stopViewAnimation;


@end
