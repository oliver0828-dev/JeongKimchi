//
//  MapView.swift
//  Kimchi
//
//  Created by Oliver Park on 12/18/24.
//

import SwiftUI
import MapKit

extension CLLocationCoordinate2D {
    static let seoul = CLLocationCoordinate2D(latitude: 37.5652, longitude: 126.9774)
}

struct MapView: View {
    @State private var kimchiLocationList: [KimchiLocationData] = KimchiLocationList.kimchiLocations
    @State private var mapPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: .seoul,
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    var kimchiName: String
    @Environment(\.colorScheme) private var colorScheme
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.dismiss) var dismiss

    var filteredLocations: [KimchiLocationData] {
        kimchiLocationList.filter { $0.kimchiType == kimchiName }
    }

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Map(position: $mapPosition) {
                        ForEach(filteredLocations, id: \.id) { location in
                            Marker(location.name, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
                        }
                        UserAnnotation()
                    }
                    .clipped() // Prevents the Map from extending behind navigation and tab bars
                    .frame(height: 300)
                    .cornerRadius(15)
                    .padding()

                    Divider()

                    VStack(alignment: .leading) {
                        Text("Famous Places")
                            .font(.title2.bold())
                            .padding(.bottom, 10)
                        HStack {
                            Text("1 = Mild")
                                .foregroundStyle(.green)
                            Text("2 = Lightly Spicy")
                                .foregroundStyle(.orange)
                            Text("3 = Spicy")
                                .foregroundStyle(.red)
                        }
                        .font(.subheadline)
                        .fontWeight(.semibold)

                        ForEach(filteredLocations, id: \.id) { kimchiLocation in
                            Button {
                                mapPosition = .region(
                                    MKCoordinateRegion(
                                        center: CLLocationCoordinate2D(latitude: kimchiLocation.latitude, longitude: kimchiLocation.longitude),
                                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                                    )
                                )
                            } label: {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(kimchiLocation.name)
                                            .font(.title3.bold())
                                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                                        Text(kimchiLocation.translateName)
                                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                                        Text(kimchiLocation.address)
                                            .multilineTextAlignment(.leading)
                                            .font(.caption)
                                            .foregroundStyle(.gray)
                                    }
                                    Spacer()
                                    VStack {
                                        HStack {
                                            Image(systemName: "flame")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 25, height: 25)
                                            Text("\(kimchiLocation.spiceLevel)")
                                                .font(.title3)
                                        }
                                        .foregroundStyle(spiceLevelTextColor(spice: kimchiLocation.spiceLevel))

                                        
                                    }
                                }
                                .padding()
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                            }
                            .padding(.bottom, 5)
                        }
                    }
                    .padding()
                }
                .toolbar {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.gray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .fontDesign(.rounded)
        }
        .navigationBarHidden(true)
    }
    
    func spiceLevelTextColor(spice: Int) -> Color {
        switch spice {
        case 1:
            return .green
        case 2:
            return .orange
        default:
            return .red
        }
    }


    
    
}

#Preview {
    MapView(kimchiName: "Cabbage Kimchi")
        .environmentObject(KimchiUserData())
    
}


