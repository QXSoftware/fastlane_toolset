
desc "ko AppStore Distribution"
lane :ko_dis do |options|
	xcodeproj = options[:xcodeproj]
	plist = options[:plist]
	build_number = options[:build_number]
	build_version = options[:build_version]
	update_settings_and_build(
		xcodeproj:xcodeproj,
		plist:plist,
		build_number:build_number,
		build_version:build_version,
		mobileProvisionFile:get_full_path_from_cur_dir(__FILE__, '../provisions/ko/dis.mobileprovision'),
		teamId:'VWL4VBQDL2',
		bundleId:'com.flmobile.ff',
		codeSignIdentity:'iPhone Distribution',
		codeSignStyle:'Manual',
		mainTargetName:'Unity-iPhone',
	)
end

desc "ko Development"
lane :ko_dev do |options|
	xcodeproj = options[:xcodeproj]
	plist = options[:plist]
	build_number = options[:build_number]
	build_version = options[:build_version]
	update_settings_and_build(
		xcodeproj:xcodeproj,
		plist:plist,
		build_number:build_number,
		build_version:build_version,
		mobileProvisionFile:get_full_path_from_cur_dir(__FILE__, '../provisions/ko/dev.mobileprovision'),
		teamId:'VWL4VBQDL2',
		bundleId:'com.flmobile.ff',
		codeSignIdentity:'iPhone Developer',
		codeSignStyle:'Manual',
		mainTargetName:'Unity-iPhone',
	)
end
