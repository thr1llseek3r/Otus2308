//
//  ContentView.swift
//  Otus2308
//
//  Created by Galagan Sergey on 01.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Basic") {
                    BasicAnimations()
                }
                NavigationLink("Nested") {
                    MultiplineAnimation()
                }
                
                NavigationLink("Tuning") {
                    Tuning()
                }
                
                NavigationLink("WithAnimation") {
                    WithAnimation()
                }
                NavigationLink("CustomCircle") {
                    ShapeExample()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
