//
//  CancellableSetWrapper.swift
//  Otus2308
//
//  Created by Galagan Sergey on 03.09.2023.
//

import Combine

final class CancellableSetWrapper {
    var cancellables = Set<AnyCancellable>()
}
