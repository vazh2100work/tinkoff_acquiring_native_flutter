#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint tinkoff_acquiring_native_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'tinkoff_acquiring_native_flutter'
  s.version          = '0.0.1'
  s.summary          = 'Tinkoff Acquiring Native Realisation Android and iOS'
  s.description      = <<-DESC
Tinkoff Acquiring Native Realisation Android and iOS
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'TinkoffASDKCore', "2.13.1"
  s.dependency 'TinkoffASDKUI', "2.13.1"
  s.platform = :ios, '12.3'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
