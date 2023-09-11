//
//  MenuViewModelScreen.swift
//  Otus2308
//
//  Created by Galagan Sergey on 03.09.2023.
//

import Combine
import Foundation

final class MenuViewModelScreen: ObservableObject {
    @Published var products: [Product] = [
        .init(kind: .vegetables, name: "Огурец", smileText: "🥒"),
        .init(kind: .vegetables, name: "Помидор", smileText: "🍅"),
        .init(kind: .vegetables, name: "Баклажан", smileText: "🍆"),
        .init(kind: .fruits, name: "Яблоко", smileText: "🍎"),
        .init(kind: .fruits, name: "Груша", smileText: "🍐"),
        .init(kind: .fruits, name: "Манго", smileText: "🥭"),
        .init(kind: .fruits, name: "Лимон", smileText: "🍋"),
        .init(kind: .berries, name: "Арбуз", smileText: "🍉"),
        .init(kind: .berries, name: "Черника", smileText: "🫐"),
        .init(kind: .berries, name: "Клубника", smileText: "🍓")
    ]
}

extension MenuViewModelScreen {
    enum ProductsKind: String, CaseIterable {
        case vegetables = "Овощи"
        case fruits = "Фрукты"
        case berries = "Ягоды"
    }
    
    struct Product: Identifiable, Hashable {
        var id = UUID()
        let kind: ProductsKind
        let name: String
        let smileText: String
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(id)
            hasher.combine(kind)
            hasher.combine(name)
            hasher.combine(smileText)
        }
    }
}
