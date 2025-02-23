//
//  OriginView.swift
//  JeongKimchi
//
//  Created by Oliver Park on 2/9/25.
//

import SwiftUI
import MapKit

struct OriginView: View {
    @State var kimchiName: String
    @State private var kimchiHistoryOriginData = KimchiHistoryDataList.TopFiveKimchiHistoryDataList
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ZStack {
                ForEach(kimchiHistoryOriginData, id: \.id) { kimchi in
                    if kimchiName == kimchi.kimchiName {
                        Map(initialPosition: .region(MKCoordinateRegion(
                            center: CLLocationCoordinate2D(
                                latitude: kimchi.kimchiOriginLatitude,
                                longitude: kimchi.kimchiOriginLongitude
                            ),
                            span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
                        ))) {
                            Marker("\(kimchi.kimchiName) Origin", coordinate: CLLocationCoordinate2D(
                                latitude: kimchi.kimchiOriginLatitude,
                                longitude: kimchi.kimchiOriginLongitude
                            ))
                        }
                        .ignoresSafeArea(edges: .top)  // Stretch map to the top edge
                        .frame(maxHeight: .infinity)
                    }
                }
                
                ScrollView {
                    Spacer()
                    VStack(spacing: 16) {
                        ForEach(kimchiHistoryOriginData, id: \.id) { kimchi in
                            if kimchiName == kimchi.kimchiName {
                                VStack(spacing: 16) {
                                    Text("\(kimchiName)'s Origin")
                                        .font(.title)
                                        .bold()
                                        .padding(.top, 50)
                                    
                                    Text("\(kimchi.kimchiOriginLocation)")
                                        .font(.headline)
                                        .padding(.horizontal)
                                    
                                    Text(kimchi.kimchiDescription)
                                        .padding()
                                        .background(colorScheme == .dark ? .gray.opacity(0.8) : .white.opacity(0.8))
                                        .cornerRadius(10)
                                        .multilineTextAlignment(.leading)
                                        .padding(.horizontal)
                                    
//                                    NavigationLink {
//                                        KimchiView(kimchiName: kimchiName)
//                                    } label: {
//                                        Text("Learn How to Cook")
//                                    }
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(colorScheme == .dark ? Color.gray.opacity(0.9) : Color.white.opacity(0.9))
                                        .shadow(radius: 5)
                                )
                                .padding(.top, 100)
                            }
                        }
                    }
                    .padding()
                    
                    Spacer()
                }
            }
        }
        
    }
}

#Preview {
    OriginView(kimchiName: "Cabbage Kimchi")
}
