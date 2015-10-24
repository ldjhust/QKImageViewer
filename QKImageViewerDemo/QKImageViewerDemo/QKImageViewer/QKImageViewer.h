//
//  QKImageViewer.h
//  QKImageViewerDemo
//
//  Created by ldjhust on 10/23/15.
//  Copyright © 2015 HW. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QKImageViewer : NSObject <UIScrollViewDelegate>

- (void)showImageView:(UIImageView *)imageView atPoint:(CGPoint)centerPoint;

+ (QKImageViewer *)sharedQKImageViewer;

@end
