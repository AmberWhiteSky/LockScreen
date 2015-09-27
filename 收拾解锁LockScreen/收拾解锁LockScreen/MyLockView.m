//
//  MyLockView.m
//  收拾解锁LockScreen
//
//  Created by AmberWhiteSky on 15/9/25.
//  Copyright © 2015年 AmberWhiteSky. All rights reserved.
//

#import "MyLockView.h"


@interface MyLockView ()

@property(nonatomic  ,strong)  NSMutableArray *selectButtons;

@end

@implementation MyLockView

// 懒加载
-(NSMutableArray *)selectButtons {
    if (_selectButtons==nil) {
        _selectButtons =[NSMutableArray  array];
    }
    return _selectButtons;
}

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
        
        //设置按钮不可用
        but.userInteractionEnabled =NO;
        //设置按钮背景色
        //2.设置默认图片
        [but setBackgroundImage:[UIImage  imageNamed:@"normal"] forState:UIControlStateNormal];
        
        //设置按钮选中时候的图片
        [but setBackgroundImage:[UIImage  imageNamed:@"light"] forState:UIControlStateSelected];
        
        
        //3.添加按钮
        [self addSubview:but];
    }
    
}


-(void)layoutSubviews  {
    [super  layoutSubviews];
    for (int  index=0; index<self.subviews.count; index++) {
        
        //取出按钮
        
        UIButton  *but =self.subviews[index];
        
        //frame
        CGFloat  butWidth =40;
        CGFloat  butHeight =40;
        
        int  totalCloums =3;
        int  col =  index % totalCloums;
        int  row =index/totalCloums;
        
        CGFloat marginX = (self.frame.size.width -totalCloums*butWidth)/(totalCloums +1);
        CGFloat marginY = marginX;
        
        CGFloat  butX=marginX +col *(butWidth+marginX);
        CGFloat  butY=row*(butHeight+marginY);
        but.frame  =CGRectMake(butX, butY, butWidth, butHeight);
    }
}




#pragma mark  私有方法
//根据touches 集合获得对用触摸点的位置
-(CGPoint) pointWithTouches:(NSSet *)touches
{
    
    UITouch  *touch =[touches anyObject];
    return [touch  locationInView:touch.view];
}



//根据触摸点获得对应的按钮
-(UIButton  *) buttonWithPoint :(CGPoint)  point{
    for (UIButton  *btn in  self.subviews ) {
        if (CGRectContainsPoint(btn.frame, point)) {
            return  btn;
        }
    }
    return  nil;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    //获得触摸点
    CGPoint   pos =[self  pointWithTouches:touches];
    //获得触摸的按钮
    UIButton  *btn =[self  buttonWithPoint:pos];
    //设置状态
#warning 一定要先判断数组为不为空 然后在设置状态 负责creash
    if (btn  &&btn.selected==NO) {
        btn.selected=YES;
        //把按钮添加到数组
        
        [self.selectButtons  addObject:btn];
        
    }
    //刷新
    [self  setNeedsDisplay];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //获得触摸点
    CGPoint   pos =[self  pointWithTouches:touches];
    //获得触摸的按钮
    UIButton  *btn =[self  buttonWithPoint:pos];
#warning 一定要先判断数组为不为空 然后在设置状态 负责creash
    if (btn  &&btn.selected==NO) {
        //设置状态
        btn.selected=YES;
        //把按钮添加到数组
        [self.selectButtons  addObject:btn];
    }
    //刷新
    [self  setNeedsDisplay];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event  {
    
    //取消按钮所有选中效果
//    for (UIButton *btn  in self.selectButtons) {
//        btn.selected=NO;
//    }
    [self.selectButtons  makeObjectsPerformSelector:@selector(setSelected:) withObject:@(NO)];
    
    //清空数组
    [self.selectButtons removeAllObjects];
    //重绘
    [self setNeedsDisplay];
    
    
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self  touchesEnded:touches withEvent:event];
    
}


//重写draw方法
-(void)drawRect:(CGRect)rect {
    
    if (self.selectButtons.count==0) return;
    
    //获得路径
    UIBezierPath  *path = [UIBezierPath  bezierPath];
    
    //遍历所有的按钮
    for (int index =0; index<self.selectButtons.count; index++) {
        UIButton  *but =self.selectButtons[index];
        if (index==0) {
            [path  moveToPoint:but.center];
        }else {
            [path  addLineToPoint:but.center];
        }
    }
    //绘图
    //线的宽度
    path.lineWidth =10;
    //颜色
    [[UIColor  greenColor]set];
    //绘制路径
    [path stroke];
    
    
    
}



/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
