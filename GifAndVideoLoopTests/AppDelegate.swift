//
//  AppDelegate.swift
//  GifAndVideoLoopTests
//
//  Created by Zak Barlow on 15/09/2020.
//  Copyright © 2020 Zak Barlow. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let homeViewController = ViewController()
        window!.rootViewController = homeViewController
        window!.makeKeyAndVisible()
        
        return true
    }
}

