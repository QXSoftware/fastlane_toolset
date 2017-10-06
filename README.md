# fastlane_toolset

基于 fastlane 的 Unity 导出 Xcode 工程的自动化打包解决方案。

### 特性
* 适用于 Unity5.x 的 iOS 命令行打包工具，支持修改 Xcode 工程的 Version 以及 Build
* 支持多渠道打包
* 支持指定 .mobileprovision 文件，完美适配 Xcode9
* 自动生成符号表文件

### 前提条件
* MacOSX
* fastlane(2.60.1 or newer)
* Xcode
* xcode-select

### 如何使用
```
# show usage
sh fastlane_toolset.sh
```
