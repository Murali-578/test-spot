//
//  AppDelegate.swift
//  SpotOn
//
//  Created by Murali Gorantla (TCIN) on 24/07/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let initialViewController = UINavigationController()

        window = UIWindow(frame: UIScreen.main.bounds)
        guard let window = window else {
            return false
        }

        initialViewController.setRootWireframe(MarketWireframe())
        window.rootViewController = initialViewController
        window.makeKeyAndVisible()
        return true
    }

}

