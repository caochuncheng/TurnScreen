//
//  BaseViewController.m
//  TurnScreen
//
//  Created by ccc on 14/12/17.
//  Copyright (c) 2015年 www.cccapp.com. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic,strong) NSTimer *timer;

@property (nonatomic,strong) CMMotionManager *motionManager;

@end

@implementation BaseViewController{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMotionManager];
}

- (void)didReceiveMemoryWarning {
    if (_motionManager) {
        [_motionManager stopAccelerometerUpdates];
        _motionManager = nil;
    }
    _timer = nil;
    [super didReceiveMemoryWarning];
}
// 手机摇晃检测
-(void)initMotionManager
{
    _motionManager = [[CMMotionManager alloc]init];
    if (!_motionManager.accelerometerAvailable) {
        DLog(@"CMMotionManager unavailable");
    }
    _motionManager.accelerometerUpdateInterval =0.1f;
    [_motionManager startAccelerometerUpdates];
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.3f
                                              target:self
                                            selector:@selector(updateAcceleration:)
                                            userInfo:nil
                                             repeats:YES];
    [_timer fire];
}
-(void)updateAcceleration:(id)userInfo
{
    CMAccelerometerData *accelData =_motionManager.accelerometerData;
    double x = accelData.acceleration.x;
    double y = accelData.acceleration.y;
    double z = accelData.acceleration.z;
    if (fabs(x)>1.5 ||fabs(y)>1.5 ||fabs(z)>1.5) {
        DLog(@"检测到晃动");
        [self onMontionShakeEvent];
    }
}
/**
 * 手机摇晃事件
 */
-(void)onMontionShakeEvent
{
    
}
/**
 * 从后台服务打开应用执行
 */
-(void)applicationDidBecomeActive
{
    
}
/**
 * 界面大小变化View位置重置
 */
-(void)resetViewFrame:(CGRect)frame
{
    self.view.frame = frame;
}

/**
 * 界面显示时播放动画
 */
-(void)showViewAnimation
{
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
