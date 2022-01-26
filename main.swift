//
//  main.swift
//  BuglyTool
//
//  Created by hws on 2021/6/18.
//

import Foundation

var app_config = ""
var selectArr: [String] = []
ProcessInfo().arguments.forEach({
    if $0.hasPrefix("-config_path-") {
        if let value = $0.components(separatedBy: "->").last {
            app_config = value
        }
    } else if $0.hasPrefix("-select-") {
        if let value = $0.components(separatedBy: "->").last {
            selectArr.append(value)
        }
    }
})

if let configArr = NSArray(contentsOfFile: app_config) as? [NSDictionary] {
    if selectArr.count > 0 {
        for obj in configArr {
            for select in selectArr {
                if (obj["app_name"] as? String == select) {
                    NSLog("配置为：\n\n%@\n", obj)
                    var arguments: [CVarArg] = []
                    ["app_id", "app_key", "app_bundleId", "app_productVersion", "dsym_path"].forEach {
                        if let value = obj[$0] as? CVarArg {
                            arguments.append(value)
                        }
                    }
                    let result = String(format: "java -jar buglyqq-upload.jar -appid %@ -appkey %@ -bundleid %@ -version %@ -platform IOS -inputSymbol %@", arguments: arguments)
                    NSLog("生成的链接为：\n\n%@\n", result)
                }
            }
        }
    } else {
        for obj in configArr {
            NSLog("配置为：\n\n%@\n", obj)
            var arguments: [CVarArg] = []
            ["app_id", "app_key", "app_bundleId", "app_productVersion", "dsym_path"].forEach {
                if let value = obj[$0] as? CVarArg {
                    arguments.append(value)
                }
            }
            let result = String(format: "java -jar buglyqq-upload.jar -appid %@ -appkey %@ -bundleid %@ -version %@ -platform IOS -inputSymbol %@", arguments: arguments)
            NSLog("生成的链接为：\n\n%@\n", result)
        }
    }
} 
