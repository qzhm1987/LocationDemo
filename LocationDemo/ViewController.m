//
//  ViewController.m
//  LocationDemo
//
//  Created by Mac on 2018/3/26.
//  Copyright © 2018年 BeiJingXiaoMenTong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CLLocationManagerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _manager = [[CLLocationManager alloc]init];
    _manager.distanceFilter = kCLDistanceFilterNone;
    _manager.desiredAccuracy = kCLLocationAccuracyBest;
    if([_manager respondsToSelector:@selector(requestAlwaysAuthorization)])
    {
        [_manager requestAlwaysAuthorization];
    }
    //该模式是抵抗程序在后台被杀，申明不能够被暂停
    _manager.pausesLocationUpdatesAutomatically=NO;
    _manager.allowsBackgroundLocationUpdates =YES;
    //3.设置代理
    _manager.delegate=self;
    //4.开始定位
    [_manager startUpdatingLocation];
    //5.获取朝向
    [_manager startUpdatingHeading];

    // Do any additional setup after loading the view, typically from a nib.
}

//定位失败时调用的方法
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
}
//定位成功调用的的方法
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    NSLog(@"定位");
    
    
    
    
}

- (void)locationManager:(CLLocationManager *)manager
       didUpdateHeading:(CLHeading *)newHeading {
    NSLog(@"didUpdateHeading");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
