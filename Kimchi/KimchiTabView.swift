//
//  KimchiTabView.swift
//  Kimchi
//
//  Created by Oliver Park on 12/21/24.
//

import SwiftUI

struct KimchiTabView: View {
    @EnvironmentObject var kimchiUser: KimchiUserData
    @State private var selectedTab: Int = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            KimchiRecipeView(isFavorite: $kimchiUser.isFavorite)
                .tabItem {
                    Label("Recipes", systemImage: "list.bullet.clipboard")
                }
                .tag(0)

            FavoriteFoodsView(selectedTab: $selectedTab) // Pass Binding
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
                .tag(1) // Tag for Favorites Tab

            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(2) // Tag for Search Tab
        }
    }
}

#Preview {
    KimchiTabView()
        .environmentObject(KimchiUserData())
}
