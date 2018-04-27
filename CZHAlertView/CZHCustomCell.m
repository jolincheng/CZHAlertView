//
//  CZHCustomCell.m
//  CZHAlertView
//
//  Created by 程召华 on 2018/4/27.
//  Copyright © 2018年 程召华. All rights reserved.
//

#import "CZHCustomCell.h"


@implementation CZHCustomModel

+ (instancetype)czh_modelWithContent:(NSString *)content selectHandler:(void (^)(void))selectHandler {
    return [[CZHCustomModel alloc] initWithModelWithContent:content selectHandler:selectHandler];
}

- (instancetype)initWithModelWithContent:(NSString *)content selectHandler:(void (^)(void))selectHandler {
    
    if (self = [super init]) {
        
        self.content = content;
        self.selectHandler = selectHandler;
        
    }
    return self;
}

@end

static NSString *const reuseId = @"CZHCustomCell";
@implementation CZHCustomCell


+ (instancetype)czh_cellWithTableView:(UITableView *)tableView {
    
    CZHCustomCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseId];
    
    if (!cell) {
        cell = [[CZHCustomCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseId];
    }
    
    
    
    return cell;
    
}


- (void)czh_setCellDataWithModel:(CZHCustomModel *)model {
    
    self.textLabel.text = model.content;
    
}



@end
