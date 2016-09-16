Pod::Spec.new do |s|
  s.name = 'ReactiveCocoa'
  s.version = '4.2.2'
  s.summary = 'A framework for composing and transforming streams of values.'
  s.description = <<-EOS
    ReactiveCocoa (RAC) is an Objective-C framework for Functional Reactive Programming.
    It provides APIs for composing and transforming streams of values.
  EOS
  s.homepage = 'https://github.com/ReactiveCocoa/ReactiveCocoa'
  s.license = { :type => 'MIT', :file => 'LICENSE.md' }
  s.author = {"Josh Abernathy" => "josh@github.com"}
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'
  s.source = {
    :git => 'https://github.com/Foild/ReactiveCocoa.git',
    :tag => 'v4.2.2'
  }
  s.dependency 'Result', '~> 3.0.0'
  s.framework = 'Foundation'
  s.prepare_command = "sed -i '' 's@<ReactiveCocoa/\\(.*\\)>@\"\\1\"@g' ReactiveCocoa/ReactiveCocoa.h"


  s.subspec 'Core' do |ss|
    ss.source_files = 'ReactiveCocoa/**/*.{d,h,m,swift}'
    ss.exclude_files = [
      '**/ReactiveCocoa.h',
      'ReactiveCocoa/**/*{RACObjCRuntime,AppKit,NSControl,NSText,NSTable,UIActionSheet,UIAlertView,UIBarButtonItem,UIButton,UICollectionReusableView,UIControl,UIDatePicker,UIGestureRecognizer,UIImagePicker,UIRefreshControl,UISegmentedControl,UISlider,UIStepper,UISwitch,UITableViewCell,UITableViewHeaderFooterView,UIText,MK}*'
    ]
    ss.header_dir = 'ReactiveCocoa'
    ss.private_header_files = [
      '**/*Private.h',
      '**/*EXTRuntimeExtensions.h',
      '**/RACEmpty*.h'
    ]

    ss.watchos.exclude_files = '**/NSURLConnection*'
    ss.watchos.pod_target_xcconfig = {'GCC_PREPROCESSOR_DEFINITIONS' => 'DTRACE_PROBES_DISABLED=1'}
  end
end