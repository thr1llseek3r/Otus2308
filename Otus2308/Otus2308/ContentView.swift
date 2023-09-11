//
//  ContentView.swift
//  Otus2308
//
//  Created by Galagan Sergey on 01.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var tabSelection: Int = 1
    
    var body: some View {
        
        TabView (selection: $tabSelection) {
            
            DashboardScreen()
                .tag(0)
                .tabItem {
                    Label("Dashboard", systemImage: "star")
                }
            
            NewsScreen()
                .tag(1)
                .tabItem {
                    Label("News", systemImage: "newspaper")
                }
            
            ProfileScreen()
                .tag(2)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
