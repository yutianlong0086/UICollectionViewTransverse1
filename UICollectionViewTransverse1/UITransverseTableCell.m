//
//  UITransverseTableCell.m
//  collectionViewTransverse
//
//  Created by 余天龙 on 16/7/11.
//  Copyright © 2016年 YuTianLong. All rights reserved.
//

#import "UITransverseTableCell.h"
#import "Masonry.h"
#import "UIContainerCollectionView.h"

@interface UITransverseTableCell ()

@property (nonatomic, strong) UIContainerCollectionView *containerView;

@end

@implementation UITransverseTableCell

+ (NSString *)reuseIdentifier {
    return @"TRANSVERSE_CELL";
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    WEAK_SELF();
    self.containerView = [UIContainerCollectionView new];
//    self.containerView.scrollType = WBScrollTypeFree;  //设置减速效果
    [self.containerView setPointChangeBlock:^(NSValue *pointValue) {
        weakSelf.pointChangeBlock(pointValue);
    }];
    
    [self.containerView setDidSelectItemBlock:^(NSUInteger section, NSUInteger row) {
        weakSelf.didSelectItemBlock(section, row);
    }];
    [self.contentView addSubview:self.containerView];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.bottom.equalTo(@0);
    }];
}

- (void)setupWithDataSource:(NSArray<id> *)dataSource pointValue:(NSValue *)pointValue {
    [self.containerView setupWithDataSource:dataSource pointValue:pointValue];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
