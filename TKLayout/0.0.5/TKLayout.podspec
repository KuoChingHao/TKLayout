#
#  Be sure to run `pod spec lint TKLayout.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  spec.name         = "TKLayout"
  spec.version      = "0.0.5"
  spec.summary      = "Easy to use AutoLayout."

  spec.description  = <<-DESC
  
  AutoLayout Extension.
  
  Easy to use AutoLayout.
  
                   DESC

  spec.homepage     = "https://github.com/KuoChingHao/TKLayout"
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author             = { "Tank" => "zxm55547@gmail.com" }
  spec.source       = { :git => 'https://github.com/KuoChingHao/TKLayout.git', :tag => spec.version.to_s }
  spec.source_files  = "TKLayout/TKLayout/**/*"
  spec.exclude_files = "TKLayout/TKLayout/*.plist"
  spec.framework    = "UIKit"
  spec.ios.deployment_target = '9.0'
  spec.swift_version    = '5.0'
  
end
