//
//  BasicAnimations.swift
//  Otus2308
//
//  Created by Galagan Sergey on 15.09.2023.
//

import SwiftUI

struct BasicAnimations: View {
    @State var isRed = false
    @State var isMove = false
    
    var body: some View {
        Circle()
            .foregroundColor( isRed ? .red : .mint)
            .frame(width: 100, height: 100)
            .offset(x: isRed ? 0 : 100, y: 0)
        //при помощи модификатора задаются отдельные анимации к конкретной вьюхе
        //по дефолту есть набор готовых анимаций таких как .easeIn и т.д.
            .animation(.easeIn, value: isRed)
        //MARK: - нельзя применять .animation(.easeIn, value: isRed) к одной вью, применется та, что выше в списке, для этого есть отдельные параметры
        // .animation(.easeIn, value: isMove)
        
        Button {
            isRed.toggle()
        } label: {
            Text("Toggle")
        }

    }
}

struct BasicAnimations_Previews: PreviewProvider {
    static var previews: some View {
        BasicAnimations()
    }
}
