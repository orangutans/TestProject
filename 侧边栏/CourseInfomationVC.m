//
//  CourseInfomationVC.m
//  侧边栏
//
//  Created by 简学 on 16/9/29.
//  Copyright © 2016年 BigXin. All rights reserved.
//

#import "CourseInfomationVC.h"
#define LableY  64
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width


@interface CourseInfomationVC ()<UITextViewDelegate>
//所有控件的父视图
@property (nonatomic,strong)UIScrollView *scrollView;
@end

@implementation CourseInfomationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.delaysContentTouches =NO;
    [self.view addSubview:self.scrollView];
    
    
    //设置左边的lable 文字
    NSArray *arrLeftLable = [NSArray arrayWithObjects:@"授课者",@"课程难度",@"课程简介",@"课程概述",@"学习目标",@"是否显示学生人数", nil];
    for (int i = 0; i < arrLeftLable.count; i ++) {
        
        UILabel *lable = [[UILabel alloc]init];
        lable.frame = CGRectMake(10, 60 * i + 15, 60, 40);
        lable.text = arrLeftLable[i];
        lable.font = [UIFont systemFontOfSize:14];
        lable.textAlignment = NSTextAlignmentRight;
        lable.numberOfLines = 0;
        [self.scrollView addSubview:lable];
        
       
          NSArray *arrShoukeName  = [NSArray arrayWithObjects:@"个人授课  ",@"院校/机构授课", nil];
        NSArray *ShowHide  = [NSArray arrayWithObjects:@"是",@"否", nil];
        if (i == 0 || i == 5) {
            
            //设置一个view放按钮和lable
            UIView *viewShouke = [[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(lable.frame) + 10, 60 * i + 20, SCREEN_WIDTH - CGRectGetWidth(lable.frame) - 40, 30)];
            viewShouke.backgroundColor = [UIColor grayColor];
            [self.scrollView addSubview:viewShouke];
            
            //创建二个按钮，个人授课 和 学院机构授课
            for (int j = 0; j < 2; j++) {
                //设置按钮
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = CGRectMake(80 * j, 10 , 10, 10);
                btn.backgroundColor = [UIColor redColor];
                btn.tag = j + 200;
                [viewShouke addSubview:btn];
                
                //设置文字
                UILabel *lableshouke = [[UILabel alloc]init];
                lableshouke.frame = CGRectMake(CGRectGetMaxX(btn.frame) * j + 10, 0, 100,30);
                lableshouke.font = [UIFont systemFontOfSize:14];
                if (i == 0) {
                    lableshouke.text =  arrShoukeName[j];
                }else{
                    lableshouke.text =  ShowHide[j];
                }
                [viewShouke addSubview:lableshouke];
            }
        }else if(i  == 1)
        {
            NSArray *arr = [NSArray arrayWithObjects:@"容易",@"一般",@"困难", nil];
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(CGRectGetMaxX(lable.frame) + 10, CGRectGetMidY(lable.frame) - 15, SCREEN_WIDTH - CGRectGetWidth(lable.frame) - 40, 30);
            btn.backgroundColor = [UIColor greenColor];
            [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [btn setTitle:arr[0] forState:UIControlStateNormal];
            [self.scrollView addSubview:btn];
            
        }else if(i == 2 || i == 3 || i == 4 )
        {
            UITextView *textview = [[UITextView alloc]init];
            textview.frame = CGRectMake(CGRectGetMaxX(lable.frame) + 10, CGRectGetMidY(lable.frame) - 15, SCREEN_WIDTH - CGRectGetWidth(lable.frame) - 40, 40);
            textview.layer.borderColor = UIColor.grayColor.CGColor;
            textview.layer.borderWidth = 1;
            textview.textColor = [UIColor grayColor];
            [self.scrollView addSubview:textview];
        }else{}
    }
}

//设置课程难度的等级
-(void)btnClicked:(UIButton *)sender{
    
    UIButton *a = sender;
    NSInteger count = a.tag;
    NSLog(@"**************%ld***************",(long)count);
}

-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.frame = CGRectMake(0, 64, SCREEN_WIDTH,SCREEN_HEIGHT);

    }
    return _scrollView;
}
#pragma mark - ScrollViewDelegate

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [[self nextResponder] touchesEnded:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
}



@end
