//
//  Tuning.swift
//  Otus2308
//
//  Created by Galagan Sergey on 15.09.2023.
//

import SwiftUI

struct Tuning: View {
    @State var isMove = false
    
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .offset(x: isMove ? 100 : 0, y: 0)
                .animation(.easeIn(duration: 2), value: isMove)
            
            Circle()
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .offset(x: isMove ? 100 : 0, y: 0)
                .animation(.easeIn.delay(2), value: isMove)
            
            Circle()
                .foregroundColor(.blue)
                .frame(width: 100, height: 100)
                .offset(x: isMove ? 200 : 0, y: isMove ? 30 : 0)
                .animation(.easeIn.repeatForever(autoreverses: true), value: isMove)
            
            
            Button {
                isMove.toggle()
            } label: {
                Text("Toggle")
            }
        }
    }
}

struct Tuning_Previews: PreviewProvider {
    static var previews: some View {
        Tuning()
    }
}
