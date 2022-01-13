//
//  QuickAction.swift
//  QuickActions
//
//  Created by Stewart Lynch on 2022-01-12.
//

import UIKit

enum QuickAction {
    static var selectedAction: UIApplicationShortcutItem?
    
    static var petuserInfo: [String : NSSecureCoding] {
        ["name" : "pet" as NSSecureCoding]
    }
    static var electronicuserInfo: [String : NSSecureCoding] {
        ["name" : "electronic" as NSSecureCoding]
    }
    static var sportuserInfo: [String : NSSecureCoding] {
        ["name" : "sport" as NSSecureCoding]
    }
    static var familyuserInfo: [String : NSSecureCoding] {
        ["name" : "family" as NSSecureCoding]
    }
    
    static var allShortcutItems = [
        UIApplicationShortcutItem(type: "pet",
                                  localizedTitle: "Pets",
                                  localizedSubtitle: "My Pets",
                                  icon: UIApplicationShortcutIcon(systemImageName: "pawprint.fill"),
                                  userInfo: petuserInfo),
        UIApplicationShortcutItem(type: "sport",
                                  localizedTitle: "Sports",
                                  localizedSubtitle: "My Passions",
                                  icon: UIApplicationShortcutIcon(templateImageName: "sportsIcon"),
                                  userInfo: sportuserInfo),
        UIApplicationShortcutItem(type: "family",
                                  localizedTitle: "Family",
                                  localizedSubtitle: "My Family",
                                  icon: UIApplicationShortcutIcon(type: .contact),
                                  userInfo: familyuserInfo),
        UIApplicationShortcutItem(type: "electronic",
                                  localizedTitle: "Electronics",
                                  localizedSubtitle: "My Toys",
                                  icon: UIApplicationShortcutIcon(systemImageName: "laptopcomputer.and.iphone"),
                                  userInfo: electronicuserInfo)
        
    ]
}
