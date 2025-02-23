//  KimchiSelectView.swift
//  Kimchi
//
//  Created by Oliver Park on 12/21/24.

import SwiftUI

struct KimchiRecipeView: View {
    @State private var KimchiIngredientsList: [KimchiIngredientsData] = KimchiIngredientsLists.kimchis
    @Binding var isFavorite: Bool
    
    let iPadcolumns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let iPhonecolumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @EnvironmentObject var kimchiUser: KimchiUserData
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: horizontalSizeClass == .compact ? iPhonecolumns : iPadcolumns, spacing: 16) {
                    ForEach(KimchiIngredientsList.indices, id: \.self) { index in
                        let kimchi = KimchiIngredientsList[index]
                        
                        NavigationLink {
                            KimchiView(kimchiName: kimchi.name, spiceLevel: kimchi.spiceLevel, isFavorite: $KimchiIngredientsList[index].isFavorite)
                        } label: {
                            VStack(alignment: .leading, spacing: 10) {
                                // Recipe Title and Favorite Button
                                HStack {
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(kimchi.name)
                                            .font(.headline)
                                            .foregroundColor(colorScheme == .dark ? .white : .black)
                                            .multilineTextAlignment(.leading)
                                        
                                        Text(kimchi.koreanName)
                                            .font(.subheadline)
                                            .foregroundColor(colorScheme == .dark ? .gray : .black.opacity(0.7))
                                    }
                                    
                                    Spacer()
                                    
                                    // Favorite Button with Animation
                                    Button {
                                        withAnimation(.spring()) {
                                            KimchiIngredientsList[index].isFavorite.toggle()
                                            if KimchiIngredientsList[index].isFavorite {
                                                kimchiUser.isFavorite = true
                                                kimchiUser.isFavorite = KimchiIngredientsList[index].isFavorite
                                            }
                                        }
                                    } label: {
                                        Image(systemName: kimchi.isFavorite ? "heart.fill" : "heart")
                                            .foregroundColor(kimchi.isFavorite ? .red : .gray)
                                            .scaleEffect(kimchi.isFavorite ? 1.2 : 1.0)
                                            .animation(.easeInOut, value: kimchi.isFavorite)
                                    }
                                }
                                
                                // Spice Level
                                HStack(spacing: 4) {
                                    ForEach(0..<kimchi.spiceLevel, id: \.self) { _ in
                                        Image(systemName: "flame.fill")
                                            .foregroundColor(.red)
                                    }
                                }
                                
                                Spacer()
                                
                                // Serving Size and Cooking Time
                                HStack(spacing: 8) {
                                    Label("\(kimchi.peoplePerServing)", systemImage: "person.2.fill")
                                    Label("\(kimchi.totalTime)", systemImage: "clock.fill")
                                }
                                .foregroundStyle(.gray)
                                .font(.footnote)
                                .padding(8)
                                .background(colorScheme == .dark ? Color.gray.opacity(0.3) : Color.black.opacity(0.1))
                                .clipShape(Capsule())
                            }
                            .padding()
                            .background(colorScheme == .dark ? Color.blue.opacity(0.3) : Color.blue.opacity(0.1))
                            .cornerRadius(15)
                            .shadow(color: .black.opacity(0.1), radius: 5, x: 0, y: 3)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                            )
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    KimchiRecipeView(isFavorite: .constant(true))
        .environmentObject(KimchiUserData())
}
