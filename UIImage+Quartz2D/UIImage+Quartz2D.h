//
//  UIImage+Color.h
//  srsApp
//
//  Created by LS on 8/6/15.
//  Copyright (c) 2015 Chansha Aijian Communication Transmit Civilization CO.,LTD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Quartz2D)

+ (UIImage *)ds_imageNamed:(NSString *)name waterMark:(NSString *)mark;
+ (UIImage *)ds_circleImageWithNamed:(NSString *)name;
+ (UIImage *)ds_imageWithUIColor:(UIColor *)color;

@end
