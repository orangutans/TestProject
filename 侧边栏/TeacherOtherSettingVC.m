//
//  TeacherOtherSettingVC.m
//  侧边栏
//
//  Created by 简学 on 16/9/28.
//  Copyright © 2016年 BigXin. All rights reserved.
//

#import "TeacherOtherSettingVC.h"
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#import "CellSelectAction.h"
#import "CourseInfomationVCXib.h"
#import "CourseInfomationVC.h"

@interface TeacherOtherSettingVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain)UIView *views;
@property (nonatomic,retain)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *arrSection;
@property (nonatomic,strong)NSMutableDictionary *dict;
@property (nonatomic,strong)NSMutableArray *allSubViewCell;

//课程详情
@property (nonatomic,strong)NSMutableArray *courseInfo;

//授课安排
@property (nonatomic,strong)NSMutableArray *lecturePlan;

//课件资料
@property (nonatomic,strong)NSMutableArray *courseWare;

//题目测试
@property (nonatomic,strong)NSMutableArray *subjectTest;

//成绩设定
@property (nonatomic,strong)NSMutableArray *scoreSetting;

//成员管理
@property (nonatomic,strong)NSMutableArray *members;

//高级设置
@property (nonatomic,strong)NSMutableArray *higherSetting;


@property (nonatomic,strong)UIScrollView *scrollView;


@end

static NSString *CellID = @"TABLEVIEWCELL";

@implementation TeacherOtherSettingVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.views addSubview:self.tableView];
    [self.view addSubview:self.scrollView];
    
    //存放所有的二级视图的cell
    self.allSubViewCell = [NSMutableArray arrayWithObjects:self.courseInfo,self.lecturePlan,self.courseWare,self.subjectTest,self.scoreSetting,self.members,self.higherSetting, nil];
    
    CGRect backframe = CGRectMake(0,0,54,30);
    UIButton* backButton= [[UIButton alloc] initWithFrame:backframe];
    [backButton setTitle:@"点击" forState:UIControlStateNormal];
    backButton.titleLabel.font=[UIFont systemFontOfSize:13];
    [backButton addTarget:self action:@selector(doClickBackAction:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem* leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftBarButtonItem;
    
    //记录的字典
    self.dict = [NSMutableDictionary dictionary];
    //每组的标题
    //去除tableView多余的横线
    self.tableView.tableFooterView = [[UIView alloc] init];
    
}

-(void)doClickBackAction:(UIButton *)item
{
    item.selected =!item.selected;
    if (item.selected == YES) {
        
//  [UIView animateWithDuration:100 animations:^{
        self.views.frame = CGRectMake([UIScreen mainScreen].bounds.size.width*0.5,64, [UIScreen mainScreen].bounds.size.width*0.5,[UIScreen mainScreen].bounds.size.height - 64);
        self.views.backgroundColor = [UIColor orangeColor];
        self.views.hidden = NO;
        [self.view addSubview:self.views];
//  }];
        
    }else
    {
        self.views.hidden = YES;
    }
}

#define mark - tableViewDatasure
//每组的组头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH*0.5,44)];
    view.backgroundColor = [UIColor cyanColor];
    view.userInteractionEnabled = YES;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, (44-20)/2 - 8, SCREEN_WIDTH*0.5, 20)];
    //每个分区的区头
    label.text = self.arrSection[section];
    label.font = [UIFont systemFontOfSize:14];
    [view addSubview:label];
    //view的tag就等于section 代表点击了哪一个组
    view.tag = section;
    [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapGestureTouch:)]];
    return view;
}

