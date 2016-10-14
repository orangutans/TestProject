//
//  CellSelectAction.m
//  侧边栏
//
//  Created by 简学 on 16/9/29.
//  Copyright © 2016年 BigXin. All rights reserved.
//

#import "CellSelectAction.h"
#import "CourseInfomationVCXib.h"

@implementation CellSelectAction

+(void)cellSelectActionSection:(NSInteger)section CellRow:(NSInteger)CellRow
{
    //第一个分区
    if (section == 0) {
        
        if (CellRow == 0)
        {
            NSLog(@"delegate : -- %ld -- %ld",(long)section , (long)CellRow);
            
//            CourseInfomationVCXib *sc1= [[CourseInfomationVCXib alloc]initWithNibName:@"CourseInfomationVCXib" bundle:[NSBundle mainBundle]];
//            [self  pushViewController:sc1 animated:YES];
//            [self ]

            
        }else if(CellRow == 1)
        {
            NSLog(@"delegate : -- %ld -- %ld",(long)section , (long)CellRow);
        }
        //第二个分区
    }else if (section == 1)
    {
        if (CellRow == 0)
        {
            NSLog(@"delegate : -- %ld -- %ld",(long)section , (long)CellRow);
            
        }else if(CellRow == 1)
        {
            
        }
        //第三个分区
    }else if(section == 2)
    {
        if (CellRow == 0)
        {
            
        }else if(CellRow== 1)
        {
            
        }
        //第四个分区
    }else if(section == 2)
    {
        if (CellRow == 0)
        {
            
        }else if(CellRow== 1)
        {
            
        }else if (CellRow == 2)
        {
            
        }
        //第五个分区
    }else if(section == 2)
    {
        if (CellRow == 0)
        {
            
        }else if(CellRow== 1)
        {
            
        }else if (CellRow == 2)
        {
            
        }else if(CellRow== 3)
        {
            
        }
        //第六个分区
    }else if(section == 2)
    {
        if (CellRow == 0)
        {
            
        }else if(CellRow== 1)
        {
            
        }else if(CellRow== 2)
        {
            
        }
        //第七个分区
    }else if(section == 2)
    {
        if (CellRow == 0)
        {
            
        }else if(CellRow== 1)
        {
            
        }else if(CellRow== 2)
        {
            
        }else if(CellRow== 3)
        {
            
        }
    }
}

@end
