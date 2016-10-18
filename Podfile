# Uncomment this line to define a global platform for your project
#platform :ios, '9.0'

target 'CSP' do

use_frameworks!
pod 'FacebookCore'
pod 'FacebookLogin'
pod 'FacebookShare'

  target 'CSPTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'CSPUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
