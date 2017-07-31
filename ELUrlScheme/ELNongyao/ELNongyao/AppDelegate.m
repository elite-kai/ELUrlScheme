//
//  AppDelegate.m
//  ELNongyao
//
//  Created by Parkin on 2017/7/28.
//  Copyright © 2017年 Parkin. All rights reserved.
//

#import "AppDelegate.h"
#import "ELJumpWX.h"

@interface AppDelegate ()<ELJumpWXDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}


//iOS9 之后使用这个回调方法。
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString *,id> *)options
{
    NSLog(@"url--------> %@", url);
//    [ELJumpWX handleOpenURL:url withDelegate:self];
    return [ELJumpWX elJumpHandleOpenURL:url];
}


/**
 */
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSLog(@"url--------> %@", url);
    
//    [ELJumpWX handleOpenURL:url withDelegate:self];
    return [ELJumpWX elJumpHandleOpenURL:url];
    
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return YES;
}

- (void)eljumpLogin:(NSString *)string
{
    
}


@end
