
lane :gdy_dev do |options|
	xcodeproj = options[:xcodeproj]
	plist = options[:plist]
	build_number = options[:build_number]
	build_version = options[:build_version]
	update_settings_and_build(
		xcodeproj:xcodeproj,
		plist:plist,
		build_number:build_number,
		build_version:build_version,
		mobileProvisionFile:get_full_path_from_cur_dir(__FILE__, '../provisions/gdy/dev.mobileprovision'),
		teamId:'5237R832SJ',
		bundleId:'com.fj.ff.ios',
		codeSignIdentity:'iPhone Developer',
		codeSignStyle:'Manual',
		mainTargetName:'Unity-iPhone',
	)
end

lane :gdy_adhoc do |options|
	xcodeproj = options[:xcodeproj]
	plist = options[:plist]
	build_number = options[:build_number]
	build_version = options[:build_version]
	update_settings_and_build(
		xcodeproj:xcodeproj,
		plist:plist,
		build_number:build_number,
		build_version:build_version,
		mobileProvisionFile:get_full_path_from_cur_dir(__FILE__, '../provisions/gdy/adhoc.mobileprovision'),
		teamId:'5237R832SJ',
		bundleId:'com.fj.ff.ios',
		codeSignIdentity:'iPhone Distribution',
		codeSignStyle:'Manual',
		mainTargetName:'Unity-iPhone',
	)
end

lane :gdy_dis do |options|
	xcodeproj = options[:xcodeproj]
	plist = options[:plist]
	build_number = options[:build_number]
	build_version = options[:build_version]
	update_settings_and_build(
		xcodeproj:xcodeproj,
		plist:plist,
		build_number:build_number,
		build_version:build_version,
		mobileProvisionFile:get_full_path_from_cur_dir(__FILE__, '../provisions/gdy/dis.mobileprovision'),
		teamId:'5237R832SJ',
		bundleId:'com.fj.ff.ios',
		codeSignIdentity:'iPhone Distribution',
		codeSignStyle:'Manual',
		mainTargetName:'Unity-iPhone',
	)
end
