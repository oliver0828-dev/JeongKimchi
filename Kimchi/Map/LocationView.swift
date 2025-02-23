//
//  LocationView.swift
//  Kimchi
//
//  Created by Oliver Park on 1/1/25.
//

import SwiftUI
import MapKit

struct LocationView: View {
    @State private var kimchiLocationList: [KimchiLocationData] = KimchiLocationList.kimchiLocations
    @State private var mapPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), // Default to Seoul
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    @State var placeName: String

    @Environment(\.colorScheme) private var colorScheme

    var selectedLocation: KimchiLocationData? {
        kimchiLocationList.first { $0.name == placeName }
    }

    var body: some View {
        ScrollView {
            if let kimchiLocation = selectedLocation {
                VStack(alignment: .leading, spacing: 16) {

                    // MARK: - Map View
                    Map(position: $mapPosition) {
                        Annotation(kimchiLocation.name, coordinate: CLLocationCoordinate2D(latitude: kimchiLocation.latitude, longitude: kimchiLocation.longitude)) {
                            Image(systemName: "mappin.circle.fill")
                                .foregroundColor(.red)
                                .font(.title)
                        }
                    }
                    .frame(maxWidth: .infinity, minHeight: 300, maxHeight: 300)
                    .cornerRadius(15)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                    .onAppear {
                        mapPosition = .region(
                            MKCoordinateRegion(
                                center: CLLocationCoordinate2D(latitude: kimchiLocation.latitude, longitude: kimchiLocation.longitude),
                                span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
                            )
                        )
                    }

                    // MARK: - Location Information
                    VStack(alignment: .leading, spacing: 8) {
                        // English name on top
                        Text(kimchiLocation.translateName)
                            .font(.title2.bold())
                            .foregroundStyle(colorScheme == .dark ? .white : .black)

                        // Korean name below
                        Text(kimchiLocation.name)
                            .font(.headline)
                            .foregroundStyle(.secondary)

                        HStack(alignment: .top, spacing: 4) {
                            Image(systemName: "mappin.and.ellipse")
                                .foregroundColor(.blue)
                            Text(kimchiLocation.address)
                                .multilineTextAlignment(.leading)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                        }

                        Text("Coordinates: \(kimchiLocation.latitude), \(kimchiLocation.longitude)")
                            .font(.caption)
                            .foregroundStyle(.gray)

                        // MARK: - Pairs Well With
                        if !kimchiLocation.kimchiType.isEmpty {
                            HStack(alignment: .center, spacing: 4) {
                                Text("Pairs well with: \(kimchiLocation.kimchiType)")
                                    .font(.subheadline)
                                    .foregroundStyle(.primary)
                            }
                            .padding(.top, 8)
                        }
                    }
                    .padding(.horizontal)

                    // MARK: - Open in Apple Maps Button
                    Button(action: {
                        openInAppleMaps(location: kimchiLocation)
                    }) {
                        HStack {
                            Image(systemName: "map")
                            Text("Open with Apple Maps")
                                .fontWeight(.bold)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .shadow(radius: 3)
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)

                }
                .padding(.vertical)
            } else {
                // Handle case where no location matches
                VStack(spacing: 16) {
                    Text("Location Not Found")
                        .font(.title3.bold())
                        .padding(.top, 8)
                }
                .padding()
            }
        }
        .navigationTitle("Location")
        .navigationBarTitleDisplayMode(.inline)
        .fontDesign(.rounded)
    }
}

private func openInAppleMaps(location: KimchiLocationData) {
    let coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    let placemark = MKPlacemark(coordinate: coordinate)
    let mapItem = MKMapItem(placemark: placemark)
    mapItem.name = location.name
    mapItem.openInMaps(launchOptions: nil)
}

#Preview {
    LocationView(placeName: "마포 양지설렁탕")
}
