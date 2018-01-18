//
//  myCollectionViewCell.m
//  collection
//
//  Created by VVVVVVVVVV on 2018/1/18.
//  Copyright © 2018年 huchenchen. All rights reserved.
//

#import "myCollectionViewCell.h"

@implementation myCollectionViewCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self add];
    }
    return self;
}

-(void)add
{
    self.labell = [[UILabel alloc]init];
    [self addSubview:self.labell];
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.labell.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}


@end
