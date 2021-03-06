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
            Item(name: "Football", classification: .sport, emoji: "π"),
            Item(name: "Hockey", classification: .sport, emoji: "π"),
            Item(name: "Baseball", classification: .sport, emoji: "βΎοΈ"),
            Item(name: "Basketball", classification: .sport, emoji: "π"),
            Item(name: "Soccer", classification: .sport, emoji: "β½οΈ"),
            Item(name: "iPhone", classification: .electronic, emoji: "π±"),
            Item(name: "iMac", classification: .electronic, emoji: "π₯"),
            Item(name: "television", classification: .electronic, emoji: "πΊ"),
            Item(name: "microphone", classification: .electronic, emoji: "π€"),
            Item(name: "Rupert", classification: .pet, emoji: "πΆ"),
            Item(name: "Tabby", classification: .pet, emoji: "π"),
            Item(name: "Tweety Pie", classification: .pet, emoji: "π¦"),
            Item(name: "Kathryn", classification: .family, emoji: "π©βπ¦°"),
            Item(name: "Allen", classification: .family, emoji: "π§"),
            Item(name: "Aidan", classification: .family, emoji: "π¦π»"),
            Item(name: "Nadia", classification: .family, emoji: "ππ»ββοΈ"),
            Item(name: "Emily", classification: .family, emoji: "π©π»βπΎ")
        ]
    }
}
