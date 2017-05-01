//
//  ViewController.m
//  gcdDemo
//
//  Created by sunshinek31 on 2017/3/31.
//  Copyright © 2017年 sunshinek31. All rights reserved.
//

#import "ViewController.h"
#import "GCDSemaphoreModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[GCDSemaphoreModel new] excute];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
