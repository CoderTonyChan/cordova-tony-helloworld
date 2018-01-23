# cordova-tony-helloworld
cordova, plugin,tony,helloworld

### 知识点
- www会拷贝外层www 而且还会删除内层的www中所有文件夹
- 外层的config文件的优先度比内层还高... 这叫merge吗?
- build phase已经全部设置好的会拷贝www 但是会有一些警告 被清了
- 多项目管理最好使用cli命令 但是上线和调试最好还是用回Xcode 相当于cli命令只是用于拷贝资源(不会设置苹果账户)
- 所有东西都没有加密 直接拷贝进去的 (包括readme 还有连web-inf都进去了)
- git init
- git 会自动忽略工程类的文件
- git提交不了用引用类型的文件


- cordova-plugin-whitelist

- cordova-plugin-iosrtc ()
- https://github.com/BasqueVoIPMafia/cordova-plugin-iosrtc/blob/master/docs/Building.md
- Xcode项目的设置 (iosrtc-swift-support.js 注意一定需要Xcode模块)

- 插件的制作和原理
- https://www.jianshu.com/p/21477a20707a

```
iosrtc-swift-support.js [INFO] ".pbxproj" project file found: /Users/CYT/Desktop/TonyChan/TonyChan/cordova/hello2/hello/platforms/ios/HelloWorld.xcodeproj/project.pbxproj
iosrtc-swift-support.js [INFO] ".xcconfig" project file found: /Users/CYT/Desktop/TonyChan/TonyChan/cordova/hello2/hello/platforms/ios/cordova/build.xcconfig
iosrtc-swift-support.js [INFO] fixing issues in the generated project files:
iosrtc-swift-support.js [INFO] - "iOS Deployment Target" and "Deployment Target" to: "9.0"
iosrtc-swift-support.js [INFO] - "Runpath Search Paths" to: "@executable_path/Frameworks"
iosrtc-swift-support.js [INFO] - "Objective-C Bridging Header" to: "HelloWorld/Plugins/cordova-plugin-iosrtc/cordova-plugin-iosrtc-Bridging-Header.h"
iosrtc-swift-support.js [INFO] - "ENABLE_BITCODE" set to: "NO"
iosrtc-swift-support.js [INFO] - "SWIFT_VERSION" set to: "3.0"
iosrtc-swift-support.js [INFO] file correctly fixed: /Users/CYT/Desktop/TonyChan/TonyChan/cordova/hello2/hello/platforms/ios/cordova/build.xcconfig
iosrtc-swift-support.js [INFO] file correctly fixed: /Users/CYT/Desktop/TonyChan/TonyChan/cordova/hello2/hello/platforms/ios/HelloWorld.xcodeproj/project.pbxproj
```



