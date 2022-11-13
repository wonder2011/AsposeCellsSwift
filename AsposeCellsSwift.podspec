#
# Be sure to run `pod lib lint AsposeCellsSwift.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AsposeCellsSwift'
  s.version          = '0.1.0'
  s.summary          = 'AsposeCellsSwift library to manage Aspose.Cell Rest Api.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'This CocoaPods library helps you work with Aspose.Cells Cloud Rest Api.'

  s.homepage         = 'https://github.com/wonder2011/AsposeCellsSwift'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wonder2011' => 'fidelhernandezsalazar@gmail.com' }
  s.source           = { :git => 'https://github.com/wonder2011/AsposeCellsSwift.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/wonderDeveloper'

  s.ios.deployment_target = '13.0'
  s.swift_version = "5.2"

  s.source_files = 'AsposeCellsSwift/**/*'
  
  # s.resource_bundles = {
  #   'AsposeCellsSwift' => ['AsposeCellsSwift/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'AsposeCellsCloud', '~> 21.7'
end
