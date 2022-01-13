//
//  Item.swift
//  QuickActions
//
//  Created by Stewart Lynch on 2022-01-11.
//

import Foundation

struct Item: Identifiable {
    enum Classification: String, CaseIterable {
        case all
        case electronic
        case family
        case pet
        case sport
    }
    let id = UUID()
    let name: String
    let classification: Classification
    let emoji: String
    
    static var all: [Item] {
        [
            Item(name: "Football", classification: .sport, emoji: "🏈"),
            Item(name: "Hockey", classification: .sport, emoji: "🏒"),
            Item(name: "Baseball", classification: .sport, emoji: "⚾️"),
            Item(name: "Basketball", classification: .sport, emoji: "🏀"),
            Item(name: "Soccer", classification: .sport, emoji: "⚽️"),
            Item(name: "iPhone", classification: .electronic, emoji: "📱"),
            Item(name: "iMac", classification: .electronic, emoji: "🖥"),
            Item(name: "television", classification: .electronic, emoji: "📺"),
            Item(name: "microphone", classification: .electronic, emoji: "🎤"),
            Item(name: "Rupert", classification: .pet, emoji: "🐶"),
            Item(name: "Tabby", classification: .pet, emoji: "🐈"),
            Item(name: "Tweety Pie", classification: .pet, emoji: "🦜"),
            Item(name: "Kathryn", classification: .family, emoji: "👩‍🦰"),
            Item(name: "Allen", classification: .family, emoji: "🧔"),
            Item(name: "Aidan", classification: .family, emoji: "👦🏻"),
            Item(name: "Nadia", classification: .family, emoji: "🙍🏻‍♀️"),
            Item(name: "Emily", classification: .family, emoji: "👩🏻‍🌾")
        ]
    }
}
