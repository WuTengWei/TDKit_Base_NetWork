

Pod::Spec.new do |s|
  s.name             = 'TDKit_Base_NetWork'
  s.version          = '0.1.1'
  s.summary          = 'A short description of TDKit_Base_NetWork.'
  s.description      = <<-DESC
  Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/wutengwei/TDKit_Base_NetWork'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wutengwei' => '13691365870@126.com' }
  s.source           = { :git => 'https://github.com/WuTengWei/TDKit_Base_NetWork.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  s.swift_version = '5.0'
  s.static_framework = true
  s.framework = 'UIKit'
  
  s.source_files = 'TDKit_Base_NetWork/Classes/**/*'
  s.default_subspec = "Core"
  
   s.resource_bundles = {
     'TDKit_Base_NetWork' => [
     'TDKit_Base_NetWork/Assets/*{.storyboard,.xcassets}',
     'TDKit_Base_NetWork/Assets/**/*'
     ]
   }
   
   # 核心模块
    s.subspec 'Core' do |subspec|
    
        subspec.dependency 'RxSwift'
    
    end
   
   # 微信模块
   s.subspec 'WeChatPay' do |subspec|
     subspec.dependency 'TDKit_Base_NetWork/Core'
     subspec.frameworks = 'CFNetwork', 'CoreMotion', 'Foundation', 'CoreGraphics', 'SystemConfiguration', 'UIKit', 'CoreText', 'QuartzCore', 'CoreTelephony'
     subspec.xcconfig = { 'OTHER_LDFLAGS' => '-ObjC' }
     subspec.libraries = 'z', 'sqlite3.0', 'c++'
     subspec.source_files = 'TDKit_Base_NetWork/WeChatPay/*.h'
     subspec.vendored_libraries = 'TDKit_Base_NetWork/WeChatPay/libWeChatSDK.a'
   end
   
   
#   # 支付宝模块
#    s.subspec 'AliPay' do |subspec|
#      subspec.dependency 'TDKit_Base_NetWork/Core'
#      subspec.frameworks = 'CFNetwork', 'CoreMotion', 'Foundation', 'CoreGraphics', 'SystemConfiguration', 'UIKit', 'CoreText', 'QuartzCore', 'CoreTelephony'
#      subspec.libraries = 'z', 'sqlite3.0', 'c++'
#      subspec.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-ObjC -all_load' }
#      subspec.source_files = 'TDKit_Base_NetWork/AliPay/*','TDKit_Base_NetWork/AliPay/AlipaySDK.framework/Headers/*.h'
#      subspec.vendored_frameworks = 'TDKit_Base_NetWork/AliPay/AlipaySDK.framework'
#      subspec.resources = ['TDKit_Base_NetWork/AliPay/AlipaySDK.bundle']
#      subspec.preserve_paths = 'TDKit_Base_NetWork/AliPay/module.modulemap'
#    end

    # 支付宝模块
    s.subspec 'AliPay' do |subspec|
      subspec.dependency 'TDKit_Base_NetWork/Core'
      subspec.frameworks = 'CFNetwork', 'CoreMotion', 'Foundation', 'CoreGraphics', 'SystemConfiguration', 'UIKit', 'CoreText', 'QuartzCore', 'CoreTelephony'
      subspec.libraries = 'z', 'sqlite3.0', 'c++'
      subspec.pod_target_xcconfig = { 'OTHER_LDFLAGS' => '-ObjC -all_load' }
      subspec.source_files = 'TDKit_Base_NetWork/AliPay/AlipaySDK.framework/Headers/*.h'
      subspec.public_header_files = 'TDKit_Base_NetWork/AliPay/AlipaySDK.framework/Headers/*.h'
      subspec.vendored_frameworks = 'TDKit_Base_NetWork/AliPay/AlipaySDK.framework'
      subspec.resources = ['TDKit_Base_NetWork/AliPay/AlipaySDK.bundle']
      subspec.preserve_paths = 'TDKit_Base_NetWork/AliPay/AlipaySDK.framework'
    end
end
