//
//  ShapeExample.swift
//  Otus2308
//
//  Created by Galagan Sergey on 15.09.2023.
//

import SwiftUI

struct ShapeExample: View {
    @State var radius: CGFloat = 21
    
    
    var body: some View {
        VStack {
            CustomCircle(radius: radius)
                .foregroundColor(.mint)
            
            Slider(value: self.$radius, in: 0...100)
            
            Button {
                withAnimation {
                    radius = 42
                }
            } label: {
                Text("Reset")
            }
        }
       
    }
}

struct ShapeExample_Previews: PreviewProvider {
    static var previews: some View {
        ShapeExample()
    }
}
