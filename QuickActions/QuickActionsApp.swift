//
//  QuickActionsApp.swift
//  QuickActions
//
//  Created by Stewart Lynch on 2022-01-12.
//

import SwiftUI

@main
struct QuickActionsApp: App {
    @StateObject var vm =  ViewModel()
    @Environment(\.scenePhase) var phase
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
                .onAppear {
                 UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                }
                .onChange(of: phase) { newPhase in
                    switch newPhase {
                    case .active:
                        // respond to selected action
                        if let name = QuickAction.selectedAction?.userInfo?["name"] as? String {
                            vm.selectFilter(for: name)
                        } else {
                            vm.selectedClassification = .all
                            vm.loadItems()
                        }
                    case .background:
                        // add quick actions
                        vm.addQuickActions()
//                        print("app went into the background")
                    default:
                        break
                    }
                }
        }
    }
}
