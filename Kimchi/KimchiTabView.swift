//
//  KimchiTabView.swift
//  Kimchi
//
//  Created by Oliver Park on 12/21/24.
//

import SwiftUI

struct KimchiTabView: View {
    @EnvironmentObject var kimchiUser: KimchiUserData
    var body: some View {
        TabView {
            KimchiRecipeView(isFavorite: $kimchiUser.isFavorite)
                .tabItem {
                    Label("Recipes", systemImage: "list.bullet.clipboard")
                }
            HistoryView()
                .tabItem {
                    Label("Explore", systemImage: "safari.fill")
                }
            FavoriteFoodsView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            ImageHomeView()
                .tabItem {
                    Label("Notes", systemImage: "note.text")
                }
        }
    }
}

#Preview {
    KimchiTabView()
        .environmentObject(KimchiUserData())
        .environmentObject(ImageData())
}
