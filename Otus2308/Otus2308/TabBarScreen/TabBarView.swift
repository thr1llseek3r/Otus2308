//
//  TabBarView.swift
//  Otus2308
//
//  Created by Galagan Sergey on 03.09.2023.
//

import SwiftUI
import Combine

enum TabBarIndex: Int {
    case profile = 0
    case menu
    case cart
}

struct TabBarView: View {
    @EnvironmentObject private var mainCoordinator: MainCoordinatorManager
    @StateObject private var viewModel = TabViewModel()
    
    var body: some View {
        TabView(selection: Binding(
            get: {
                viewModel.tabIndex
            }, set: { newValue in
                viewModel.tabIndex = newValue
            }
        )) {
            ProfileScreen()
                .tabItem {
                    Image(systemName: "person")
                    Text("Профиль")
                }
                .environmentObject(viewModel)
                .tag(TabBarIndex.profile.rawValue)
            
            MenuScreen()
                .tabItem {
                    Image(systemName: "menucard")
                    Text("Меню")
                }
                .tag(TabBarIndex.menu.rawValue)
            
            CartScreen()
                .tabItem {
                    Image(systemName: "basket")
                    Text("Корзина")
                }
                .tag(TabBarIndex.cart.rawValue)
        }
        .onReceive(mainCoordinator.$tabIndex, perform: { index in
            viewModel.tabIndex = index
        })
        .accentColor(.orange)
    }
    
    private var cancelBag = CancellableSetWrapper()
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
