//
//  CheckBoxViewCell.h
//  TableViewCheck
//
//  Created by shavekevin on 15/12/5.
//  Copyright © 2015年 shaveKevin. All rights reserved.
//
/**
 *  封装单选框
 *
 *  @param nonatomic <#nonatomic description#>
 *  @param strong    <#strong description#>
 *
 *  @return <#return value description#>
 */
#import <UIKit/UIKit.h>

@interface CheckBoxViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *chooseImageView;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, assign) BOOL height;
@end
