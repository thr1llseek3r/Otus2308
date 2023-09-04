//
//  MenuScreen.swift
//  Otus2308
//
//  Created by Galagan Sergey on 03.09.2023.
//

import SwiftUI

struct ProductScreen: View {
    let product: MenuViewModelScreen.Product
    var body: some View {
        Text(product.name)
    }
}

struct MenuScreen: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(MenuViewModelScreen.ProductsKind.allCases, id: \.self) { kind in
                    Section(kind.rawValue) {
                        ForEach(0..<viewModel.products.count, id: \.self) { index in
                            let product = viewModel.products[index]
                            if kind == product.kind {
                                NavigationLink(
                                    destination: ProductScreen(product: product),
                                    tag: product.name,
                                    selection: Binding(
                                        get: {
                                            selector
                                        }, set: { value in
                                            selector = value ?? ""
                                        }
                                    )
                                ) {
                                    HStack {
                                        Text(product.name)
                                            .font(.system(size: 16))
                                        Spacer()
                                        Text(product.smileText)
                                    }
                                }
                                .onAppear {
                                    let randomIndex = Int.random(in: 0..<viewModel.products.count)
                                    guard
                                        mainCoordinator.isPresentedNowProduct,
                                        viewModel.products.indices.contains(index)
                                    else { return }
                                    
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                        self.selector = viewModel.products[index].name
                                        self.mainCoordinator.isPresentedNowProduct.toggle()
                                    }
                                }
                            }
                        }
                    }
                    .font(.system(size: 22, weight: .semibold))
                }
            }
            .listStyle(.automatic)
            .navigationTitle("Меню")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            
        }
    }
    
    @EnvironmentObject private var mainCoordinator: MainCoordinatorManager
    @ObservedObject private var viewModel = MenuViewModelScreen()
    @State private var selector = ""
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}

