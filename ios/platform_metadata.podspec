#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint platform_metadata.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'platform_metadata'
  s.version          = '0.0.1'
  s.summary          = 'A flutter plugin which will help you to get metadata values defined in AndroidManifest.xml (Android) or info.plist (iOS).'
  s.description      = <<-DESC
A flutter plugin which will help you to get metadata values defined in AndroidManifest.xml (Android) or info.plist (iOS).
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
