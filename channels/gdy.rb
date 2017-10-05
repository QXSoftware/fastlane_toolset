lane :gdy_dev do |options|
    xcodeproj = options[:xcodeproj]
    plist = options[:plist]
    set_xcode_project_settings(
        xcodeproj:xcodeproj,
        plist:plist,
        teamId:"5237R832SJ",
        bundleId:"com.fj.ff.ios",
        codeSignIdentity:"iPhone Developer",
        codeSignStyle:"Manual",
        mainTargetName:"Unity-iPhone",
    )
    update_project_provisioning(
        xcodeproj:xcodeproj,
        profile:"/Users/develop/Documents/provisions/gewenpeng_dev/ff.mobileprovision",
    )
end

lane :gdy_adhoc do |options|
    xcodeproj = options[:xcodeproj]
    plist = options[:plist]
    set_xcode_project_settings(
        xcodeproj:xcodeproj,
        plist:plist,
        teamId:"5237R832SJ",
        bundleId:"com.fj.ff.ios",
        codeSignIdentity:"iPhone Distribution",
        codeSignStyle:"Manual",
        mainTargetName:"Unity-iPhone",
    )
    update_project_provisioning(
        xcodeproj:xcodeproj,
        profile:"/Users/develop/Documents/provisions/gewenpeng_test/ff.mobileprovision",
    )
end

lane :gdy_dis do |options|
    xcodeproj = options[:xcodeproj]
    plist = options[:plist]
    set_xcode_project_settings(
        xcodeproj:xcodeproj,
        plist:plist,
        teamId:"5237R832SJ",
        bundleId:"com.fj.ff.ios",
        codeSignIdentity:"iPhone Distribution",
        codeSignStyle:"Manual",
        mainTargetName:"Unity-iPhone",
    )
    update_project_provisioning(
        xcodeproj:xcodeproj,
        profile:"/Users/develop/Documents/provisions/gewenpeng_official/ff.mobileprovision",
    )
end