#
# Be sure to run `pod lib lint ReactNativeJsi.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

folly_compiler_flags = '-DFOLLY_NO_CONFIG -DFOLLY_MOBILE=1 -DFOLLY_USE_LIBCPP=1 -Wno-comma -Wno-shorten-64-to-32'
boost_compiler_flags = '-Wno-documentation'

Pod::Spec.new do |s|
  s.name = 'ReactNativeJsi'
  s.version = '0.1.0'
  s.summary = 'An runtime base on react-native.'
  s.description =
  <<-DESC
  'Introduce this library for your App, development by react-native code.'
  DESC

  s.homepage = 'https://github.com/beatjs/ReactNativeJsi'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'Liam Xu' => 'liamxujia@outlook.com' }
  s.source = { :git => 'https://github.com/beatjs/ReactNativeJsi.git', :tag => s.version.to_s }
  
  s.module_name = 'jsi'
  s.libraries = 'stdc++'
  s.pod_target_xcconfig = {
      'USE_HEADERMAP' => 'NO',
      'CLANG_CXX_LANGUAGE_STANDARD' => 'c++14',
      'HEADER_SEARCH_PATHS' => '\'$(PODS_TARGET_SRCROOT)\' \'$(PODS_ROOT)/boost-for-react-native\' \'$(PODS_ROOT)/DoubleConversion\' \'$(PODS_ROOT)/ReactNativeFolly\''
  }
  s.ios.deployment_target = '11.0'
  s.source_files =
  'jsi/**/*.cpp'
  
  s.preserve_paths =
  'jsi/**/*.h'
  
  s.framework = 'JavaScriptCore'
  s.compiler_flags = folly_compiler_flags + ' ' + boost_compiler_flags
  s.header_dir = 'jsi'
  
  s.dependency 'boost-for-react-native', '1.63.0'
  s.dependency 'DoubleConversion', '1.1.5'
  s.dependency 'ReactNativeFolly', '0.1.6'
  s.dependency 'glog', '0.3.4'
  
  s.platforms = { :ios => '11.0' }
end
