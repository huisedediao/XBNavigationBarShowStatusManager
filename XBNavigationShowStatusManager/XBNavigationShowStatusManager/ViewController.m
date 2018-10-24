//
//  ViewController.m
//  XBNavigationShowStatusManager
//
//  Created by xxb on 2018/10/24.
//  Copyright © 2018年 xxb. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
#import "XBNavigationBarShowStatusManager.h"

@interface ViewController ()

@end

@implementation ViewController
- (IBAction)push:(UIButton *)sender {
    [self.navigationController pushViewController:[TestViewController new] animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [XBNavigationBarShowStatusManager showNavigationBarFor:self];
}


@end
