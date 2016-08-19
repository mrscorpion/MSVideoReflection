//
//  VideoAnimationLayer
//  VideoReflection
//
//  Created by mr.scorpion on 5/22/16.
//  Copyright (c) 2016 mr.scorpion. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface VideoAnimationLayer : CALayer
{
}

@property (nonatomic,strong) NSString *videoFilePath;

+ (VideoAnimationLayer *)sharedInstance;

+ (id)layerWithVideoFilePath:(NSString *)filePath withFrame:(CGRect)frame;
- (void)startAnimation;

- (CGFloat)captureVideoSample:(NSURL *)videoURL saveToCGImage:(BOOL)saveToCGImage;
- (NSMutableArray *)getImageVideoFrames;
- (CGFloat)getVideoDuration;

@end
