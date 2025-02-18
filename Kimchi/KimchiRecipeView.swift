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
    
    
    
    @State private var scale: CGFloat = 1.0
    @State private var lastScale: CGFloat = 5.0
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @EnvironmentObject var kimchiUser: KimchiUserData
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ScrollView() {
                LazyVGrid(columns: horizontalSizeClass == .compact ? iPhonecolumns : iPadcolumns) {
                    ForEach(KimchiIngredientsList.indices, id: \.self) { index in
                        
                        let kimchi = KimchiIngredientsList[index]
                        
                        NavigationLink {
                            KimchiView(kimchiName: kimchi.name, spiceLevel: kimchi.spiceLevel, isFavorite: $KimchiIngredientsList[index].isFavorite)
                        } label: {
                            
                            VStack(alignment: .leading, spacing: 15) {
                                HStack {
                                    VStack (alignment: .leading) {
                                        
//                                        Image("baechu")
//                                            .resizable()
//                                            .scaledToFit()
//                                            .frame(width: 100, height: 50, alignment: .center)
                                        Text(kimchi.name)
                                            .fontWeight(.semibold)
                                            .fixedSize(horizontal: false, vertical: true)
                                            .multilineTextAlignment(.leading)
                                            .foregroundStyle(colorScheme == .dark ? Color.white : Color.black)
                                        Text(kimchi.koreanName)
                                            .font(.caption)
                                            .foregroundStyle(colorScheme == .dark ? Color.gray : Color.black.opacity(0.7))
                                    }
                                    
                                    Spacer()
                                    
                                }
                                HStack {
                                    VStack {
                                        HStack {
                                            ForEach(0..<kimchi.spiceLevel, id: \.self) { _ in
                                                Image(systemName : "flame.fill")
                                                    .foregroundStyle(.red)
                                            }
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                   
                                }
                                
                                Spacer()
                                
                                HStack {
                                    HStack {
                                        Image(systemName: "person.2.fill")
                                        Text("\(kimchi.peoplePerServing)")
                                        
                                        Image(systemName: "clock.fill")
                                        Text("\(kimchi.totalTime)")
                                        
                                    }
                                    .fontWeight(.semibold)
                                    .foregroundStyle(colorScheme == .dark ? Color.gray : Color.black.opacity(0.5))
                                    .frame(width: 125, height: 40)
                                    .background(colorScheme == .dark ? Color.gray.opacity(0.3) : Color.black.opacity(0.3))
                                    .clipShape(Capsule())
                                    
                                    Button {
                                        KimchiIngredientsList[index].isFavorite.toggle()
                                    } label: {
                                        Image(systemName: kimchi.isFavorite ? "heart.fill" : "heart")
                                            .foregroundStyle(kimchi.isFavorite ? Color.red : Color.red)
                                    }
                                }
                            }
                            .frame(width: 150, height: 160)
                            .padding()
                            .background(.blue.opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
}

#Preview {
    KimchiRecipeView(isFavorite: .constant(true))
        .environmentObject(KimchiUserData())
}
