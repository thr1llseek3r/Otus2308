//
//  ContentView.swift
//  Otus2308
//
//  Created by Galagan Sergey on 01.09.2023.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject private var mainCoordinator = MainCoordinatorManager()
    var body: some View {
        TabBarView()
            .environmentObject(mainCoordinator)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
