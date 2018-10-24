//
//  XBNavigationBarShowStatusManager.h
//  W100_smanos
//
//  Created by xxb on 2018/10/24.
//  Copyright © 2018年 王振. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XBNavigationBarShowStatusManager : NSObject
+ (void)showNavigationBarFor:(UIViewController *)target;
+ (void)hiddenNavigationBarFor:(UIViewController *)target;
@end
