#
# Be sure to run `pod lib lint TKFormTextField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TKFormTextField'
  s.version          = '0.3.0'
  s.summary          = 'A UITextField subclass with built-in error label, floating label while editing, and underline.'
  s.description      = 'For text input forms, using alerts for showing error is too intrusive, makes user lost context of which field is wrong, and require another tap to dismiss. And you can only show one at a time. I think TKFormTextField is the answer to text input form UI.'
  s.homepage         = 'https://github.com/hlung/TKFormTextField'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Thongchai Kolyutsakul' => 'thongchaikol@gmail.com' }
  s.source           = { :git => 'https://github.com/hlung/TKFormTextField.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
  s.ios.deployment_target = '8.0'
  s.source_files = 'TKFormTextField/Classes/**/*'
  
  # s.resource_bundles = {
  #   'TKFormTextField' => ['TKFormTextField/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
