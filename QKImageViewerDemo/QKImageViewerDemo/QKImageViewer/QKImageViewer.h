//
//  QKImageViewer.h
//  QKImageViewerDemo
//
//  Created by ldjhust on 10/23/15.
//  Copyright © 2015 HW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QKImageViewer : NSObject

/**
 这个方法用来完成所有必要的初始化
 
 - parameter imageView:    需要被查看的图片视图(注意请传入图片所在的ImageView)
 - parameter atPoint: 这个点会被用来作为图片在屏幕上的中心点(center)，建议传入被查看图片的在屏幕上的中心坐标
 
 - returns: NA
 */
- (void)showImageView:(UIImageView *)imageView atPoint:(CGPoint)centerPoint;

+ (QKImageViewer *)sharedQKImageViewer;

@end
