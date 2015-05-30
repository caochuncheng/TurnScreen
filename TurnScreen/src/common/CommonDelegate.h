//
//  CommonDelegate.h
//  TurnScreen
//
//  Created by ccc on 14-6-5.
//  Copyright (c) 2015年 www.cccapp.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommonDelegate : NSObject

@end
/**
 *  此文件只是用来定义 Delegate 使用，即使用程序不需要每一个view都需要定义一个 Delegate
 */
/*!
 * The delegate protocol
 */
@protocol AppEventDelegate <NSObject>
@optional

// 点击事件
-(void)onClickEvent:(NSInteger)moduleId eventId:(NSInteger)eventId;
-(void)onClickEvent:(NSInteger)moduleId eventId:(NSInteger)eventId obj:(NSObject *)obj;

// 手势事件
-(void)onGestureEvent:(NSInteger)moduleId eventId:(NSInteger)eventId;
-(void)onGestureEvent:(NSInteger)moduleId eventId:(NSInteger)eventId obj:(NSObject *)obj;
@end