//
//  CustomCircle.swift
//  Otus2308
//
//  Created by Galagan Sergey on 15.09.2023.
//

import SwiftUI

struct CustomCircle: Shape, Animatable {
    var radius: CGFloat
    
    //Для кастомных элементов, чтобы анимировать, нужно подписать на протокол Animatable и реализовать animatableData
    var animatableData: CGFloat {
        get { radius }
        set { radius = newValue }
        
    }
    func path(in rect: CGRect) -> Path {
        Path { path in
            let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
            //Ставим точку
            path.move(to: center)
            
            let startAngle = Angle(degrees: 0)
            path.addArc(center: center,
                        radius: radius,
                        startAngle: startAngle,
                        endAngle: startAngle + Angle(degrees: 360),
                        clockwise: false)
        }
    }
}
