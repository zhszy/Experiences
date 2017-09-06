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
