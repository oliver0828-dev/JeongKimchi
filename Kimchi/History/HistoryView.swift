//
//  HistoryView.swift
//  Kimchi
//
//  Created by Oliver Park on 12/25/24.
//

import SwiftUI

struct HistoryView: View {
    @State var topFivekimchiHistoryData: [TopFiveKimchiHistoryData] = KimchiHistoryDataList.TopFiveKimchiHistoryDataList
    
    @State var kimchiIngredientsData: [KimchiIngredientsData] = KimchiIngredientsLists.kimchis
    
    let rows = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Image(systemName: "trophy.fill")
                                .foregroundStyle(.yellow)
                            Text("Origins of Top 5 Kimchi")
                                .font(.title2.bold())
                        }
                        ForEach(topFivekimchiHistoryData.indices, id: \.self) { kimchi in
                            let TopFiveKimchi = topFivekimchiHistoryData[kimchi]
                            
                            HStack {
                                VStack (alignment: .leading){
                                    Text(TopFiveKimchi.kimchiName)
                                    Text(TopFiveKimchi.kimchiKoreanName)
                                        .font(.caption)
                                }
                                Spacer()
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(Color.red.opacity(0.5))
                            .clipShape(.rect(cornerRadius: 15))
                        }
                        
             
                        HStack {
                            Image(systemName: "globe.asia.australia.fill")
                                .foregroundStyle(.blue)
                            Text("Fun Facts - Varieties")
                                .font(.title2.bold())
                        }
                        
                        LazyHGrid(rows: rows) {
                            ForEach(kimchiIngredientsData.indices, id: \.self) { kimchi in
                                let kimchis = kimchiIngredientsData[kimchi]
                                if kimchis.type == "Regional" || kimchis.type == "Special"{
                                    HStack {
                                        VStack {
                                            Text(kimchis.name)
                                        }
                                        Spacer()
                                    }
                                    .frame(width: 100, height: 100)
                                    .padding()
                                    .background(.red.opacity(0.5))
                                }
                            }
                        }
                        
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .fontDesign(.rounded)
            .navigationTitle("History")
        }
    }
}

#Preview {
    HistoryView()
}
