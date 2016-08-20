//
//  ModelViewController.m
//  SYSingletonByValue
//
//  Created by mac1 on 16/8/20.
//  Copyright © 2016年 fuxi. All rights reserved.
//

#import "ModelViewController.h"
#import "RootViewController.h"

@interface ModelViewController ()

@end

@implementation ModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
}

#pragma mark - 创建UI
- (void) createUI {
    
    //1) 设置背景颜色
    self.view.backgroundColor = [UIColor orangeColor];
    
    //2) 设置一个TextField
    //a) 创建一个TextField
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(25, 100, 270, 30)];
    //b) 设置tag
    textField.tag = 2000;
    //c) 设置显示的效果
    textField.borderStyle = UITextBorderStyleRoundedRect;
    //d) 显示提示语
    textField.placeholder = @"请输入一段文字...";
    //e) 添加到self.view上
    [self.view addSubview:textField];
    
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
    [button setTitle:@"返 回" forState:UIControlStateNormal];
    //f) 设置相应事件
    [button addTarget:self
               action:@selector(backAction:)
     forControlEvents:UIControlEventTouchUpInside];
    //g) 添加到页面上
    [self.view addSubview:button];
}

- (void) backAction: (UIButton *) button {
    
    //1) 取值
    UITextField *textField = (UITextField *)[self.view viewWithTag:2000];
    
    //2) 通过单例模式修改值
    RootViewController *rootViewController = [RootViewController sharedInstance];
    rootViewController.label.text = textField.text;
    
    //3) 关闭模态视图
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}


@end
