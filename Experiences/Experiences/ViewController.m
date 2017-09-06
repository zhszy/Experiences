//
//  ViewController.m
//  Experiences
//
//  Created by zhs on 2017/9/6.
//  Copyright © 2017年 zhs. All rights reserved.
//

#import "ViewController.h"
#import "EventForwardManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSOperation *operation = [NSOperation new];
    [operation start];
    [operation cancel];
    [operation setCompletionBlock:^{
        
    }];
    
    NSInvocationOperation *invationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invationOperationAction:) object:nil];
//    [invationOperation start];
    
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"2在第%@个线程",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"3在第%@个线程",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"4在第%@个线程",[NSThread currentThread]);
    }];
    
    [blockOperation addExecutionBlock:^{
        NSLog(@"5在第%@个线程",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"6在第%@个线程",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"7在第%@个线程",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"8在第%@个线程",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"9在第%@个线程",[NSThread currentThread]);
    }];
    [blockOperation addExecutionBlock:^{
        NSLog(@"10在第%@个线程",[NSThread currentThread]);
    }];
    
//    for (int i=0; i<200; i++) {
//        [blockOperation addExecutionBlock:^{
//            NSLog(@"%d在第%@个线程",i+11,[NSThread currentThread]);
//        }];
//    }
    
//    [blockOperation start];
    [blockOperation setCompletionBlock:^{
        NSLog(@"11在第%@个线程",[NSThread currentThread]);
    }];
    
    
    NSOperationQueue *queue = [NSOperationQueue new];
    
    [invationOperation addDependency:blockOperation];
    
    [queue addOperation:invationOperation];
    [queue addOperation:blockOperation];
    [queue addOperationWithBlock:^{
        NSLog(@"12在第%@个线程",[NSThread currentThread]);
    }];
    
//    for (int i = 0; i<5000; i++) {
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//           NSLog(@"%d在第%@个线程",i+11,[NSThread currentThread]);
//        });
//    }
    [NSOperationQueue mainQueue];
    NSOperationQueue *main = NSOperationQueue.mainQueue;
    
}
- (void)invationOperationAction:(id)data{
    NSLog(@"5651在第%@个线程",[NSThread currentThread]);
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [EventForwardManager eventModuleId:EventForwardType1 parmas:nil callBack:nil];
    [EventForwardManager eventModuleId:EventForwardType2 parmas:@{@"boy":@"litre"} callBack:nil];
    [EventForwardManager eventModuleId:EventForwardType3 parmas:nil callBack:^(id data) {
        NSLog(@"block--%s --- %@",__FUNCTION__,data);
    }];
    [EventForwardManager eventModuleId:EventForwardType4 parmas:@{@"boy":@"litre"} callBack:^(id data) {
        NSLog(@"block--%s --- %@",__FUNCTION__, data);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
