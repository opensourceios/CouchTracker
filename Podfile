source 'https://github.com/CocoaPods/Specs.git'

RX_SWIFT_VERSION = '5.0.1'.freeze
SNAPKIT_VERSION = '5.0.0'.freeze
MOYA_VERSION = '14.0.0-alpha.1'.freeze
OSX_VERSION = '10.12'.freeze
IOS_VERSION = '10.0'.freeze

def api_pods
  pod 'Moya/RxSwift', git: 'https://github.com/Moya/Moya.git', tag: MOYA_VERSION
end

def common_pods
  api_pods
  pod 'NonEmpty', '0.2.0'
  pod 'RxSwift', git: 'https://github.com/ReactiveX/RxSwift.git', tag: RX_SWIFT_VERSION
end

def ios_pods
  common_pods
  pod 'Kingfisher', '5.5.0'
  pod 'RxCocoa', git: 'https://github.com/ReactiveX/RxSwift.git', tag: RX_SWIFT_VERSION
  pod 'ActionSheetPicker-3.0', '2.3.0'
  pod 'Tabman', '2.4.2'
  pod 'SnapKit', SNAPKIT_VERSION
  pod 'RxDataSources', '4.0.1'
  pod 'Bugsnag'
end

def persistence_pods
  pod 'RxRealm', '1.0.0'
  pod 'RealmSwift', '3.15.0'
end

def tests_shared_pods
  pod 'RxTest', git: 'https://github.com/ReactiveX/RxSwift.git', tag: RX_SWIFT_VERSION
  pod 'Nimble', '8.0.1'
end

def ui_tests_pods
  pod 'KIF', '3.7.7', configurations: ['Debug']
end

target 'CouchTrackerCore' do
  platform :osx, OSX_VERSION
  use_frameworks!
  inhibit_all_warnings!

  common_pods
end

target 'CouchTrackerCore-iOS' do
  platform :ios, IOS_VERSION
  use_frameworks!
  inhibit_all_warnings!

  common_pods
end

target 'CouchTrackerCoreTests' do
  platform :osx, OSX_VERSION
  use_frameworks!
  inhibit_all_warnings!

  common_pods
  tests_shared_pods
end

target 'CouchTrackerApp' do
  platform :ios, IOS_VERSION
  use_frameworks!
  inhibit_all_warnings!

  ios_pods
  persistence_pods
end

target 'CouchTrackerAppTestable' do
  platform :ios, IOS_VERSION
  use_frameworks!
  inhibit_all_warnings!

  ui_tests_pods
end

target 'CouchTrackerPersistence' do
  platform :ios, IOS_VERSION
  use_frameworks!
  inhibit_all_warnings!

  persistence_pods
end

target 'CouchTracker' do
  platform :ios, IOS_VERSION
  use_frameworks!
  inhibit_all_warnings!

  ios_pods
end

target 'CouchTrackerUITests' do
  platform :ios, IOS_VERSION
  use_frameworks!
  inhibit_all_warnings!

  ui_tests_pods
end

target 'CouchTrackerDebug' do
  platform :ios, IOS_VERSION
  use_frameworks!
  inhibit_all_warnings!

  pod 'SnapKit', SNAPKIT_VERSION
end

target 'TraktSwift' do
  platform :osx, OSX_VERSION
  use_frameworks!
  inhibit_all_warnings!

  api_pods
end

target 'TraktSwift-iOS' do
  platform :ios, IOS_VERSION
  use_frameworks!
  inhibit_all_warnings!

  api_pods
end

target 'TraktSwiftTests' do
  platform :osx, OSX_VERSION
  use_frameworks!
  inhibit_all_warnings!

  tests_shared_pods
end

target 'TMDBSwift' do
  platform :osx, OSX_VERSION
  use_frameworks!
  inhibit_all_warnings!

  api_pods
end

target 'TMDBSwift-iOS' do
  platform :ios, IOS_VERSION
  use_frameworks!
  inhibit_all_warnings!

  api_pods
end

target 'TMDBSwiftTests' do
  platform :osx, OSX_VERSION
  use_frameworks!
  inhibit_all_warnings!

  tests_shared_pods
end

target 'TVDBSwift' do
  platform :osx, OSX_VERSION
  use_frameworks!
  inhibit_all_warnings!

  api_pods
end

target 'TVDBSwift-iOS' do
  platform :ios, IOS_VERSION
  use_frameworks!
  inhibit_all_warnings!

  api_pods
end

target 'TVDBSwiftTests' do
  platform :osx, OSX_VERSION
  use_frameworks!
  inhibit_all_warnings!

  tests_shared_pods
end