- (void)TapGestureTouch:(UITapGestureRecognizer *)g{
    //将点击了哪一组转换成字符串
    NSString *str = [NSString stringWithFormat:@"%ld",g.view.tag];
    //从字典里面以第几组为key取出状态值

    //如果状态值为0，代表关闭
    if ([self.dict[str] integerValue] == 0){
        [self.dict setObject:@(1) forKey:str];
    } else {
        //如果状态值为不为0，代表展开
        [self.dict setObject:@(0) forKey:str];
    }
    //一定要刷新tabelView，不然没有效果
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.arrSection.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    /*调用tableView的reloadData方法会重新调用这个方法
     从而从字典里面取出相应组对应的状态码，从而判断是需要展开还是收起
     */
    NSString *str =   [NSString stringWithFormat:@"%ld",section];
    //将点击了哪一组转换成字符串
    if([self.dict[str] integerValue] == 1){
       return [[self.allSubViewCell objectAtIndex:section] count]; //取dataArray中的元素，并根据每个元素（数组）来判断分区中的行数。
    }else{
        //如果状态值为等于0，代表需要收起返回0
        return 0;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        UIView *view = [[UIView alloc] initWithFrame:cell.bounds];
        view.layer.backgroundColor = [UIColor whiteColor].CGColor;
        view.layer.masksToBounds = YES;
        view.layer.borderWidth  = 0.3;
        view.layer.borderColor  = [UIColor lightGrayColor].CGColor;
        
        cell.backgroundView = view;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        
        [[cell textLabel] setText:[[self.allSubViewCell objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]];
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"%ld -- %ld",(long)indexPath.section , (long)indexPath.row);
    
//    CourseInfomationVCXib *sc1= [[CourseInfomationVCXib alloc]initWithNibName:@"CourseInfomationVCXib" bundle:[NSBundle mainBundle]];
//    
//    [self.view addSubview:sc1.view];
////    [self.navigationController  pushViewController:sc1 animated:YES];
//
//    
//    [CellSelectAction cellSelectActionSection:indexPath.section CellRow:indexPath.row];
    
    
    CourseInfomationVC *vc = [[CourseInfomationVC alloc]init];
    [self.view addSubview:vc.view];
}

#pragma mark ----------------------------懒加载--------------------------------

-(UIView *)views
{
    if (!_views) {
        _views = [[UIView alloc]init];
    }
    return _views;
}
-(UITableView *)tableView
{
    if (!_tableView) {
        CGRect frame = CGRectMake(0, 0, SCREEN_WIDTH*0.5,SCREEN_HEIGHT - 64);
        
        _tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
        
    }
    return _tableView;
}



-(NSMutableArray *)arrSection
{
    if (!_arrSection) {
        _arrSection = [NSMutableArray arrayWithObjects:@"课程详情",@"授课安排"@"课件资料",@"题目测试",@"成绩设定",@"成员管理",@"高级设置",nil];
    }
    return _arrSection;
}

-(NSMutableArray *)allSubViewCell
{
    if (!_allSubViewCell) {
        _allSubViewCell = [NSMutableArray array];
    }
    return _allSubViewCell;
}

#pragma mark --------------------------设置分区的cell的初始化-------------------------

//课程详情
-(NSMutableArray *)courseInfo
{
    if (!_courseInfo) {
        _courseInfo = [NSMutableArray arrayWithObjects:@"基本信息",@"宣传视频", nil];
        
    }
    return _courseInfo;
}

//授课安排
-(NSMutableArray *)lecturePlan
{
    if (!_lecturePlan) {
        _lecturePlan = [NSMutableArray arrayWithObjects:@"教学计划",@"公告管理", nil];
    }
    return _lecturePlan;
}

//课件资料
-(NSMutableArray *)courseWare
{
    if (!_courseWare) {
        _courseWare = [NSMutableArray arrayWithObjects:@"课件管理",@"拓展资料", nil];
    }
    return _courseWare;
}

//题目测试
-(NSMutableArray *)subjectTest
{
    if (!_subjectTest) {
        _subjectTest = [NSMutableArray arrayWithObjects:@"题库管理",@"作业管理",@"测验", nil];
    }
    return _subjectTest;
}


//成绩设定
-(NSMutableArray *)scoreSetting
{
    if (!_scoreSetting) {
        _scoreSetting = [NSMutableArray arrayWithObjects:@"考核标准",@"学生成绩",@"作业得分设置",@"测验得分设置", nil];
    }
    return _scoreSetting;
}

//成员管理
-(NSMutableArray *)members
{
    if (!_members) {
        _members = [NSMutableArray arrayWithObjects:@"教师助教",@"学生管理",@"班级管理", nil];
    }
    return _members;
}

//高级设置
-(NSMutableArray *)higherSetting
{
    if (!_higherSetting) {
        _higherSetting = [NSMutableArray arrayWithObjects:@"教学场景",@"收费设置",@"课程密码",@"课程复制", nil];
    }
    return _higherSetting;
}


-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.frame = CGRectMake(0, 64,SCREEN_WIDTH, SCREEN_HEIGHT);
        _scrollView.backgroundColor = [UIColor grayColor];
    }
    return _scrollView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
