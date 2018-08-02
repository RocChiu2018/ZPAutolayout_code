//
//  ViewController.m
//  代码实现Autolayout
//
//  Created by apple on 16/1/26.
//  Copyright © 2016年 sunco. All rights reserved.
//

/**
 使用Autolayout有四种方式：
 1、直接在xib文件中给相关的控件添加约束；
 2、在代码中调用相关的方法给相关的控件添加约束；
 3、在代码中利用VFL语言给相关的控件添加约束；
 4、在代码中利用第三方(Masonry)给相关的控件添加约束。
 
 上述的第二种方法中添加约束的时候要按照如下的原则进行添加：
 1、对于两个同层级控件之间的约束关系，要把约束添加到它们的父控件上；
 2、对于两个不同层级控件之间的约束关系，要把约束添加到它们最近的共同父控件上；
 3、对于有层次关系的两个控件之间的约束关系，要把约束添加到层次较高的父控件上。
 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark ————— 生命周期 —————
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self test1];
    
//    [self test2];
    
//    [self test3];
}

#pragma mark ————— 蓝色视图紧贴屏幕右下角 —————
-(void)test1
{
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;  //告诉系统不要将AutoresizingMask转为Autolayout的约束
    [self.view addSubview:blueView];
    
    /**
     创建约束的方法：
     +(id)constraintWithItem:(id)view1 attribute:(NSLayoutAttribute)attr1 relatedBy:(NSLayoutRelation)relation toItem:(id)view2 attribute:(NSLayoutAttribute)attr2 multiplier:(CGFloat)multiplier constant:(CGFloat)c;
     view1 ：要约束的控件
     attr1 ：约束的类型（做怎样的约束）
     relation ：与参照控件之间的关系
     view2 ：参照的控件
     attr2 ：约束的类型（做怎样的约束）
     multiplier ：乘数
     c ：常量
     */
    
    //设置控件的宽度约束为300
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:300];
    [blueView addConstraint:widthConstraint];
    
    //设置控件的高度约束为100
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:100];
    [blueView addConstraint:heightConstraint];
    
    //设置控件右边的约束：blueView的右边距离父控件的右边有10的距离
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
    [self.view addConstraint:rightConstraint];
    
    //设置控件底部的约束：blueView的底部距离父控件的底部有10的距离
    NSLayoutConstraint *bottonConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10];
    [self.view addConstraint:bottonConstraint];
}

#pragma mark ————— 蓝色视图在父视图中居中 —————
-(void)test2
{
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    //设置控件的宽度约束为父控件宽度的一半
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [self.view addConstraint:widthConstraint];
    
    //设置控件的高度约束为父控件高度的一半
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blueView.superview attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0];
    [self.view addConstraint:heightConstraint];
    
    //设置控件水平居中
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:blueView.superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.view addConstraint:centerXConstraint];
    
    //设置控件垂直居中
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:blueView.superview attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self.view addConstraint:centerYConstraint];
}

#pragma mark ————— 设置蓝色视图和红色视图的位置 —————
-(void)test3
{
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:blueView];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    /**********************蓝色视图**********************/
    //设置蓝色视图的高度约束为40
    NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0.0 constant:40];
    [blueView addConstraint:heightConstraint];
    
    //设置蓝色视图的左边与它的父视图的左边有20的间距
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20];
    [self.view addConstraint:leftConstraint];
    
    //设置蓝色视图的右边与它的父控件的右边有20的间距
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20];
    [self.view addConstraint:rightConstraint];
    
    //设置蓝色视图的顶部与它的父控件的顶部有20的间距
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:20];
    [self.view addConstraint:topConstraint];
    
    /**********************红色视图**********************/
    //设置红色视图与蓝色视图等高
    NSLayoutConstraint *heightConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0];
    [self.view addConstraint:heightConstraint2];
    
    //设置红色视图的左边等于父控件的中心点的x坐标
    NSLayoutConstraint *leftConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    [self.view addConstraint:leftConstraint2];
    
    //设置红色视图的顶部与蓝色视图的底部有20的距离
    NSLayoutConstraint *topConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20];
    [self.view addConstraint:topConstraint2];
    
    //设置红色视图的右边与蓝色视图的右边相等
    NSLayoutConstraint *rightConstraint2 = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    [self.view addConstraint:rightConstraint2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
