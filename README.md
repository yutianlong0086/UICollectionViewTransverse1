# UICollectionViewTransverse1

#### Paging Effect

![GIF](https://github.com/yutianlong0086/UICollectionViewTransverse1/blob/master/UICollectionViewTransverse1/1-page.gif)


##  Related introduction Blog

<a href="http://blog.csdn.net/yutianlong9306/article/details/51994314">http://blog.csdn.net/yutianlong9306/article/details/51994314</a>


#### UIContainerCollectionView.h  

``` objective-c

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, WBScrollType) {

    WBScrollTypeFree ,      //自由惯性
    WBScrollTypePage        //分页的
};

@interface UIContainerCollectionView : UIView

- (void)setupWithDataSource:(NSArray<id> *)dataSource pointValue:(NSValue *)pointValue;

@property (nonatomic, copy) void (^pointChangeBlock)(NSValue *pointValue);

@property (nonatomic, assign) WBScrollType scrollType;      //默认是分页的

@property (nonatomic, copy) void (^didSelectItemBlock)(NSUInteger section, NSUInteger row);

@end

```

#### Method of use

``` objective-c

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

```




