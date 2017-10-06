
private_lane :update_settings_and_build do |params|
	if not check_params(params,
		:xcodeproj,
		:plist,
		:teamId,
		:bundleId,
		:codeSignIdentity,
		:codeSignStyle,
		:mainTargetName,
		:mobileProvisionFile,
		:build_number,
		:build_version,
	) then
		FastlaneCore::UI.user_error!("Not enough parameters passed to update_settings_and_build")
	end

	xcodeproj = params[:xcodeproj]
	plist = params[:plist]
	teamId = params[:teamId]
	bundleId = params[:bundleId]
	codeSignIdentity = params[:codeSignIdentity]
	codeSignStyle = params[:codeSignStyle]
	mainTargetName = params[:mainTargetName]
	mobileProvisionFile = params[:mobileProvisionFile]
	build_number = params[:build_number]
	build_version = params[:build_version]

	set_xcode_project_settings(
		xcodeproj:xcodeproj,
		plist:plist,
		teamId:teamId,
		bundleId:bundleId,
		codeSignIdentity:codeSignIdentity,
		codeSignStyle:codeSignStyle,
		mainTargetName:mainTargetName,
	)
	update_project_provisioning(
		xcodeproj:xcodeproj,
		profile:mobileProvisionFile,
	)
	set_build_version(
		plist:plist,
		build_number:build_number,
		build_version:build_version,
	)
	gym
end
