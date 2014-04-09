Pod::Spec.new do |s|

  s.name         = "ZLMulticastAgent"
  s.version      = "v0.0.1"
  s.summary      = "An implementation of MulticastAgent."
  s.description  = "Put simply it`s a kind of Multi-Delegate mode"
  s.homepage     = "https://github.com/zhuocheng/ZLMulticastAgent"
  s.license      = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }

  s.author           = { "李卓成" => "zhuocheng.lee@gmail.com" }
  s.social_media_url = "http://www.renren.com/428049345/profile"

  s.platform              = :ios, '5.0'
  s.ios.deployment_target = '5.0'

  s.source       = { :git => "https://github.com/zhuocheng/ZLMulticastAgent.git", :tag => "v0.0.1" }
  s.source_files = 'ZLMulticastAgent/ZLMulticastAgentSources/*.{h,m}'
  s.requires_arc = true

end
