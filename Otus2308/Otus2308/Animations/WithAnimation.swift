//
//  WithAnimation.swift
//  Otus2308
//
//  Created by Galagan Sergey on 15.09.2023.
//

import SwiftUI

struct WithAnimation: View {
    @State var isRed = false
    @State var isMove = false
    
    
    var body: some View {
        VStack {
            Circle()
                .foregroundColor(isRed ? .red : .blue)
                .frame(width: 100, height: 100)
                .offset(x: isMove ? 100 : 0, y: 0)
            //.animation(.easeIn(duration: 2), value: isMove)
            
            Button {
                //анимация выше не нужна, делаем объединение
                withAnimation(.easeIn(duration: 5)) {
//                    isMove.toggle()
                    isRed.toggle()
                }
                // при этом мы можем отдельно их вызывать и также группировать и настраивать время и т.д.
                
                //При этом он доступен из любого места, т.е. примеру к биндингу, изменению стейта, подписке и т.д. не нужно к вьюхе привязывать
                withAnimation(.easeOut(duration: 1)) {
                    isMove.toggle()
                }
                
                
            } label: {
                Text("Toggle")
            }
        }
    }
}

struct WithAnimation_Previews: PreviewProvider {
    static var previews: some View {
        WithAnimation()
    }
}
