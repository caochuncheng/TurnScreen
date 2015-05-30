//
//  AppViewController.h
//  TurnScreen
//
//  Created by ccc on 15/1/19.
//  Copyright (c) 2015年 www.cccapp.com. All rights reserved.
//

#import "BaseViewController.h"

#import "PortraitViewController.h"
#import "LandscapeViewController.h"

@interface AppViewController : BaseViewController{
    NSMutableDictionary *_viewControllers;
    NSString *_currentViewClass;
}

@property (nonatomic,strong) BaseViewController *currentViewController;


@end
