desc "ko AppStore Distribution"
lane :ko_dis do |options|
    xcodeproj = options[:xcodeproj]
    plist = options[:plist]
    set_xcode_project_settings(
        xcodeproj:xcodeproj,
        plist:plist,
        teamId:"VWL4VBQDL2",
        bundleId:"com.flmobile.ff",
        codeSignIdentity:"iPhone Distribution",
        codeSignStyle:"Manual",
        mainTargetName:"Unity-iPhone",
    )
    update_project_provisioning(
        xcodeproj:xcodeproj,
        profile:"/Users/develop/Documents/provisions/ko/ff_dis.mobileprovision",
    )
    gym
end

desc "ko Development"
lane :ko_dev do |options|
    xcodeproj = options[:xcodeproj]
    plist = options[:plist]
    set_xcode_project_settings(
        xcodeproj:xcodeproj,
        plist:plist,
        teamId:"VWL4VBQDL2",
        bundleId:"com.flmobile.ff",
        codeSignIdentity:"iPhone Developer",
        codeSignStyle:"Manual",
        mainTargetName:"Unity-iPhone",
    )
    update_project_provisioning(
        xcodeproj:xcodeproj,
        profile:"/Users/develop/Documents/provisions/ko/ff_dev.mobileprovision",
    )
    gym
end
