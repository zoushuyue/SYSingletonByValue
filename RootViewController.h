//
//  RootViewController.h
//  SYSingletonByValue
//
//  Created by mac1 on 16/8/20.
//  Copyright © 2016年 fuxi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

//1. 创建一个单例模式
+ (instancetype) sharedInstance;

//2. 创建一个全局的Label
@property(nonatomic, strong) UILabel *label;


@end
