//
//  SavedKimchiView.swift
//  Kimchi
//
//  Created by Oliver Park on 12/25/24.
//

import SwiftUI

struct FavoriteFoodsView: View {
    @State private var kimchiIngredientData: [KimchiIngredientsData] = KimchiIngredientsLists.kimchis
    @EnvironmentObject var kimchiUser: KimchiUserData
    @Binding var selectedTab: Int

    var body: some View {
        NavigationStack {
            Group {
                if favoriteKimchis.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "heart.slash")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)

                        Text("No favorite kimchis yet!")
                            .font(.title3)
                            .bold()

                        Text("Tap the heart icon on any recipe to save your favorites.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .padding(.horizontal)

                        Button(action: {
                            selectedTab = 0 // Switch to Recipes Tab
                        }) {
                            Text("Browse Kimchi Recipes")
                                .fontWeight(.bold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding(.horizontal, 40)
                    }
                    .padding()
                } else {
                    // Favorites List
                    List {
                        ForEach(favoriteKimchis.indices, id: \.self) { index in
                            let kimchi = favoriteKimchis[index]
                            NavigationLink {
                                KimchiView(
                                    kimchiName: kimchi.name,
                                    spiceLevel: kimchi.spiceLevel,
                                    isFavorite: $kimchiIngredientData[index].isFavorite
                                )
                            } label: {
                                HStack(spacing: 12) {
                                    // Kimchi Image
                                    Image(kimchi.imageName)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 80)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .shadow(radius: 3)

                                    // Kimchi Info
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(kimchi.name)
                                            .font(.headline)

                                        Text(kimchi.koreanName)
                                            .font(.subheadline)
                                            .foregroundColor(.gray)

                                        
                                        HStack(spacing: 2) {
                                            ForEach(0..<kimchi.spiceLevel, id: \.self) { _ in
                                                Image(systemName: "flame.fill")
                                                    .foregroundColor(.red)
                                            }
                                        }
                                        .font(.subheadline)
                                    }

                                    Spacer()

                                    Button(action: {
                                        withAnimation(.spring()) {
                                            kimchiIngredientData[index].isFavorite.toggle()
                                            if kimchiIngredientData[index].isFavorite {
                                                kimchiUser.isFavorite = true
                                                kimchiUser.isFavorite = kimchiIngredientData[index].isFavorite
                                            }
                                        }
                                    }) {
                                        Image(systemName: kimchi.isFavorite ? "heart.fill" : "heart")
                                            .foregroundColor(kimchi.isFavorite ? .red : .gray)
                                    }
                                }
                                .padding(.vertical, 8)
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .navigationTitle("Favorites")
        }
    }

    var favoriteKimchis: [KimchiIngredientsData] {
        kimchiIngredientData.filter { $0.isFavorite }
    }
}

#Preview {
    FavoriteFoodsView(selectedTab: .constant(1))
        .environmentObject(KimchiUserData())
}
