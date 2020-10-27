//
//  DYTabViewController.m
//  DouYinDemo
//
//  Created by HN on 2020/10/27.
//  Copyright © 2020 HN. All rights reserved.
//

#import "DYTabViewController.h"
#import "MainViewController.h"
#import "RTRootNavigationController.h"

#import "DHCustomTabBar.h"

@interface DYTabViewController ()

@property (strong, nonatomic) DHCustomTabBar *dhTabBar;

@end

@implementation DYTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DHCustomTabBar *dhTabBar = [[DHCustomTabBar alloc] initWithFrame:CGRectZero titles:@[@"首页"]];

    dhTabBar.tabBarView.viewDelegate = self;
    [self setValue:dhTabBar forKey:@"tabBar"];

//    dhTabBar.backgroundImage = [UIImage gk_imageWithColor:[UIColor orangeColor] size:CGSizeMake(SCREEN_WIDTH, GK_TABBAR_HEIGHT)];
    MainViewController *homeVC = HNWLoadControllerFromStoryboard(SBName, NSStringFromClass(MainViewController.class));
//    RTRootNavigationController *containVC = [[RTRootNavigationController alloc]initWithRootViewController:homeVC];
    [self addChildViewControllerWithVC:homeVC];
}

// 添加某个 childViewController
- (void)addChildViewControllerWithVC:(UIViewController *)vc
{
    RTRootNavigationController *nav = [[RTRootNavigationController alloc]initWithRootViewController:vc];

//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
//    nav.gk_openScrollLeftPush = YES;
    // 如果同时有navigationbar 和 tabbar的时候最好分别设置它们的title
//    vc.navigationItem.title = title;
    nav.title = @"test";
//    vc.tabBarItem.title = title;
    [self addChildViewController:nav];
}
@end
