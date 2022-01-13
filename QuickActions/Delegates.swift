//
//  Delegates.swift
//  QuickActions
//
//  Created by Stewart Lynch on 2022-01-12.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        if let selectedAction = options.shortcutItem {
            QuickAction.selectedAction = selectedAction
        }
        let sceneConfiguration = UISceneConfiguration(name: "Quick Action Scene", sessionRole: connectingSceneSession.role)
        sceneConfiguration.delegateClass = QuickActinSceneDelegate.self
        return sceneConfiguration
    }
}

class QuickActinSceneDelegate: UIResponder, UIWindowSceneDelegate {
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        QuickAction.selectedAction = shortcutItem
    }
}
