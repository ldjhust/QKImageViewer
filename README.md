# QKImageViewer

# Introduction
A lightweight framework that simulate WeiXin's image viewer use Objective-C.

use Xcode 7.0 to run the sample code.

![(shown)](https://github.com/ldjhust/QKImageViewer/blob/master/show.gif)

### Feature
- [x] show local image view
- [ ] show remote image view with url

# Installation
### CocoaPods
To integrate QKImageViewer into your Xcode project using CocoaPods, specify it in your `Podfile` like download:

```ruby
platform :ios, '8.0'
use_frameworks!

pod 'QKImageViewer', '~> 1.0'
```

Then, run the following command line in your terminal:

```bash
$ pod install
```

### Manually
If you prefer not to use CocoaPods, you can integrate QKImageViewer into your project manually. Download the source code, and then drag the QKImageViewer/*.{h,m} into your project.

# Usage
```swift
import QKImageViewer

[[QKImageViewer sharedQKImageViewer] showImageView:image1 atPoint:image1.center];
```

# License

QKImageViewer is released under the MIT license. See LICENSE for details.

