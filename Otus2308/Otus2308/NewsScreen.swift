//
//  NewsScreen.swift
//  Otus2308
//
//  Created by Galagan Sergey on 11.09.2023.
//

import SwiftUI
import NewsapiNetworking

final class NewsViewModel: ObservableObject {
    @Published var articles: [Article] = .init()
    
    @Published var articles2D: [[Article]] = .init()
    
    init() {
        nextPage()
    }
    
    func nextPage() {
        ArticlesAPI.everythingGet(
            q: "iPhone 15",
            from: "2023-09-01",
            sortBy: "publishedAt",
            language: "en",
            apiKey: "f88288f4bca14599a2334cadfb3d6f4b") { [weak self] data, error in
                self?.articles = data?.articles ?? []
                self?.collectArticles2D()
            }
    }
    
    func collectArticles2D() {
        let columned = articles.publisher.collect(3)
        _ = columned.collect().sink {
            self.articles2D = $0
        }
    }
    
}

struct NewsScreen: View {
    @StateObject var newsVM = NewsViewModel()
    private let listOptions = ["list", "Grid", "Grid ios 13"]
    @State private var listOptionsIndex = 0
    
    var body: some View {
        VStack(alignment: .center,
               spacing: 20) {
            Picker("", selection: $listOptionsIndex) {
                ForEach(listOptions, id: \.self) { option in
                    Text(option)
                        .tag(listOptions.firstIndex(of: option) ?? 0)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            
            switch listOptionsIndex {
            case 0: list
            case 1: grid
            case 2: gridIos13
            default: EmptyView()
            }
        }
    }
    
    var list: some View {
        List(newsVM.articles) { article in
            //здесь сделано неправильно потому что нужно лейзи использовать
            ListArticCell(title: article.title ?? "", subTitle: article.description ?? "")
        }
    }
    
    var grid: some View {
        ScrollView {
            //Необходимо когда нужно сделать несколько столбцов и они не загружаются сразу как обычный стек
            LazyVGrid(columns: Array(repeating: .init(), count: 2)) {
                ForEach(newsVM.articles) { article in
                    ListArticCell(title: article.title ?? "", subTitle: article.description ?? "")
                }
            }
            .padding(.horizontal, 20)
        }
    }
    
    var gridIos13: some View {
        ScrollView {
            VStack(spacing: 8) {
                //MARK: - сделали чтобы искуственно создать ограничение на кол-во элементов в строке
                ForEach(0..<newsVM.articles2D.count, id: \.self) { row in
                    HStack(spacing: 8) {
                        ForEach(newsVM.articles2D[row]) { article in
                            ListArticCell(title: article.title ?? "", subTitle: article.description ?? "")
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
        }
    }
}

struct ListArticCell: View {
    let title: String
    let subTitle: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.mint)
            VStack {
                Text(title.isEmpty ? subTitle : title)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 200)
    }
}

extension Article: Identifiable {
    public var id: String { url }
}

struct NewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreen()
    }
}
