//
//  Otus2308App.swift
//  Otus2308
//
//  Created by Galagan Sergey on 01.09.2023.
//

import SwiftUI

@main
struct Otus2308App: App {
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { newState in
            switch newState {
            case .background:
                print("ContentView lifeCycle - background")
            case .inactive:
                print("ContentView lifeCycle - inactive")
            case .active:
                print("ContentView lifeCycle - active")
            @unknown default:
                print("ContentView lifeCycle - default case \(newState)")
            }
        }
    }
}
