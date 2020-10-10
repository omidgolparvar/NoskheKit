Pod::Spec.new do |s|
  s.name                  = 'NoskheKit'
  s.version               = '1.0.0'
  s.summary               = 'تغییرات هر نسخه رو خیلی قشنگ توضیح بدین!'
  s.description           = 'تغییرات هر نسخه رو خیلی قشنگ توضیح بدین!'
  s.homepage              = 'https://github.com/omidgolparvar/NoskheKit'
  s.license               = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author                = { 'Omid Golparvar' => 'iGolparvar@gmail.com' }
  s.source                = { :git => "https://github.com/omidgolparvar/NoskheKit.git", :tag => s.version.to_s }
  s.swift_version         = '5.0'
  s.platform              = :ios, '11.0'
  s.requires_arc          = true
  s.ios.deployment_target = '11.0'
  s.pod_target_xcconfig   = { 'SWIFT_VERSION' => '5.0' }
  s.source_files          = [
    'NoskheKit/*.{h,swift}',
    'NoskheKit/Sources/**/*.{h,swift}',
    'NoskheKit/Sources/**/*.xib'
  ]
  s.public_header_files = 'NoskheKit/*.h'
end
