# Uncomment the next line to define a global platform for your project
source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '9.0'

inhibit_all_warnings!

workspace 'UCDemo'

target 'SKExtension' do
	project 'SKExtension/SKExtension'

	pod 'SDWebImage', '4.0.0'
end

abstract_target 'UCTarget' do
    
    pod 'SKExtension', :path => 'SKExtension'
    
    target 'UCDemo' do
        project 'UCDemo/UCDemo'
	    pod 'Masonry', '~> 1.1.0'
            pod "SSZipArchive", "1.7"
            pod "YYKit", "1.0.9"
	    pod 'MJRefresh', '~> 3.1.15.3'        
            pod 'EasyReact'
            pod 'WHDebugTool', '~> 1.3'
            pod 'MLeaksFinder'
	    pod 'AFNetworking', '~> 3.2.1'
    end
end
