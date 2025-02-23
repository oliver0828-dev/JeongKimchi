//
//  ContentView.swift
//  Kimchi
//
//  Created by Oliver Park on 12/9/24.
//

import SwiftUI
import SwiftData

struct KimchiView: View {
    @State var kimchiName: String
    @State var spiceLevel: Int
    @State private var showNotes = false
    @State private var showMaps = false
    @Binding var isFavorite: Bool
    
    
    @State private var KimchiIngredientsList: [KimchiIngredientsData] = KimchiIngredientsLists.kimchis
    @State private var KimchiRelatedFoodsData: [KimchiRelatedFoodsData] = KimchiRelatedFoodsList.kimchiRelatedFoods
    
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var kimchiUser: KimchiUserData
    
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(KimchiIngredientsList.indices, id: \.self) { index in
                    let kimchiIngredients = KimchiIngredientsList[index]
                    
                    if kimchiName == kimchiIngredients.name {
                        VStack {
                            Image(kimchiIngredients.imageName)
                                .resizable()
                                .scaledToFit()
                                .clipShape(.rect(cornerRadius: 20))
                                .frame(maxWidth: horizontalSizeClass == .compact ? .infinity : 700)
                        
                            Text("Source: " + kimchiIngredients.sourceName)
                                .font(.caption)
                                .foregroundStyle(.gray)
                            
                            
                            HStack {
                                Text(kimchiIngredients.name)
                                    .fontDesign(.rounded)
                                    .font(.title)
                                    .fontWeight(.bold)
                                Spacer()
                            }
                            .padding()
                            .frame(maxWidth: horizontalSizeClass == .compact ? .infinity : 700)
                            
                            VStack {
                                HStack {
                                    
                                    NavigationLink {
                                        
                                        CookingView(kimchi: kimchiIngredients, kimchiName: kimchiIngredients.name)
                                        
                                    } label: {
                                        HStack {
                                            Image(systemName: "frying.pan")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 30, height: 20)
                                            Text("Cook")
                                                .font(.title3)
                                        }
                                        .frame(width: 150, height: 50)
                                        .background(Color.blue.opacity(0.3))
                                        .clipShape(.rect(cornerRadius: 20))
                                    }
                                    Spacer()
                                }
                                
                                HStack {
                                    HStack {
                                        Image(systemName: "person.2.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 35, height: 35)
                                        Text("\(kimchiIngredients.peoplePerServing)")
                                    }
                                    .foregroundStyle(.gray)
                                    .frame(width: 100, height: 60)
                                    .background(Color.gray.opacity(0.3))
                                    .clipShape(.rect(cornerRadius: 20))
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        PrepCookAddStack(imageName: "basket", name: "Prep", time: kimchiIngredients.prepTime)
                                            .padding()
                                        PrepCookAddStack(imageName: "cooktop", name: "Cook", time: kimchiIngredients.cookTime)
                                            .padding()
                                        PrepCookAddStack(imageName: "hourglass.badge.plus", name: kimchiIngredients.additionalTimeDescription, time: kimchiIngredients.additionalTime)
                                            .padding()
                                        
                                        Spacer()
                                    }
                                    .foregroundStyle(.gray)
                                    .frame(height: 60)
                                    .background(.gray.opacity(0.3))
                                    .clipShape(.rect(cornerRadius: 20))
                                }
                                
                                
                            }
                            .frame(maxWidth: horizontalSizeClass == .compact ? .infinity : 700)
                            
                            
                            VStack {
                                
                                IngredientsView(kimchiName: kimchiIngredients.name)
                                
                            }
                            .frame(maxWidth: horizontalSizeClass == .compact ? .infinity : 700)
                            
                            if kimchiIngredients.isHistory {
                                VStack (alignment: .leading) {
                                    HStack {
                                        Text("History & Origin")
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                        Spacer()
                                    }
                                    
                                    NavigationLink {
                                        OriginView(kimchiName: kimchiName)
                                    } label: {
                                        VStack (alignment: .center) {
                                            HStack {
                                                Text("Learn More")
                                                Text(kimchiName)
                                                    .fontWeight(.semibold)
                                                Image(systemName: "arrow.up.forward.app")
                                            }
                                            .padding()
                                        
                                            .foregroundStyle(.white)
                                            .frame(maxWidth: .infinity, maxHeight: 70)
                                            .background(.blue)
                                            .clipShape(.rect(cornerRadius: 20))
                                        }
                                    }
                                }
                                .frame(maxWidth: horizontalSizeClass == .compact ? .infinity : 700)
                            }
                            
                            if kimchiIngredients.isRelated {
                                VStack(alignment: .leading) {
                                    Text("Related Foods")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .padding(.top)
                                    
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack {
                                            ForEach(KimchiRelatedFoodsData.filter { $0.kimchiName == kimchiName }, id: \.id) { relatedFood in
                                                
                                                NavigationLink {
                                                    KimchiRelatedView(kimchiName: relatedFood.kimchiName, tag: relatedFood.tag)
                                                } label: {
                                                    RelatedFoodsListView(
                                                        relatedFoodName: relatedFood.foodName,
                                                        koreanName: relatedFood.koreanFoodName, imageName: relatedFood.imageName
                                                    )
                                                }
                                                
                                            }
                                        }
                                        .padding(.horizontal)
                                    }
                                }
                            }
                        }
                        .padding()
                        .fontDesign(.rounded)
                        Spacer()
                    }
                }
            }
            .scrollIndicators(.automatic)
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        showMaps.toggle()
                    } label: {
                        Image(systemName: "map")
                    }
                    .sheet(isPresented: $showMaps) {
                        MapView(kimchiName: kimchiName)
                    }
                    
                    
                    Button {
                        isFavorite.toggle()
                        if isFavorite {
                            kimchiUser.isFavorite = true
                            kimchiUser.isFavorite = isFavorite
                        }
                    } label: {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundStyle(isFavorite ? Color.red : Color.blue)
                    }
                }
            }
        }
    }
}



#Preview {
    KimchiView(kimchiName: "Cabbage Kimchi", spiceLevel: 1, isFavorite: .constant(true))
        .environmentObject(KimchiUserData())
}

struct RelatedFoodsListView: View {
    @State var relatedFoodName: String
    @State var koreanName: String
    @State var imageName: String
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .clipShape(.rect(cornerRadius: 15))
                    .frame(width: 150, height: 80)
                VStack(alignment: .leading) {
                    Text(relatedFoodName)
                        .font(.headline)
                    Text(koreanName)
                        .font(.caption)
                }
                .foregroundStyle(colorScheme == .dark ? .white : .black)
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
        .background(Color.gray.opacity(0.2))
        .clipShape(.rect(cornerRadius: 10))
    }
}


struct PrepCookAddStack: View {
    @State var imageName: String
    @State var name: String
    @State var time: Int
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        if horizontalSizeClass != .compact {
            HStack {
                VStack {
                    
                    Image(systemName: imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    
                    HStack {
                        Text(name)
                            .fontWeight(.semibold)
                        Text("\(time)")
                    }
                    
                    
                }
                
            }
        } else {
            VStack {
                Text(name)
                    .fontWeight(.semibold)
                Text("\(time)")
            }
            .font(.custom("SFProText-Regular", size: 14))
        }
        
    }
}
