//
//  KimchiRelatedView.swift
//  Kimchi
//
//  Created by Oliver Park on 12/31/24.
//

import SwiftUI

struct KimchiRelatedView: View {
    @State private var KimchiRelatedFoodsData: [KimchiRelatedFoodsData] = KimchiRelatedFoodsList.kimchiRelatedFoods
    @State var kimchiName: String
    @State var isFavorite: Bool = false
    @State var tag: Int
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    var body: some View {
        ScrollView {
            ForEach(KimchiRelatedFoodsData.indices, id: \.self) { food in
                let kimchiFood = KimchiRelatedFoodsData[food]
                if kimchiName == kimchiFood.kimchiName && kimchiFood.tag == tag {
                    VStack {
                        Image("baechu")
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 20))
                         
                        
                        HStack {
                            Text(kimchiFood.foodName)
                                .fontDesign(.rounded)
                                .font(.title)
                                .fontWeight(.bold)
                            Spacer()
                        }
                        
                        HStack {
                            HStack {
                                Image(systemName: "person.2.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 35, height: 35)
                                Text("\(2)")
                            }
                            .foregroundStyle(.gray)
                            .frame(width: 100, height: 50)
                            .background(Color.gray.opacity(0.3))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                            Spacer()
                            
                            NavigationLink {
                                
                            } label: {
                                HStack {
                                    Image(systemName: "play.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 20, height: 20)
                                    Text("Start")
                                        .font(.title3)
                                }
                                .frame(width: 150, height: 50)
                                .background(Color.blue.opacity(0.3))
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                            }
                            
                            Button {
                                // Timer action (placeholder)
                            } label: {
                                Image(systemName: "timer.circle")
                                    .resizable()
                                    .foregroundStyle(.orange)
                            }
                            .frame(width: 50, height: 50)
                            .background(Color.orange.opacity(0.3))
                            .clipShape(Circle())
                        }
                    
                        
                        VStack {
                            HStack {
                                Text("Ingredients")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                Spacer()
                            }
                            
                            IngredientsView(kimchiName: kimchiFood.kimchiName)
                        }
                    }
                    .frame(maxWidth: horizontalSizeClass == .compact ? .infinity : 700)
                    .padding()
                    .fontDesign(.rounded)
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    KimchiRelatedView(kimchiName: "Cabbage Kimchi", tag: 1)
}
