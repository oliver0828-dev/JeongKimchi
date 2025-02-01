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
    @State private var mapRegion: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 37.5665, longitude: 126.9780), // Default to Seoul
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @State var placeName: String
    
    @Environment(\.colorScheme) private var colorScheme
    
    var filteredLocations: [KimchiLocationData] {
        kimchiLocationList.filter { $0.name == placeName }
    }
    
    var body: some View {
        NavigationStack {
            
            
            ForEach(filteredLocations, id: \.id) { kimchiLocation in
                VStack(alignment: .leading, spacing: 10) {
                    Text(kimchiLocation.name)
                        .font(.title3.bold())
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                    Text(kimchiLocation.translateName)
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                    Text(kimchiLocation.address)
                        .multilineTextAlignment(.leading)
                        .font(.caption)
                        .foregroundStyle(.gray)
                    Text("Coordinates: \(kimchiLocation.latitude), \(kimchiLocation.longitude)")
                        .font(.caption)
                        .foregroundStyle(.gray)
                    
                    Button(action: {
                        openInAppleMaps(location: kimchiLocation)
                    }) {
                        HStack {
                            Image(systemName: "map")
                            Text("Open with Apple Maps")
                        }
                        .font(.body.bold())
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.top)
                }
                .padding()
            }
        }
    }
}

// Function to Open Location in Apple Maps
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
