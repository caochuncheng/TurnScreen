//
//  LandscapeViewController.m
//  TurnScreen
//
//  Created by ccc on 15/5/30.
//  Copyright (c) 2015年 www.cccapp.com. All rights reserved.
//

#import "LandscapeViewController.h"

@interface LandscapeViewController ()

@end

@implementation LandscapeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _statusBarHidden = NO;
    self.view.backgroundColor = [UIColor clearColor];
    CGRect rc = self.view.frame;
    UIInterfaceOrientation orientation =[UIApplication sharedApplication].statusBarOrientation;
    if (UIInterfaceOrientationIsPortrait(orientation)) {
        NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
        if (rc.size.width < rc.size.height) {
            rc = CGRectMake(0, 0, self.view.frame.size.height, self.view.frame.size.width);
        }
    }
    [self initView:rc];
}

- (void)didReceiveMemoryWarning {
    
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 初始化界面显示对象
- (void)initView:(CGRect)frame
{
    float offsetY = IOS_OFFSET;
    if (_statusBarHidden) {
        if (isIOS7Later) {
            offsetY = 0.0f;
        }else{
            offsetY = -20.0f;
        }
    }
    self.view.backgroundColor = [UIColor  clearColor];
    
    UIImage *img;
    UIButton *btn;
    CGRect rc;
    
    rc = CGRectMake(0, offsetY, frame.size.width, frame.size.height - offsetY);
    UIView *v = [[UIView alloc]initWithFrame:rc];
    v.backgroundColor = [UIColor grayColor];
    [self.view addSubview:v];
    
    img = [UIImage imageNamed:@"btn_background.png"];
    rc = CGRectMake((v.frame.size.width - img.size.width) / 2,
                    (v.frame.size.height - img.size.height) / 2,
                    img.size.width, img.size.height);
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.tag = kAppEventTurn;
    btn.frame = rc;
    [btn addTarget:self action:@selector(onClickButton:) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:img forState:UIControlStateNormal];
    
    img = [UIImage imageNamed:@"btn_turn.png"];;
    [btn setImage:img forState:UIControlStateNormal];
    
    [btn setTitle:NSLocalizedString(@"btn.turn.portrait.name", @"转坚屏") forState:UIControlStateNormal];
    [btn setTitleColor:RGB_COLOR(89, 89, 89) forState:UIControlStateNormal];
    
    btn.titleLabel.font = [UIFont fontWithName:kFontName size: 22.0f];
    btn.titleLabel.textAlignment = kTextAlignmentCenter;
    
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0.0, -25.0, 0.0, 0.0)];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)];
    [v addSubview:btn];
;
}

// 当隐藏状态栏时，界面显示对象坐标位置需要重新初始化
-(void)resetViewFrame:(CGRect)frame
{
    self.view.frame = frame;
    float offsetY = IOS_OFFSET;
    if (_statusBarHidden) {
        if (isIOS7Later) {
            offsetY = 0.0f;
        }else{
            offsetY = -20.0f;
        }
    }
    CGRect rc;
    rc = CGRectMake(0, offsetY, frame.size.width, frame.size.height - offsetY);
    UIView *v = [self.view viewWithTag:kAppEventHome];
    v.frame = rc;
}

/**
 *  从后台服务打开应用执行
 */
-(void)applicationDidBecomeActive
{
    
}
// 屏幕翻转控制
-(BOOL)shouldAutorotate
{
    return YES;
}
-(NSUInteger)supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskLandscape
            | UIInterfaceOrientationMaskLandscapeLeft
            | UIInterfaceOrientationMaskLandscapeRight);
}
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIInterfaceOrientation orientation =[UIApplication sharedApplication].statusBarOrientation;
    if(UIInterfaceOrientationIsPortrait(orientation)){
        NSNumber *value = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
        [[UIDevice currentDevice] setValue:value forKey:@"orientation"];
    }
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self syncStatusBarHidden];
}
// 状态条是否显示
-(BOOL)prefersStatusBarHidden
{
    return _statusBarHidden;
}
// 状态条是否显示处理
-(void)syncStatusBarHidden
{
    if (isIOS7Later) {
        if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
            [self prefersStatusBarHidden];
            [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
        }
    }else{
        [[UIApplication sharedApplication]setStatusBarHidden:_statusBarHidden];
    }
}
#pragma mark - Begin 本Controller 事件方法处理实现
-(void)onMontionShakeEvent
{
    
}
-(void)onClickButton:(UIButton *)button
{
    if(button.tag == kAppEventTurn){
        if ([self.appEventDelegate respondsToSelector:@selector(onClickEvent:eventId:obj:)]){
            [self.appEventDelegate onClickEvent:kAppViewController eventId:kAppEventChanged obj:@"PortraitViewController"];
        }
        return;
    }
}

#pragma mark - End 本Controller 事件方法处理实现
#pragma mark - Begin 系统委托处理函数

#pragma mark - End 系统委托处理函数

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
