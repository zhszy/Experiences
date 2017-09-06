//
//  ThreadViewController.m
//  Experiences
//
//  Created by zhs on 2017/9/6.
//  Copyright © 2017年 zhs. All rights reserved.
//

#import "ThreadViewController.h"

@interface ThreadViewController ()

@end

@implementation ThreadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSOperation *operation = [NSOperation new];
    [operation start];
    [operation cancel];
    [operation setCompletionBlock:^{
        
    }];
    
    NSInvocationOperation *invationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invationOperationAction:) object:nil];
    [invationOperation start];
    
}
- (void)invationOperationAction:(id)data{

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
