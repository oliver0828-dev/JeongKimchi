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
    @State private var kimchiRelatedData: [KimchiRelatedFoodsData] = KimchiRelatedFoodsList.kimchiRelatedFoods
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    // Dynamically Filtered Data
    private var filteredIngredients: [KimchiIngredientsData] {
        kimchiIngredientsData.filter { searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    private var filteredLocations: [KimchiLocationData] {
        kimchiLocationData.filter { searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText) || $0.kimchiType.localizedCaseInsensitiveContains(searchText) }
    }
    
    private var filteredRelatedFoods: [KimchiRelatedFoodsData] {
        kimchiRelatedData.filter { searchText.isEmpty || $0.foodName.localizedCaseInsensitiveContains(searchText) || $0.kimchiName.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if filteredIngredients.isEmpty && filteredLocations.isEmpty && filteredRelatedFoods.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)

                        Text("No results found")
                            .font(.title3)
                            .bold()

                        Text("Try searching for different Kimchi, Places, or Related Foods.")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                    }
                    .padding()
                } else {
                    List {
                        if !filteredIngredients.isEmpty {
                            Section(header: sectionHeader(title: "Foods", systemImage: "fork.knife")) {
                                ForEach(filteredIngredients, id: \.id) { kimchi in
                                    NavigationLink {
                                        KimchiView(
                                            kimchiName: kimchi.name,
                                            spiceLevel: kimchi.spiceLevel,
                                            isFavorite: .constant(kimchi.isFavorite)
                                        )
                                    } label: {
                                        ListStackView(
                                            name: kimchi.name,
                                            isKimchi: true,
                                            spiceLevel: kimchi.spiceLevel,
                                            searchText: searchText
                                        )
                                    }
                                }
                            }
                        }
                        
                        if !filteredRelatedFoods.isEmpty {
                            Section(header: sectionHeader(title: "Related Foods", systemImage: "takeoutbag.and.cup.and.straw")) {
                                ForEach(filteredRelatedFoods, id: \.id) { relatedFood in
                                    NavigationLink {
                                        KimchiRelatedView(kimchiName: relatedFood.kimchiName, tag: relatedFood.tag)
                                    } label: {
                                        ListStackView(
                                            name: relatedFood.foodName,
                                            isKimchi: false,
                                            kimchiName: relatedFood.kimchiName,
                                            searchText: searchText
                                        )
                                    }
                                }
                            }
                        }
                        
                        if !filteredLocations.isEmpty {
                            Section(header: sectionHeader(title: "Places", systemImage: "mappin.and.ellipse")) {
                                ForEach(filteredLocations, id: \.id) { location in
                                    NavigationLink {
                                        LocationView(placeName: location.name)
                                    } label: {
                                        ListStackView(
                                            name: location.translateName,
                                            isLocation: true,
                                            placeName: location.address,
                                            kimchiName: location.kimchiType,
                                            searchText: searchText
                                        )
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                }
            }
            .navigationTitle("Search")
            .searchable(text: $searchText, prompt: "Search for Kimchi, Places, or Related Foods")
            .fontDesign(.rounded) // Corrected usage
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

// MARK: - ListStackView (Reusable Cell View)
struct ListStackView: View {
    let name: String
    var isLocation: Bool = false
    var placeName: String = ""
    var isKimchi: Bool = false
    var spiceLevel: Int = 0
    var kimchiName: String = ""
    var searchText: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            highlightedText(name, matching: searchText)
                .font(.title3.bold())
            
            if isKimchi {
                // Spice Level as Flames
                HStack(spacing: 2) {
                    ForEach(0..<spiceLevel, id: \.self) { _ in
                        Image(systemName: "flame.fill")
                            .foregroundColor(.red)
                    }
                }
                .font(.subheadline)
            }
            
            if isLocation {
                Text(placeName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("#" + kimchiName)
                    .foregroundStyle(.blue)
                    .font(.caption)
            }
            
            if !isKimchi && !isLocation {
                Text("Pairs well with: \(kimchiName)")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
        }
        .padding(.vertical, 8)
    }
    
    // Highlighting matched search terms
    private func highlightedText(_ text: String, matching searchText: String) -> Text {
        guard !searchText.isEmpty else { return Text(text) }
        let parts = text.components(separatedBy: searchText)
        var highlighted = Text("")
        for (index, part) in parts.enumerated() {
            highlighted = highlighted + Text(part)
            if index != parts.count - 1 {
                highlighted = highlighted + Text(searchText).bold().foregroundColor(.blue)
            }
        }
        return highlighted
    }
}

#Preview {
    SearchView()
}
