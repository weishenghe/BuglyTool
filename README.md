# BuglyTool

1.将app.dSYM文件放到dSYM文件夹
2.修改Config.plist文件里面的app_name，app_id，app_key，app_bundleId，app_productVersion，dsym_path（dsym_path需要填写app.dSYM文件的绝对路径）
3.打开BuglyTool.xcodeproj，运行工程，能够获取到上传bugly的链接
4.终端打开BuglyTool,运行链接上传dSYM文件
