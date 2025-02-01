//
//  SearchView.swift
//  Kimchi
//
//  Created by Oliver Park on 1/1/25.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @State private var kimchiIngredientsData: [KimchiIngredientsData] = KimchiIngredientsLists.kimchis
    @State private var kimchiLocationData: [KimchiLocationData] = KimchiLocationList.kimchiLocations
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    // Dynamically Filtered Data
    private var filteredIngredients: [KimchiIngredientsData] {
        kimchiIngredientsData.filter { searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    private var filteredLocations: [KimchiLocationData] {
        kimchiLocationData.filter { searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText) || $0.kimchiType.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            List {
                // Kimchi Foods Section
                if !filteredIngredients.isEmpty {
                    Section(header: sectionHeader(title: "Foods", systemImage: "fork.knife")) {
                        ForEach(filteredIngredients.indices, id: \.self) { index in
                            let kimchi = filteredIngredients[index]
                            NavigationLink {
                                KimchiView(
                                    kimchiName: kimchi.name,
                                    spiceLevel: kimchi.spiceLevel,
                                    isFavorite: $kimchiIngredientsData[index].isFavorite
                                )
                            } label: {
                                ListStackView(
                                    name: kimchi.name,
                                    isKimchi: true,
                                    spiceLevel: kimchi.spiceLevel
                                )
                            }
                        }
                    }
                }
                
                // Kimchi Locations Section
                if !filteredLocations.isEmpty {
                    Section(header: sectionHeader(title: "Places", systemImage: "mappin.and.ellipse")) {
                        ForEach(filteredLocations.indices, id: \.self) { index in
                            let location = filteredLocations[index]
                            NavigationLink {
                                LocationView(placeName: location.name)
                            } label: {
                                ListStackView(
                                    name: location.name,
                                    isLocation: true,
                                    placeName: location.address,
                                    isKimchi: false,
                                    kimchiName: location.kimchiType
                                )
                            }
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .frame(maxWidth: horizontalSizeClass == .compact ? .infinity : 700)
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search for Kimchi or Places") // Added a user-friendly search prompt
        }
    }
    
    private func sectionHeader(title: String, systemImage: String) -> some View {
        HStack {
            Image(systemName: systemImage)
            Text(title)
        }
        .font(.headline)
        .fontWeight(.semibold)
    }
}

struct ListStackView: View {
    let name: String
    var isLocation: Bool = false
    var placeName: String = ""
    var isKimchi: Bool = false
    var spiceLevel: Int = 0
    var kimchiName: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.title2.bold())
            
            if isKimchi {
                Text("Spice Level: \(spiceLevel)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            if isLocation {
                Text(placeName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("#" + kimchiName)
                    .foregroundStyle(.blue)
                    .font(.caption)
            }
        }
    }
}

#Preview {
    SearchView()
}
