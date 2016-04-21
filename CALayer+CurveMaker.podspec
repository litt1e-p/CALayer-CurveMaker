Pod::Spec.new do |s|
  s.name             = "CALayer+CurveMaker"
  s.version          = "0.0.1"
  s.summary          = "make curve layers for UIView or CALayer"
  s.description      = <<-DESC
                       a extension for making curve layers for UIView or CALayer
                       DESC
  s.homepage         = "https://github.com/litt1e-p/CALayer-CurveMaker"
  s.license          = { :type => 'MIT' }
  s.author           = { "litt1e-p" => "litt1e.p4ul@gmail.com" }
  s.source           = { :git => "https://github.com/litt1e-p/CALayer-CurveMaker.git", :tag => '0.0.1' }
  s.platform = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'CALayer+CurveMaker/*'
  s.frameworks = 'Foundation', 'UIKit'
end
