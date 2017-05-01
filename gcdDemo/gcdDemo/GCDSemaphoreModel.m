//
//  GCDSemaphoreModel.m
//  gcdDemo
//
//  Created by sunshinek31 on 2017/3/31.
//  Copyright © 2017年 sunshinek31. All rights reserved.
//

#import "GCDSemaphoreModel.h"

@implementation GCDSemaphoreModel

- (void)excute {
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i = 0; i < 100000; i++) {
        dispatch_async(queue, ^{
            /*
             此时semaphore信号量的值如果 >= 1时：对semaphore计数进行减1,然后dispatch_semaphore_wait 函数返回。该函数所处线程就继续执行下面的语句。
             
             此时semaphore信号量的值如果=0：那么就阻塞该函数所处的线程,阻塞时长为timeout指定的时间，如果阻塞时间内semaphore的值被dispatch_semaphore_signal函数加1了，该函数所处线程获得了信号量被唤醒。然后对semaphore计数进行减1并返回，继续向下执行。 如果阻塞时间内没有获取到信号量唤醒线程或者信号量的值一直为0，那么就要等到指定的阻塞时间后，该函数所处线程才继续向下执行。
             
             执行到这里semaphore的值总是1
             */
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            
            /* 因为dispatch_semaphore_create创建的semaphore的初始值为1，执行完上面的
             dispatch_semaphore_wait函数之后，semaphore计数值减1会变为0，所以可访问array对象的线程只有1个，因此可安全地对array进行操作。
             */
            [array addObject:[NSNumber numberWithInteger:i]];
            NSLog(@"array has add the %li object",(long)i);
            
            /*
             对array操作之后，通过dispatch_semaphore_signal将semaphore的计数值加1，此时semaphore的值由变成了1，所处
             */
            dispatch_semaphore_signal(semaphore);
        });
    }
}

@end
