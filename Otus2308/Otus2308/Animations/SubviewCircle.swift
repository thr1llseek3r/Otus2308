//
//  SubviewCircle.swift
//  Otus2308
//
//  Created by Galagan Sergey on 15.09.2023.
//

import SwiftUI

struct SubviewCircle: View {
    @Binding var isRed: Bool
    
    var body: some View {
        Circle()
            .foregroundColor( isRed ? .red : .mint)
            .animation(.linear(duration: 6), value: isRed)
            .frame(width: 100, height: 100)
    }
}

//struct SubviewCircle_Previews: PreviewProvider {
//    static var previews: some View {
//        SubviewCircle()
//    }
//}
