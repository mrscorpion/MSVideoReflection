//
//  ViewController.m
//  MSVideoReflection
//
//  Created by mr.scorpion on 16/5/19.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "ViewController.h"
#import "ReflectionViewController.h"
#import "UIButton+Block.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *addButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addButton = [UIButton buttonWithType:UIButtonTypeInfoDark];
    [self.view addSubview:self.addButton];
    self.addButton.frame = CGRectMake(100, 300, 100, 100);
    __weak typeof(self) weakSelf = self;
    [self.addButton addActionHandler:^(NSInteger tag) {
        ReflectionViewController *reflectionVC = [[ReflectionViewController alloc] init];
        [weakSelf.navigationController pushViewController:reflectionVC animated:NO];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
