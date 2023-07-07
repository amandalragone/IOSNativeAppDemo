//
//  AppDelegate.swift
//  IOSNativeAppDemo
//
//  Created by Amanda Lamberti Ragone on 6/27/23.
//

import UIKit
import ElectrodeContainer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
                
        let containerConfig = ElectrodeContainerConfig()
        containerConfig.debugEnabled = false // You can switch this to true for DEV if needed. In that case, you would need to run ern start in the command line so that the server starts before running the app itself.
        ElectrodeReactNative.start(withConfigurations: containerConfig, ernDelegate: nil)

        // Override point for customization after application launch.
        return true
    }

}

