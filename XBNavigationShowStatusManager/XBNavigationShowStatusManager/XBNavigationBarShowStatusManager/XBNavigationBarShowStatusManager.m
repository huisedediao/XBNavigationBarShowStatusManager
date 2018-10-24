//
//  XBNavigationBarShowStatusManager.m
//  W100_smanos
//
//  Created by xxb on 2018/10/24.
//  Copyright © 2018年 王振. All rights reserved.
//

#import "XBNavigationBarShowStatusManager.h"

@interface XBNavigationBarShowStatusManager () <UINavigationControllerDelegate>
@property (nonatomic,weak) UIViewController *target;
@property (nonatomic,assign) BOOL isHidden;
@property (nonatomic,strong) NSTimer *timer;
@end

@implementation XBNavigationBarShowStatusManager

- (instancetype)init
{
    if (self = [super init])
    {
        [self startTimer];
    }
    return self;
}

- (void)dealloc
{
    [self stopTimer];
    NSLog(@"XBNavigationBarShowStatusManager 销毁");
}

- (void)startTimer
{
    [self stopTimer];
    if (self.timer == nil)
    {
        self.timer = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerRun:) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }
}

- (void)stopTimer
{
    if ([self.timer isValid])
    {
        [self.timer invalidate];
        self.timer = nil;
    }
}

- (void)timerRun:(NSTimer *)timer
{
    if (self.target == nil)
    {
        [self stopTimer];
    }
}

+ (void)showNavigationBarFor:(UIViewController *)target
{
    XBNavigationBarShowStatusManager *manager = [XBNavigationBarShowStatusManager new];
    manager.isHidden = NO;
    manager.target = target;
    manager.target.navigationController.delegate = manager;
}

+ (void)hiddenNavigationBarFor:(UIViewController *)target
{
    XBNavigationBarShowStatusManager *manager = [XBNavigationBarShowStatusManager new];
    manager.isHidden = YES;
    manager.target = target;
    manager.target.navigationController.delegate = manager;
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    BOOL isSelfTarget = [viewController isKindOfClass:[self.target class]];
    if (isSelfTarget)
    {
        [self.target.navigationController setNavigationBarHidden:self.isHidden animated:YES];
    }
}

@end
