//
//  ActivityIndicatorRePresentable.swift
//  Otus2308
//
//  Created by Galagan Sergey on 07.09.2023.
//

import UIKit
import SwiftUI

struct ActivityIndicatorRepresentable: UIViewRepresentable {
    init(isLoading: Binding<Bool>, color: UIColor) {
        self._isLoading = isLoading
        self.color = color
    }
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        activityIndicator()
    }
    
    //update SUI to UIKit
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.color = color
       // context.coordinator.startAndStopActivity()
        isLoading ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
    private func activityIndicator() -> UIActivityIndicatorView {
        let activity = UIActivityIndicatorView(frame: .zero)
        activity.style = .large
        
        return activity
    }
    
    @Binding private var isLoading: Bool
    private let color: UIColor
}
