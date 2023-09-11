//
//  TabBarViewModel.swift
//  Otus2308
//
//  Created by Galagan Sergey on 03.09.2023.
//

import Combine

final class TabViewModel: ObservableObject {
    @Published var tabIndex = TabBarIndex.profile.rawValue
    //NOTE: не особо запаривался над зависимостьями, поскольку ловил млрд багов с биндингами, стейтами и т.п.
    @Published var isRandomProductNeeded = false
}
