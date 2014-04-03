Pod::Spec.new do |s|
  s.name = "ZLMulticastAgent"
  s.version = "0.0.1"
  s.summary = "An implementation of MulticastAgent."
  s.homepage = "https://github.com/zhuocheng/ZLMulticastAgent"
  s.license = { :type => 'Apache', :file => 'LICENSE' }
  s.author = { "李卓成" => "zhuocheng.lee@gmail.com" }
  s.platform = :ios, '5.0'
  s.source = { :git => "https://github.com/zhuocheng/ZLMulticastAgent.git", :tag => "v0.0.1" }
  s.source_files = 'ZLMulticastAgent/*.{h,m}'
  s.requires_arc = true
end
