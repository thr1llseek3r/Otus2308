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
    @StateObject private var viewModel = TabViewModel()
    
    var body: some View {
        TabView(selection: Binding(
            get: {
                index
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
        .onAppear() {
            setupUI()
            setupBindings()
        }
        .accentColor(.orange)
    }
    
    private func setupUI() {
        //NOTE: Implement UITabBar.appearance()
//        let tabBarAppearance =  UITabBar.appearance()
//        tabBarAppearance.backgroundColor = .black.withAlphaComponent(0.90)
//        tabBarAppearance.unselectedItemTintColor = .lightGray
    }
    
    private func setupBindings() {
        viewModel.$tabIndex
            .handleEvents( receiveOutput: { index in
                print(">>>>>> index - \(index)")
            })
            .sink { currentIndex in
                index = currentIndex
            }
            .store(in: &self.cancelBag.cancellables)
    }
    
    @State private var index = 0
    private var cancelBag = CancellableSetWrapper()
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
