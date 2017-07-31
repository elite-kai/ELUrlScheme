//
//  ELJumpWX.m
//  ELNongyao
//
//  Created by Parkin on 2017/7/28.
//  Copyright © 2017年 Parkin. All rights reserved.
//

#import "ELJumpWX.h"

static ELJumpWX *_instance = nil;

@implementation ELJumpWX

+ (ELJumpWX *)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] init];
    });
    
    return _instance;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    
    return _instance;
}

- (instancetype)copyWithZone:(NSZone *)zone
{
    return _instance;
}

+ (BOOL)elJumpHandleOpenURL:(NSURL *)url
{
    NSString *scheme = [NSString stringWithFormat:@"%@", url];
    if ([ELJumpWX shareInstance].jumpBlock != nil) {
        [ELJumpWX shareInstance].jumpBlock(scheme);
    }
    
    return YES;
}

+ (void)handleOpenURL:(NSURL *)url withDelegate:(id<ELJumpWXDelegate>)delegate
{
    NSString *scheme = [NSString stringWithFormat:@"%@", url];
    if ([delegate respondsToSelector:@selector(eljumpLogin:)]) {
        [delegate eljumpLogin:scheme];
    }
}

@end
