//
//  LoadingCartScreen.swift
//  Otus2308
//
//  Created by Galagan Sergey on 07.09.2023.
//

import SwiftUI
import UIKit

struct LoadingCartScreen: View {
    @State private var isLoading: Bool = true
    var body: some View {
        ZStack {
            VStack(
                alignment: .center,
                spacing: 15
            ) {
                Text(isLoading ? "Загрузка" : "Внутренняя ошибка сервера 🥲")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                
                ActivityIndicatorRepresentable(
                    isLoading: $isLoading,
                    color: .orange
                )
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLoading.toggle()
                }
            }
        }
    }
}


struct LoadingCartScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoadingCartScreen()
    }
}
