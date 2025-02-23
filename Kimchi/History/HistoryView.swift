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
                            
                            NavigationLink {
                                OriginView(kimchiName: TopFiveKimchi.kimchiName)
                            } label: {
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
                        }
                        VStack {
                            HStack {
                                Image(systemName: "takeoutbag.and.cup.and.straw.fill")
                                    .foregroundStyle(.blue)
                                Text("Related Foods")
                                    .font(.title2.bold())
                            }
                            Text("Foods that go along with Kimchis")
                                .font(.caption)
                        }
                        
                        
                        
                    }
                    
                    Spacer()
                }
                .padding()
            }
            .fontDesign(.rounded)
            .navigationTitle("Explore")
        }
    }
}

#Preview {
    HistoryView()
}
