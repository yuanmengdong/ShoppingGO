//
//  AppDelegate.m
//  ShoppingGO
//
//  Created by rimi on 16/3/23.
//  Copyright © 2016年 rimi. All rights reserved.
//

#import "AppDelegate.h"

#import <AVOSCloud/AVOSCloud.h>
#import "UMSocial.h"

#import "UMSocialSinaSSOHandler.h"
#import "HomePageViewController.h"
#import "TypeClassViewController.h"
#import "PersonalViewController.h"


@interface AppDelegate () <UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    [AVOSCloud setApplicationId:@"oyYmswtCpYqftMEIOcJqTl7G-gzGzoHsz" clientKey:@"kcztrz7Sl6Ec4QocvSctes85"];
    [UMSocialData setAppKey:@"56eb793e67e58e3608001c26"];
    [AVAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    [UMSocialSinaSSOHandler openNewSinaSSOWithAppKey:@"3921700954"
                                              secret:@"04b48b094faeb16683c32669824ebdad"
                                         RedirectURL:@"http://sns.whalecloud.com/sina2/callback"];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    HomePageViewController * viewController1 = [[HomePageViewController alloc] init];
    TypeClassViewController * viewController2 = [[TypeClassViewController alloc] init];
    PersonalViewController * viewController3 = [[PersonalViewController alloc] init];
    UINavigationController * naVC1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    UINavigationController * naVC2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
    UINavigationController * naVC3 = [[UINavigationController alloc] initWithRootViewController:viewController3];
    
    
    
    UITabBarController * tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[naVC1, naVC2, naVC3];
    
    tabBarController.tabBar.barTintColor = [UIColor grayColor];
    
    self.window.rootViewController = tabBarController;
    tabBarController.delegate = self;
//    tabBarController.navigationController.viewControllers = @[]
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    BOOL result = [UMSocialSnsService handleOpenURL:url];
    if (result == FALSE) {
        //调用其他SDK，例如支付宝SDK等
    }
    return result;
}
@end
