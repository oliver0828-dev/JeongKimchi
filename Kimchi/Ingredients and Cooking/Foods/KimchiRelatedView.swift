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
                        
                        Divider()
                        
                        VStack (alignment: .leading){
                            Text("Description")
                                .font(.title2)
                                .fontWeight(.semibold)
                               
                            Text(kimchiFood.description)
                                
                        }
                        .frame(maxWidth: .infinity)
                        
                        HStack {
            
                           
                        }
                    
                        
                      
                    }
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
