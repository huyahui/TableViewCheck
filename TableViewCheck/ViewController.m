//
//  ViewController.m
//  TableViewCheck
//
//  Created by shavekevin on 15/12/5.
//  Copyright © 2015年 shaveKevin. All rights reserved.
//

#import "ViewController.h"
#import "PushViewController.h"
#import "CheckBoxViewCell.h"
#import <Masonry.h>

static CGFloat  const kDefaultCellHeight = 44;
static CGFloat  const kDefaultNavHeight = 64;
static NSString *const cellIdenfitier = @"checkBoxCell";

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kRenderColor(r,g,b,a)  [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a];

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, copy) NSString *contentS;
@property (nonatomic, assign) BOOL selectOrNot;
@property (nonatomic, strong) UIButton *uploadBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self setupUI];
    [self initWithData];
}

#pragma mark  -  设置UI  -
- (void)setupUI {
    
    self.title = @"单选";
    self.navigationController.navigationBar.barTintColor = kRenderColor(12, 142, 243, 1.0f);
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationItem.titleView.tintColor  = [UIColor whiteColor];
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor yellowColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc]init];
    [_tableView registerClass:[CheckBoxViewCell class] forCellReuseIdentifier:cellIdenfitier];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view).with.offset(0);
        make.bottom.equalTo(self.view).with.offset(kDefaultNavHeight);
        make.left.equalTo(self.view).with.offset(0);
        make.right.equalTo(self.view).with.offset(0);
        
    }];
    _uploadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _uploadBtn.backgroundColor = kRenderColor(12, 142, 243, 0.96);
    if (_selectOrNot) {
        [_uploadBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    [_uploadBtn setTitle:@"开始上传" forState:UIControlStateNormal];
    [_uploadBtn addTarget:self action:@selector(gotoPushVC) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_uploadBtn];
    
    [_uploadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.mas_equalTo(kDefaultNavHeight);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(0);
        make.left.equalTo(self.view).with.offset(0);
        make.right.equalTo(self.view).with.offset(0);
        
    }];
    
}

#pragma mark  - 初始化数据源 -
- (void)initWithData {
    
    _selectOrNot = NO;
    _titleArray = [[NSMutableArray alloc]initWithCapacity:0];
    _dataArray = [[NSMutableArray alloc]initWithCapacity:0];
    for (NSInteger i = 0 ; i < 3; i ++) {
        [_titleArray addObject:[NSString stringWithFormat:@"标题%ld",(long)i]];
    }
    for (NSInteger j = 0 ; j < 5; j ++) {
        [_dataArray addObject:[NSString stringWithFormat:@"内容--------------------------- %ld",(long)j]];
    }
    
}


#pragma mark  - tableview delegate -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return _titleArray.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = _titleArray[section];
    return _titleArray[section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return kDefaultCellHeight;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CheckBoxViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdenfitier];
    cell.contentLabel.text = _dataArray[indexPath.row];
    return cell;
    
}
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
// 
//    UILabel *titleLabel = [[UILabel alloc]init];
//    titleLabel.text = _titleArray[section];
//    return titleLabel;
//}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"选择了第%ld 行  第 %ld 列",indexPath.section,(long)indexPath.row);
    _contentS = _dataArray[indexPath.row];
    _selectOrNot = YES;
    [_uploadBtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
}
#pragma mark  - 跳转 -
- (void)gotoPushVC {
    
    NSLog(@"----_contentS-----%@",_contentS);
    if (_selectOrNot == YES) {
        
        PushViewController *pushVC = [[PushViewController alloc]init];
        [self.navigationController pushViewController:pushVC animated:YES];
    } else {
        NSLog(@"啥都没选 跳你妹啊");
    }

    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
