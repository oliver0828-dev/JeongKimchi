//
//  SavedKimchiView.swift
//  Kimchi
//
//  Created by Oliver Park on 12/25/24.
//

import SwiftUI

struct FavoriteFoodsView: View {
    @State private var kimchiIngredientData: [KimchiIngredientsData] = KimchiIngredientsLists.kimchis
    @State private var locationData: [KimchiLocationData] = KimchiLocationList.kimchiLocations
    @EnvironmentObject var kimchiUser: KimchiUserData
    var body: some View {
        NavigationStack {
            List {
                ForEach(kimchiIngredientData.indices, id: \.self) { kimchi in
                    let kimchis = kimchiIngredientData[kimchi]
                    if kimchis.isFavorite == true {
                    NavigationLink {
                        KimchiView(kimchiName: kimchis.name,
                                   spiceLevel: kimchis.spiceLevel,
                                   isFavorite: $kimchiIngredientData[kimchi].isFavorite
                        )
                    } label: {
                        HStack {
                            Image("baechu")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 120, height: 80)
                            VStack(alignment: .leading) {
                                Text(kimchis.name)
                                Text(kimchis.koreanName)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                                Image(systemName: "flame.fill")
                                Text("\(kimchis.spiceLevel)")
                            }
                            
                        }
                    }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

#Preview {
    FavoriteFoodsView()
        .environmentObject(KimchiUserData())
}
