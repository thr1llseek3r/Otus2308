//
//  ProfileScreen.swift
//  AppSUI2308
//
//  Created by Exey Panteleev on 31.08.2023.
//

import SwiftUI

struct ProfileScreen: View {
    
    var body: some View {
        VStack {
            
            NavigationView {
                VStack {
                    Text("ProfileScreen").font(.largeTitle)
                    NavigationLink(destination: FoodScreen()) {
                        Text("Foods")
                            .font(.largeTitle)
                            .padding()
                            .background(Color.mint)
                    }
                }
            }
        }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
