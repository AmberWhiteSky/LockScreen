//
//  AmCircleView.m
//  收拾解锁LockScreen
//
//  Created by AmberWhiteSky on 15/9/27.
//  Copyright © 2015年 AmberWhiteSky. All rights reserved.
//

#import "AmCircleView.h"

@implementation AmCircleView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



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

-(void)  setUp{
    //设置按钮不可用
    self.userInteractionEnabled =NO;
    //设置按钮背景色
    //2.设置默认图片
    [self setBackgroundImage:[UIImage  imageNamed:@"normal"] forState:UIControlStateNormal];
    
    //设置按钮选中时候的图片
    [self setBackgroundImage:[UIImage  imageNamed:@"light"] forState:UIControlStateSelected];
    

}
@end
