//
//  DemoViewController.m
//  QKImageViewerDemo
//
//  Created by ldjhust on 10/23/15.
//  Copyright © 2015 HW. All rights reserved.
//

#import "DemoViewController.h"
#import "QKImageViewer.h"

@interface DemoViewController () {
  __weak IBOutlet UIImageView *image1;
  __weak IBOutlet UIImageView *image2;
  __weak IBOutlet UIImageView *image3;
}

@end

@implementation DemoViewController

#pragma mark - view lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOne)];
  UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTwo)];
  UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapThree)];
  
  [image1 addGestureRecognizer:tap1];
  [image2 addGestureRecognizer:tap2];
  [image3 addGestureRecognizer:tap3];
}

#pragma mark - event response

- (void)tapOne {
  [[QKImageViewer sharedQKImageViewer] showImageView:image1 atPoint:image1.center];
}

- (void)tapTwo {
  [[QKImageViewer sharedQKImageViewer] showImageView:image2 atPoint:image2.center];
}

- (void)tapThree {
  [[QKImageViewer sharedQKImageViewer] showImageView:image3 atPoint:image3.center];
}

#pragma mark - handle memory warning

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

@end
