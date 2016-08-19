//
//  AudioViewController
//  VideoReflection
//
//  Created by mr.scorpion on 5/22/16.
//  Copyright (c) 2016 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonDefine.h"

@interface AudioViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>
{
}

@property (strong, nonatomic) NSMutableArray *allAudios;

@property (copy, nonatomic) GenericCallback seletedRowBlock;

@end
