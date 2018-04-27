//
//  ViewController.m
//  CZHAlertView
//
//  Created by 程召华 on 2017/12/11.
//  Copyright © 2017年 程召华. All rights reserved.
//

#import "ViewController.h"
#import "CZHCustomCell.h"
#import "CZHAlertView.h"
#import "CZHHeader.h"



@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>

///<#注释#>
@property (nonatomic, weak) UITableView *tableView;
///
@property (nonatomic, strong) NSMutableArray *listArray;

@end

@implementation ViewController

- (NSMutableArray *)listArray {
    
    if (!_listArray) {
        
        
        CZHCustomModel *model1 = [CZHCustomModel czh_modelWithContent:@"alert有title和message" selectHandler:^{
            NSLog(@"----");
            CZHAlertView *alertView = [CZHAlertView czh_alertViewWithTitle:@"这是一个标题标题" message:@"这是message这是message这是message" preferredStyle:CZHAlertViewStyleAlert];
            
            CZHAlertItem *item = [CZHAlertItem czh_itemWithTitle:@"哈哈" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            [alertView czh_addAlertItem:item];
            
            [alertView czh_showView];

        }];
        
        CZHCustomModel *model2 = [CZHCustomModel czh_modelWithContent:@"alert有title没有message" selectHandler:^{
            
            NSLog(@"----");
            CZHAlertView *alertView = [CZHAlertView czh_alertViewWithTitle:@"这是一个标题标题" message:@"" preferredStyle:CZHAlertViewStyleAlert];
            
            CZHAlertItem *item = [CZHAlertItem czh_itemWithTitle:@"哈哈" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item1 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            [alertView czh_addAlertItem:item];
            [alertView czh_addAlertItem:item1];
            
            [alertView czh_showView];
            
        }];
        
        CZHCustomModel *model3 = [CZHCustomModel czh_modelWithContent:@"alert有message没有title" selectHandler:^{
            NSLog(@"----");
            CZHAlertView *alertView = [CZHAlertView czh_alertViewWithTitle:@"" message:@"这是一个标题标题奥术大师大所多" preferredStyle:CZHAlertViewStyleAlert];
            
            CZHAlertItem *item = [CZHAlertItem czh_itemWithTitle:@"哈哈" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item1 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item2 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦啊" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            [alertView czh_addAlertItem:item];
            [alertView czh_addAlertItem:item1];
            [alertView czh_addAlertItem:item2];
            
            [alertView czh_showView];
        }];
        
        CZHCustomModel *model4 = [CZHCustomModel czh_modelWithContent:@"alert没有title和message" selectHandler:^{
            CZHAlertView *alertView = [CZHAlertView czh_alertViewWithPreferredStyle:CZHAlertViewStyleAlert];
            
            CZHAlertItem *item = [CZHAlertItem czh_itemWithTitle:@"哈哈" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item1 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item2 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦啊" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            [alertView czh_addAlertItem:item];
            [alertView czh_addAlertItem:item1];
            [alertView czh_addAlertItem:item2];
            
            [alertView czh_showView];
        }];
        
        CZHCustomModel *model5 = [CZHCustomModel czh_modelWithContent:@"alert渐变显示" selectHandler:^{
            CZHAlertView *alertView = [CZHAlertView czh_alertViewWithTitle:@"哈哈哈哈哈哈哈哈" message:@"啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦" preferredStyle:CZHAlertViewStyleAlert animationStyle:CZHAlertViewAnimationStyleTransparent];
            
            CZHAlertItem *item = [CZHAlertItem czh_itemWithTitle:@"哈哈" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item1 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item2 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦啊" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            [alertView czh_addAlertItem:item];
            [alertView czh_addAlertItem:item1];
            [alertView czh_addAlertItem:item2];
            
            [alertView czh_showView];
        }];
        
        CZHCustomModel *model6 = [CZHCustomModel czh_modelWithContent:@"alert从下往上显示" selectHandler:^{
            CZHAlertView *alertView = [CZHAlertView czh_alertViewWithTitle:@"哈哈哈哈哈哈哈哈" message:@"啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦" preferredStyle:CZHAlertViewStyleAlert animationStyle:CZHAlertViewAnimationStyleSlideFromBottom];
            
            CZHAlertItem *item = [CZHAlertItem czh_itemWithTitle:@"哈哈" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item1 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item2 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦啊" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            [alertView czh_addAlertItem:item];
            [alertView czh_addAlertItem:item1];
            [alertView czh_addAlertItem:item2];
            
            [alertView czh_showView];
        }];
        
        CZHCustomModel *model7 = [CZHCustomModel czh_modelWithContent:@"sheet有title和message" selectHandler:^{
            CZHAlertView *alertView = [CZHAlertView czh_alertViewWithTitle:@"这是一个标题标题" message:@"这是message这是message这是message" preferredStyle:CZHAlertViewStyleActionSheet];
            
            CZHAlertItem *item = [CZHAlertItem czh_itemWithTitle:@"哈哈" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            [alertView czh_addAlertItem:item];
            
            [alertView czh_showView];
        }];
        
        CZHCustomModel *model8 = [CZHCustomModel czh_modelWithContent:@"sheet有title没有message" selectHandler:^{
            NSLog(@"----");
            CZHAlertView *alertView = [CZHAlertView czh_alertViewWithTitle:@"这是一个标题标题爱上你别的马上把代码不舍得" message:@"" preferredStyle:CZHAlertViewStyleActionSheet];
            
            CZHAlertItem *item = [CZHAlertItem czh_itemWithTitle:@"哈哈" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item1 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            [alertView czh_addAlertItem:item];
            [alertView czh_addAlertItem:item1];
            
            [alertView czh_showView];
        }];
        
        CZHCustomModel *model9 = [CZHCustomModel czh_modelWithContent:@"sheet有message没有title" selectHandler:^{
            CZHAlertView *alertView = [CZHAlertView czh_alertViewWithTitle:@"" message:@"这是一个标题标题奥术大师大所多安达市大所大所大所爱打电话" preferredStyle:CZHAlertViewStyleActionSheet];
            
            CZHAlertItem *item = [CZHAlertItem czh_itemWithTitle:@"哈哈" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item1 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item2 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦啊" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            [alertView czh_addAlertItem:item];
            [alertView czh_addAlertItem:item1];
            [alertView czh_addAlertItem:item2];
            
            [alertView czh_showView];
        }];
        
        CZHCustomModel *model10 = [CZHCustomModel czh_modelWithContent:@"sheet没有title和message" selectHandler:^{
            CZHAlertView *alertView = [CZHAlertView czh_alertViewWithPreferredStyle:CZHAlertViewStyleActionSheet];
            
            CZHAlertItem *item = [CZHAlertItem czh_itemWithTitle:@"哈哈" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item1 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item2 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦啊" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            [alertView czh_addAlertItem:item];
            [alertView czh_addAlertItem:item1];
            [alertView czh_addAlertItem:item2];
            
            [alertView czh_showView];
        }];
        
        
        CZHCustomModel *model11 = [CZHCustomModel czh_modelWithContent:@"sheet渐变显示" selectHandler:^{
            CZHAlertView *alertView = [CZHAlertView czh_alertViewWithTitle:@"哈哈哈哈哈哈哈哈" message:@"啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦" preferredStyle:CZHAlertViewStyleActionSheet animationStyle:CZHAlertViewAnimationStyleTransparent];
            
            CZHAlertItem *item = [CZHAlertItem czh_itemWithTitle:@"哈哈" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item1 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item2 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦啊" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            [alertView czh_addAlertItem:item];
            [alertView czh_addAlertItem:item1];
            [alertView czh_addAlertItem:item2];
            
            [alertView czh_showView];
        }];
        
        CZHCustomModel *model12 = [CZHCustomModel czh_modelWithContent:@"sheet从下往上显示" selectHandler:^{
            CZHAlertView *alertView = [CZHAlertView czh_alertViewWithTitle:@"哈哈哈哈哈哈哈哈" message:@"啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦" preferredStyle:CZHAlertViewStyleActionSheet animationStyle:CZHAlertViewAnimationStyleSlideFromBottom];
            
            CZHAlertItem *item = [CZHAlertItem czh_itemWithTitle:@"哈哈" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item1 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item2 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦啊" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            [alertView czh_addAlertItem:item];
            [alertView czh_addAlertItem:item1];
            [alertView czh_addAlertItem:item2];
            
            [alertView czh_showView];
        }];
        
        
        CZHCustomModel *model13 = [CZHCustomModel czh_modelWithContent:@"sheet从下往上显示,并且有一个取消类型的" selectHandler:^{
            CZHAlertView *alertView = [CZHAlertView czh_alertViewWithTitle:@"哈哈哈哈哈哈哈哈" message:@"啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦" preferredStyle:CZHAlertViewStyleActionSheet animationStyle:CZHAlertViewAnimationStyleSlideFromBottom];
            
            CZHAlertItem *item = [CZHAlertItem czh_itemWithTitle:@"取消" style:CZHAlertItemStyleCancel handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item1 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item2 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦啊" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            [alertView czh_addAlertItem:item];
            [alertView czh_addAlertItem:item1];
            [alertView czh_addAlertItem:item2];
            
            [alertView czh_showView];
        }];
        
        
        CZHCustomModel *model14 = [CZHCustomModel czh_modelWithContent:@"sheet从下往上显示,并且有多个取消类型的" selectHandler:^{
            CZHAlertView *alertView = [CZHAlertView czh_alertViewWithTitle:@"哈哈哈哈哈哈哈哈" message:@"啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦" preferredStyle:CZHAlertViewStyleActionSheet animationStyle:CZHAlertViewAnimationStyleSlideFromBottom];
            
            CZHAlertItem *item = [CZHAlertItem czh_itemWithTitle:@"取消" style:CZHAlertItemStyleCancel handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item1 = [CZHAlertItem czh_itemWithTitle:@"取消2" style:CZHAlertItemStyleCancel handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item2 = [CZHAlertItem czh_itemWithTitle:@"啦啦啦啊" style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            [alertView czh_addAlertItem:item];
            [alertView czh_addAlertItem:item1];
            [alertView czh_addAlertItem:item2];
            
            [alertView czh_showView];
        }];
        
        
        CZHCustomModel *model15 = [CZHCustomModel czh_modelWithContent:@"自定义按钮样式" selectHandler:^{
            CZHAlertView *alertView = [CZHAlertView czh_alertViewWithTitle:@"哈哈哈哈哈哈哈哈" message:@"啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦啦" preferredStyle:CZHAlertViewStyleActionSheet animationStyle:CZHAlertViewAnimationStyleSlideFromBottom];
            
            CZHAlertItem *item = [CZHAlertItem czh_itemWithTitle:@"取消" style:CZHAlertItemStyleCancel handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item1 = [CZHAlertItem czh_itemWithTitle:@"取消2" titleFont:CZHGlobelNormalFont(15) titleColor:CZHColor(0x0000ff) style:CZHAlertItemStyleCancel handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            CZHAlertItem *item2 = [CZHAlertItem czh_itemWithTitle:@"自定义的按钮样式" titleFont:CZHGlobelNormalFont(12) titleColor:CZHColor(0x00ff00) style:CZHAlertItemStyleDefault handler:^(CZHAlertItem *item) {
                NSLog(@"---点击了");
            }];
            
            [alertView czh_addAlertItem:item];
            [alertView czh_addAlertItem:item1];
            [alertView czh_addAlertItem:item2];
            
            [alertView czh_showView];
        }];
        
        CZHCustomModel *model16 = [CZHCustomModel czh_modelWithContent:@"什么都没有" selectHandler:^{
            
            CZHAlertView *alertView = [CZHAlertView czh_alertViewWithPreferredStyle:CZHAlertViewStyleActionSheet];

            [alertView czh_showView];
            
        }];
        
        NSArray *array = @[model1, model2, model3, model4, model5, model6, model7, model8, model9, model10, model11, model12, model13, model14, model15, model16];
        _listArray = [NSMutableArray array];
        [_listArray addObjectsFromArray:array];
    }
    
    return _listArray;
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"CZHAlertview";
    
    [self czh_setUpView];
    
}

- (void)czh_setUpView {
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    tableView.tableFooterView = [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.listArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CZHCustomCell *cell = [CZHCustomCell czh_cellWithTableView:tableView];
    
    [cell czh_setCellDataWithModel:self.listArray[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CZHCustomModel *model = self.listArray[indexPath.row];
    
    if (model.selectHandler) {
        model.selectHandler();
    }
    
}


@end
