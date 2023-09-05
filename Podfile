platform :ios, '12.1'
inhibit_all_warnings!

target 'hyweb-ios-exam' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Rx Pods
  pod 'RxSwift', '~> 5.0'
  pod 'RxCocoa', '~> 5.0'
  pod 'RxOptional', '~> 4.1'
  pod 'RxDataSources', '~> 4.0'
  pod 'RxViewController'

  # IQKeyboard
  pod 'IQKeyboardManager'

  # Layout
  pod 'SnapKit'

  # API
  pod 'IORequestable'

  # Kingfisher
  pod 'Kingfisher'

  # Activity Indicator
  pod 'NVActivityIndicatorView', '= 4.4.0'

  # FLEX
  # pod 'FLEX', :configurations => ['Debug']
end


# Post Install
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.1'
    end
  end
end
