Pod::Spec.new do |s|
s.name         = "Arhat"
s.version      = "1.0.6"
s.summary      = "Arhat"
s.description  = <<-DESC
  Arhat is a interesting sdk
DESC
s.author             = { "Yong PengLiang" => "yong_pliang@163.com" }
s.homepage     = "https://github.com/YPLiang19/Arhat"
s.license      = "MIT"
s.ios.deployment_target = "11.0"
s.source       = { :git => "https://github.com/YPLiang19/Arhat.git", :tag => "#{s.version}" }
s.vendored_frameworks  = 'Arhat.xcframework'
end

