//
//  SettingsScreen.swift
//  Otus2308
//
//  Created by Galagan Sergey on 03.09.2023.
//

import SwiftUI

struct CartScreen: View {
    @State private var isPresented = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Корзина пуста!")
                .font(.largeTitle)
                .padding(.bottom, 20)
            
            Image("empty")
                .resizable()
                .frame(width: 300, height: 300)
                .padding(.bottom, 30)
                
            Button {
                isPresented.toggle()
            } label: {
                Text("Перезагрузить")
                    .foregroundColor(Color.white)
            }
            .frame(width: 250,
                   height: 40,
                   alignment: .center)
            .background(Color.red)
            .cornerRadius(12)
            .padding(.bottom, 20)
            .sheet(isPresented: $isPresented) {
                Text("Загрузка")
            }
        }
        
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        CartScreen()
    }
}
