//
//  ViewController.m
//  LocationDemo
//
//  Created by Mac on 2018/3/26.
//  Copyright © 2018年 BeiJingXiaoMenTong. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()<CLLocationManagerDelegate>
{
    NSTimer *_timer;
    
}
@property (nonatomic, strong) CMMotionManager * motionManager;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(autoChange) userInfo:nil repeats:YES];
    //  [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
   _motionManager = [[CMMotionManager alloc]init];
    
    _motionManager.accelerometerUpdateInterval=1.0/60.0;
    
    [ _motionManager startAccelerometerUpdates];
    
    
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


-(void)autoChange

{
    
    //根据自己需求调节x y z
    
    if (fabs(_motionManager.accelerometerData.acceleration.x) > 2.0 || fabs(_motionManager.accelerometerData.acceleration.y) > 2.2 || fabs(_motionManager.accelerometerData.acceleration.z) > 1.5)
        
    {
        
        NSLog(@"我晃动了 。。。。。");
        
    }
    
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
    //NSLog(@"didUpdateHeading");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
