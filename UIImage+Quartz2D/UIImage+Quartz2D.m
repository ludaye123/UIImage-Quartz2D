//
//  UIImage+Color.m
//  srsApp
//
//  Created by LS on 8/6/15.
//  Copyright (c) 2015 Chansha Aijian Communication Transmit Civilization CO.,LTD. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Quartz2D)

+ (UIImage *)ds_imageNamed:(NSString *)name waterMark:(NSString *)mark
{
    CGFloat textWidth = 0;
    UIImage *originImage = [self imageNamed:name];
    textWidth = [mark boundingRectWithSize:CGSizeMake(MAXFLOAT, 20.0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15.0]} context:nil].size.width;
    UIGraphicsBeginImageContextWithOptions(originImage.size, NO, 0.0);
    [originImage drawAtPoint:CGPointZero];
    [mark drawAtPoint:CGPointMake(10.0,5.0) withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22.0],NSForegroundColorAttributeName:[UIColor redColor]}];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)ds_circleImageWithNamed:(NSString *)name
{
    UIImage *originImage = [self imageNamed:name];
    CGFloat newImageW = originImage.size.width < originImage.size.height? originImage.size.width : originImage.size.height;
    UIGraphicsBeginImageContextWithOptions(originImage.size, NO, 0.0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0.0, 0.0, newImageW, newImageW)];
    [path addClip];
    [originImage drawAtPoint:CGPointZero];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (UIImage *)ds_imageWithUIColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0, 0.0, 10.0, 10.0);
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
