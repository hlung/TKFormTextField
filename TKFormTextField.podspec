#
# Be sure to run `pod lib lint TKFormTextField.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TKFormTextField'
  s.version          = '0.1.0'
  s.summary          = 'A UITextField subclass that shows title label on top while editing and an optional error label below. With underline.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'I want to add the ability to keep placeholder text and show error message near each UITextField. Using alert for showing error is too intrusive, makes user lost context of which field is wrong, and require another tap to dismiss. So I want to add this functionality right into UITextField.'

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
