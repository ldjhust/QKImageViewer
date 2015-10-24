//
//  QKImageViewer.m
//  QKImageViewerDemo
//
//  Created by ldjhust on 10/23/15.
//  Copyright © 2015 HW. All rights reserved.
//

#import "QKImageViewer.h"

@interface QKImageViewer () {
  CGSize screenSize_; // 保存屏幕的尺寸以复用
  __weak UIWindow *keyWindow_; // 保存keyWindow以复用
  
  CGRect origrinalFrame_; // 被展示图片的原始frame
  CGRect newFrame_; // 图片第一次等比放大至全屏的尺寸
  __weak UIImageView *origrinalImageView_; // 被展示图片的弱引用，是的可以在本文件中使用
  UIScrollView *scrollView_; // 图片的缩放使用UIScrollView来实现
  UIImageView *contentImageView_; // 深拷贝原始图片，是的缩放操作不影响原始图片
}

/**
 一个动画，将scrollView通过渐现的方式呈现出来
 
 - parameter : NA
 
 - returns: NA
 */
- (void)startAnimation;
- (void)stopAnimation;

@end

@implementation QKImageViewer

#pragma mark - initailizer

- (instancetype)init {
  if (self = [super init]) {
    screenSize_ = [UIScreen mainScreen].bounds.size;
    keyWindow_ = [UIApplication sharedApplication].keyWindow;
  }
  
  return self;
}

#pragma mark - public api

- (void)showImageView:(UIImageView *)imageView atPoint:(CGPoint)centerPoint {
  origrinalFrame_ = imageView.frame;
  origrinalImageView_ = imageView;
  // 将这个imageView带到顶层，这样返回时不会被其它的subView遮住
  [imageView.superview bringSubviewToFront:imageView];
  
  scrollView_ = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
  scrollView_.backgroundColor = [UIColor blackColor];
  scrollView_.alpha = 0.0; // 一开始不可见
  
  contentImageView_ = [[UIImageView alloc] init];
  contentImageView_.center = centerPoint;
  contentImageView_.bounds = CGRectMake(0,
                                        0,
                                        origrinalFrame_.size.width,
                                        origrinalFrame_.size.height);
  contentImageView_.image = [imageView.image copy];
  
  UITapGestureRecognizer *tapToBack = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(stopAnimation)];
  // 在scrollView上单击就返回
  [scrollView_ addGestureRecognizer:tapToBack];
  
  // 将contentImageView添加到scrollView来承载缩放
  [scrollView_ addSubview:contentImageView_];
  // 将scrollView添加到keyWindow，这样可以放在屏幕最上层
  [keyWindow_ addSubview:scrollView_];
  
  // 动画显示在屏幕
  [self startAnimation];
}

#pragma mark - private method

- (void)startAnimation {
  [UIView animateWithDuration:0.3 animations:^{
    scrollView_.alpha = 1.0; // 由完全透明变为完全不透明
    // 图片等比放大
    contentImageView_.bounds = CGRectMake(0,
                                          0,
                                          screenSize_.width,
                                          origrinalFrame_.size.height/origrinalFrame_.size.width*screenSize_.width);
    // 图片放在屏幕中心
    contentImageView_.center = CGPointMake(screenSize_.width/2, screenSize_.height/2);
  }];
  newFrame_ = contentImageView_.frame;
  NSLog (@"%f %f %f %f", newFrame_.origin.x, newFrame_.origin.y, newFrame_.size.width, newFrame_.size.height);
}

- (void)stopAnimation {
  origrinalImageView_.frame = newFrame_;
  [scrollView_ removeFromSuperview];
  [UIView animateWithDuration:0.3 animations:^{
    origrinalImageView_.frame = origrinalFrame_;
  }];
}

#pragma makr - class method

+ (QKImageViewer *)sharedQKImageViewer {
  static dispatch_once_t onceToken;
  static QKImageViewer *_sharedQKImageView;
  
  dispatch_once(&onceToken, ^{
    _sharedQKImageView = [[QKImageViewer alloc] init];
  });
  
  return _sharedQKImageView;
}

@end
