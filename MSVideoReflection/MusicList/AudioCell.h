//
//  AudioCell
//  VideoReflection
//
//  Created by mr.scorpion on 5/22/16.
//  Copyright (c) 2016 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIGlossyButton.h"
#import "UIView+LayerEffects.h"

#define TableViewRowHeight 50

@interface AudioCell : UITableViewCell

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIGlossyButton *audioButton;
@property (strong, nonatomic) UIImageView *avatarView;

@end
