//
//  ProfileScreen.swift
//  Otus2308
//
//  Created by Galagan Sergey on 03.09.2023.
//

import SwiftUI

struct ProfileScreen: View {
    var body: some View {
        VStack {
            Text("Отсутствуют данные профиля")
                .padding(.bottom, 20)
            
            Button {
                mainCoordinator.tabIndex = TabBarIndex.menu.rawValue
                mainCoordinator.isPresentedNowProduct = true
            } label: {
                Text("Перейти к меню")
                    .font(.system(size: 20, weight: .semibold))
            }
            .frame(width: 300,
                   height: 50,
                   alignment: .center)
            .foregroundColor(Color.white)
            .background(.red)
            .cornerRadius(12)
        }
    }
    
    @EnvironmentObject private var mainCoordinator: MainCoordinatorManager
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}
