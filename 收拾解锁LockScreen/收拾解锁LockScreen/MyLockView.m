//
//  MyLockView.m
//  收拾解锁LockScreen
//
//  Created by AmberWhiteSky on 15/9/25.
//  Copyright © 2015年 AmberWhiteSky. All rights reserved.
//

#import "MyLockView.h"

@implementation MyLockView


//通过代码创建控件的时候需要重写initWithFrame
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //初始化代码
        [self setUp];

        
    }
    return self;
}


//通过sb 或者xib 创建控件的时候需要重写initWithCoder
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        //初始化代码
        [self setUp];
        
    }
    return self;
}

//初始化代码
-(void)  setUp{
    for (int  index=0; index<9; index++) {
        //1.创建按钮
        UIButton  *but =[UIButton  buttonWithType:UIButtonTypeCustom];
        
        //2.设置默认图片
        [but setBackgroundImage:[UIImage  imageNamed:@""] forState:UIControlStateNormal];
        
        //设置按钮选中时候的图片
        [but setBackgroundImage:[UIImage  imageNamed:@""] forState:UIControlStateSelected];
        
        
        //3.添加按钮
        [self addSubview:but];
    }

}
//重写draw方法
-(void)drawRect:(CGRect)rect {



}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
