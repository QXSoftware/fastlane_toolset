# used for fastlane only

require 'xcodeproj'

def set_info_plist_value(path, key, value)
	sh "/usr/libexec/PlistBuddy -c \"set :#{key} #{value}\" #{path}"
end

# CFBundleShortVersionString e.g. 1.0.1
# CFBundleVersion e.g. 1001
private_lane :set_version_build do |params|
	FastlaneCore::PrintTable.print_values(config: params, title: "Summary for set_version_build")
	plist = params[:plist]
	build_version = params[:build_version]
	build_number = params[:build_number]
	set_info_plist_value(plist, "CFBundleShortVersionString", build_version)
	set_info_plist_value(plist, "CFBundleVersion", build_number)
end

# CODE_SIGN_STYLE:
# => Automatic
# => Manual
# CODE_SIGN_IDENTITY:
# => iPhone Distribution
# => iPhone Developer
private_lane :set_xcode_project_settings do |params|
	FastlaneCore::PrintTable.print_values(config: params, title: "Summary for set_xcode_project_settings")
	xcodeproj = params[:xcodeproj]
	plist = params[:plist]
	bundleId = params[:bundleId]
	teamId = params[:teamId]
	codeSignStyle = params[:codeSignStyle]
	codeSignIdentity = params[:codeSignIdentity]
	mainTargetName = params[:mainTargetName]
	project = Xcodeproj::Project.open(xcodeproj)
	project.targets.each do |target|
		target.build_configuration_list.build_configurations.each do |build_configuration|
			build_configuration.build_settings["PRODUCT_BUNDLE_IDENTIFIER"] = bundleId
			build_configuration.build_settings["DEVELOPMENT_TEAM"] = teamId
			build_configuration.build_settings["CODE_SIGN_STYLE"] = codeSignStyle
			build_configuration.build_settings["CODE_SIGN_IDENTITY"] = codeSignIdentity
			build_configuration.build_settings["CODE_SIGN_IDENTITY[sdk=iphoneos*]"] = codeSignIdentity
		end
		if target.name == mainTargetName
			mainTargetUUID = target.uuid
			project.root_object.attributes["TargetAttributes"][mainTargetUUID] ||= {}
			mainTargetAttributes = project.root_object.attributes["TargetAttributes"][mainTargetUUID]
			mainTargetAttributes["ProvisioningStyle"] = codeSignStyle
			mainTargetAttributes["DevelopmentTeam"] = teamId
		end
	end
	project.save
	set_info_plist_value(plist, 'CFBundleIdentifier', bundleId)
end
