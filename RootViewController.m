//
//  RootViewController.m
//  SYSingletonByValue
//
//  Created by mac1 on 16/8/20.
//  Copyright © 2016年 fuxi. All rights reserved.
//

#import "RootViewController.h"
#import "ModelViewController.h"

@interface RootViewController ()

@end

//1. 定义一个静态全局变量
static RootViewController *instance = nil;

@implementation RootViewController

//2. 实现类方法
+ (instancetype) sharedInstance {
    
    @synchronized(self) {
        if (instance == nil) {
            //初始化单例模式
            instance = [[RootViewController alloc] init];
        }
    }
    
    return instance;
}

//说明：这里的的复写目的是防止用户无意之间采用[[RootViewController alloc] init]进行初始化
+ (instancetype) allocWithZone:(struct _NSZone *)zone {
    
    @synchronized(self) {
        if (instance == nil) {
            //说明：这里的实例是进行内存的分配
            instance = [super allocWithZone: zone];
        }
    }
    
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

#pragma mark - 创建UI
- (void) createUI {
    
    //1) 设置背景颜色
    self.view.backgroundColor = [UIColor cyanColor];
    
    //2) 设置一个Label
    //a) 创建一个Label
    _label = [[UILabel alloc] initWithFrame:CGRectMake(25, 100, 270, 30)];
    //b) 设置该label的tag
    _label.tag = 1000;
    //c) 设置label的内容
    _label.text = @"单例模式文字显示";
    //d) 设置背景颜色
    _label.backgroundColor = [UIColor orangeColor];
    //e) 设置字体颜色
    _label.textColor = [UIColor whiteColor];
    //f) 设置居中方式
    _label.textAlignment = NSTextAlignmentCenter;
    //g) 添加label
    [self.view addSubview:_label];
    
    //3) 设置跳转你的button
    //a) 创建button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    //b) 设置其frame
    button.frame = CGRectMake(0, 0, 200, 30);
    //c) 设置其在屏幕的中心
    button.center = self.view.center;
    //d) 设置背景颜色
    button.backgroundColor = [UIColor lightGrayColor];
    //e) 设置显示的内容
    [button setTitle:@"跳转" forState:UIControlStateNormal];
    //f) 设置相应事件
    [button addTarget:self
               action:@selector(buttonAction:)
     forControlEvents:UIControlEventTouchUpInside];
    //g) 添加到页面上
    [self.view addSubview:button];
}

#pragma mark - 点击的按键响应
- (void) buttonAction: (UIButton *) button {
    
    //1. 创建一个模态视图
    ModelViewController *modelViewController = [[ModelViewController alloc] init];
    //2. 弹窗模式
    modelViewController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    
    //4. 模态视图
    [self presentViewController:modelViewController animated:YES completion:nil];
    
}



@end
