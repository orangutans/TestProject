//
//  CellSelectAction.h
//  侧边栏
//
//  Created by 简学 on 16/9/29.
//  Copyright © 2016年 BigXin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellSelectAction : NSObject

@property (nonatomic,retain) NSIndexPath *indexPaht;

+(void)cellSelectActionSection:(NSInteger)section CellRow:(NSInteger)CellRow;
@end
