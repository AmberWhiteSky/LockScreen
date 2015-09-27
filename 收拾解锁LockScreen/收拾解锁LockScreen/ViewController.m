//
//  ViewController.m
//  收拾解锁LockScreen
//
//  Created by AmberWhiteSky on 15/9/25.
//  Copyright © 2015年 AmberWhiteSky. All rights reserved.
//

#import "ViewController.h"
#import "MyLockView.h"

@interface ViewController ()<MyLockViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


-(void)lockView:(MyLockView *)lockView didFinish:(NSString *)path {
    
    
    NSLog(@"用户路径:%@",path);

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
