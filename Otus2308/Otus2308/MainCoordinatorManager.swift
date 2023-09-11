//
//  MainCoordinatorManager.swift
//  Otus2308
//
//  Created by Galagan Sergey on 05.09.2023.
//

import Foundation

final class MainCoordinatorManager: ObservableObject {
    @Published var isPresentedNowProduct = false
    @Published var tabIndex: Int = 0
}
