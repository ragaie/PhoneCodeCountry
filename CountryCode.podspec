Pod::Spec.new do |s|
  s.platform = :ios
  s.name             = 'CountryCode'
  s.version          = '1.0.1'
  s.summary          = ' Simple custom view for elect country code for iOS'
 
  s.description      = <<-DESC
Simple custom view for data entry of your app to enter code country for phone number.
                       DESC
 
  s.homepage         = 'https://github.com/ragaie/PhoneCodeCountry'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ragaie Alfy' => 'eng.ragaie@gmail.com' }
  s.source           = { :git => 'https://github.com/ragaie/PhoneCodeCountry.git', :tag => s.version.to_s }
 
  s.framework = "UIKit","Foundation"
  s.ios.deployment_target = '10.0'

  s.source_files = '*.swift'


  s.resources = 'CountryCode.xcassets','CodeDropDown.xib','CodeTableCell.xib','countryCodes.json'

  s.resource_bundle = {'CountryCode' => ['CountryCode.xcassets','RatingBar.xib','CodeDropDown.xib','CodeTableCell.xib']}
 s.swift_versions = "5.0"
  
end
