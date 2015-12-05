//
//  CheckBoxViewCell.m
//  TableViewCheck
//
//  Created by shavekevin on 15/12/5.
//  Copyright © 2015年 shaveKevin. All rights reserved.
//

#import "CheckBoxViewCell.h"
#import <Masonry.h>
@implementation CheckBoxViewCell

- (void)awakeFromNib {
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //
        _height = NO;
        [self layOutViews];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return  self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    _height = YES;
    // Configure the view for the selected state
    _chooseImageView.image = selected?[UIImage imageNamed:@"selected"]:[UIImage imageNamed:@"unselected"];
}
- (void)layOutViews {
    
    UIImage *selectImage = [UIImage imageNamed:@"selected"];
    _chooseImageView = [[UIImageView alloc]init];
    [self.contentView addSubview:_chooseImageView];
    [_chooseImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).with.offset(15);
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.width.mas_equalTo(selectImage.size.width);
        make.height.mas_equalTo(selectImage.size.height);
        
    }];
    _contentLabel = [UILabel new];
    _contentLabel.numberOfLines = 2;
    [self.contentView addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(_chooseImageView.mas_right).with.offset(15);
        make.right.equalTo(self.contentView).with.offset(-15);

    }];
}
@end
