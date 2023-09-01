//
//  FoodScreen.swift
//  AppSUI2308
//
//  Created by Exey Panteleev on 31.08.2023.
//

import SwiftUI

struct Food: Identifiable {
    let name: String
    let id: UUID = .init()
}

final class FoodListViewModel: ObservableObject {
    
    @Published var isSheetShowed: Bool = false
    
    @Published private(set) var foods = [
        Food(name: "🥑"),
        Food(name: "🍕"),
        Food(name: "🥗"),
        Food(name: "🍠"),
        Food(name: "🍫"),
        Food(name: "🥝"),
    ]
    
}

struct FoodScreen: View {
    
    @StateObject var foodListVM: FoodListViewModel = .init()
    //@EnvironmentObject var foodListVM: FoodListViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            List (foodListVM.foods) { food in
                NavigationLink (destination: Text(food.name).font(.system(size: 200))) {
                    HStack {
                        Text(food.name)
                    }
                }
                .listRowSeparator(.hidden)
            }
            
            Spacer()
            
            Button {
                foodListVM.isSheetShowed.toggle()
            } label: {
                Text("Sheet")
            }
            .sheet(isPresented: $foodListVM.isSheetShowed, content: {
                Text("📜").font(.system(size: 200))
            })
            .buttonStyle(.borderedProminent)
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Back")
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Foods")
        .navigationBarTitleDisplayMode(.large)
        .navigationBarBackButtonHidden(true)
    }
}

struct FoodScreen_Previews: PreviewProvider {
    static var previews: some View {
        FoodScreen()
    }
}
