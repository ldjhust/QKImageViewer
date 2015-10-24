Pod::Spec.new do |s|
  s.name         = "QKImageViewer"
  s.version      = "1.0"
  s.summary      = "A light weight framework that simulate WeiXin's image viewer use Objective-C."

  s.homepage     = "https://github.com/ldjhust/QKImageViewer"

  s.license      = { :type => "MIT" }

  s.author             = { "ldjhust" => "lidongjie2008@gmail.com" }

  s.platform     = :ios
  s.platform     = :ios, "8.0"

  s.source       = { :git => "https://github.com/ldjhust/QKImageViewer.git", :tag => "1.0" }

  s.source_files  = "QKImageViewerDemo/QKImageViewerDemo/QKImageViewer/*.{h,m}"

  s.requires_arc = true
end
