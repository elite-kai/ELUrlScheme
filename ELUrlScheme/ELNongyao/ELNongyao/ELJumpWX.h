//
//  ELJumpWX.h
//  ELNongyao
//
//  Created by Parkin on 2017/7/28.
//  Copyright © 2017年 Parkin. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^ELJumpBlock)(NSString *scheme);

@protocol ELJumpWXDelegate <NSObject>

- (void)eljumpLogin:(NSString *)string;

@end

@interface ELJumpWX : NSObject<NSCopying>

+ (ELJumpWX *)shareInstance;

+ (instancetype)allocWithZone:(struct _NSZone *)zone;

- (instancetype)copyWithZone:(NSZone *)zone;

@property (nonatomic, copy) ELJumpBlock jumpBlock;


+ (BOOL)elJumpHandleOpenURL:(NSURL *)url;


+ (void)handleOpenURL:(NSURL *)url withDelegate:(id<ELJumpWXDelegate>)delegate;


@end
