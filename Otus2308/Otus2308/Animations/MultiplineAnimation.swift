//
//  MultiplineAnimation.swift
//  Otus2308
//
//  Created by Galagan Sergey on 15.09.2023.
//

import SwiftUI

struct MultiplineAnimation: View {
    @State var isRed = false
    @State var isMove = false
    
    var body: some View {
        VStack {
            //MARK: т..е внутри для компонента есть анимация + для общего контейнера анимация
            SubviewCircle(isRed: $isRed)
                .offset(x: isMove ? 0 : 100, y: 0)
                .animation(.easeIn(duration: 1), value: isMove)
            
            Button {
                isRed.toggle()
                isMove.toggle()
            } label: {
                Text("Toggle")
            }
        }
    }
}

struct MultiplineAnimation_Previews: PreviewProvider {
    static var previews: some View {
        MultiplineAnimation()
    }
}
