//
//  MyLockView.h
//  收拾解锁LockScreen
//
//  Created by AmberWhiteSky on 15/9/25.
//  Copyright © 2015年 AmberWhiteSky. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyLockView;
@protocol MyLockViewDelegate <NSObject>

@optional
-(void)  lockView:(MyLockView *)  lockView  didFinish:(NSString  *) path;
@end

@interface MyLockView : UIView

@property(nonatomic,weak)  IBOutlet id<MyLockViewDelegate>  delegate;
@end
