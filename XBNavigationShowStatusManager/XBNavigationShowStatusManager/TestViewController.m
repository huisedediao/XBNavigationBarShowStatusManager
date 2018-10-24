//
//  TestViewController.m
//  XBNavigationShowStatusManager
//
//  Created by xxb on 2018/10/24.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "TestViewController.h"
#import "XBNavigationBarShowStatusManager.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 200, 20)];
    [self.view addSubview:lable];
    lable.text = @"点击屏幕返回";
    
    
    [XBNavigationBarShowStatusManager hiddenNavigationBarFor:self];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.navigationController popViewControllerAnimated:YES];
}


@end
