//
//  CZHCustomCell.h
//  CZHAlertView
//
//  Created by 程召华 on 2018/4/27.
//  Copyright © 2018年 程召华. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CZHCustomModel : NSObject

///<#注释#>
@property (nonatomic, copy) NSString *content;
///<#注释#>
@property (nonatomic, copy) void (^selectHandler)(void);

+ (instancetype)czh_modelWithContent:(NSString *)content selectHandler:(void (^)(void))selectHandler;

@end

@interface CZHCustomCell : UITableViewCell

+ (instancetype)czh_cellWithTableView:(UITableView *)tableView;

- (void)czh_setCellDataWithModel:(CZHCustomModel *)model;

@end
