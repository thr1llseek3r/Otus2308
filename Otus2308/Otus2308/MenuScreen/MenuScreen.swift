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
    @StateObject var viewModel = MenuViewModelScreen()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(MenuViewModelScreen.ProductsKind.allCases, id: \.self) { kind in
                    Section(kind.rawValue) {
                        ForEach(0..<viewModel.products.count, id: \.self) { index in
                            let product = viewModel.products[index]
                            if kind == product.kind {
                                NavigationLink(destination: ProductScreen(product: product)) {
                                    HStack {
                                        Text(product.name)
                                            .font(.system(size: 16))
                                        Spacer()
                                        Text(product.smileText)
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
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}

