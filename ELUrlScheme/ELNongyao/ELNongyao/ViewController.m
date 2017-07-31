//
//  ViewController.m
//  ELNongyao
//
//  Created by Parkin on 2017/7/28.
//  Copyright © 2017年 Parkin. All rights reserved.
//

#import "ViewController.h"

#import "ELJumpWX.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"微信登录" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)login
{
    [ELJumpWX shareInstance].jumpBlock = ^(NSString *scheme) {
        NSLog(@"微信授权成功 %@", scheme);
    };
    
    //ELWX要设置成白名单才能进行跳转，进行跳转的时候要把ELWXkldjie93410ld传给微信客户端，微信客户端应该是把ELWXkldjie93410ld进行了保存，授权成功以后再返回当前的这个app
    NSString *customURL = @"ELWX://app?schemes=ELWXkldjie93410ld";
    if ([[UIApplication sharedApplication]
         canOpenURL:[NSURL URLWithString:customURL]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:customURL]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
