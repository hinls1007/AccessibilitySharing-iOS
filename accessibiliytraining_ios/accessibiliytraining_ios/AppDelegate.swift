//
//  AppDelegate.swift
//  accessibiliytraining_ios
//
//  Created by Lun Lam on 02/06/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let loginVc = LoginConfigurator.createScene()
        
        window.rootViewController = UINavigationController(rootViewController: loginVc)
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }

}

