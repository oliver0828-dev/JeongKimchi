//
//  Kimchi Ingredients Struct.swift
//  Kimchi
//
//  Created by Oliver Park on 12/18/24.
//

import SwiftUI
import Foundation


struct KimchiIngredientsData: Identifiable {
    let id = UUID()
    var name: String
    var koreanName: String
    var kimchiDescription: String
    var spiceLevel: Int
    var type: String

    var cabbage: Double
    var seaSalt: Double
    var chiliPowder: Double
    var garlic: Double
    var ginger: Double
    var fishSauce: Double
    var greenOnions: Double
    var sugar: Double
    var radish: Double
    var cucumber: Double
    var fruits: Double
    var nuts: Double
    var seafood: Double

    var peoplePerServing: Int
    var prepTime: Int    // Preparation time in minutes
    var cookTime: Int    // Cooking time in minutes
    var additionalTime: Int // Cooling/fermentation/heating time in minutes

    var totalTime: Int { // Total time calculated as sum
        return prepTime + cookTime + additionalTime
    }

    var isFavorite: Bool {
        get {
            UserDefaults.standard.bool(forKey: "\(name)_favorite")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "\(name)_favorite")
        }
    }
    
    var additionalTimeDescription: String
    
    var isHistory: Bool = false
}


struct KimchiIngredientsLists {
    static let kimchis: [KimchiIngredientsData] = [
        KimchiIngredientsData(
            name: "Cabbage Kimchi",
            koreanName: "배추김치",
            kimchiDescription: "Cabbage kimchi with spicy and flavorful seasonings.",
            spiceLevel: 5,
            type: "Cabbage-Based",
            cabbage: 1,
            seaSalt: 1/4,
            chiliPowder: 1/2,
            garlic: 5,
            ginger: 1,
            fishSauce: 2,
            greenOnions: 3,
            sugar: 1,
            radish: 0,
            cucumber: 0,
            fruits: 0,
            nuts: 0,
            seafood: 0,
            peoplePerServing: 4,
            prepTime: 15,
            cookTime: 20,
            additionalTime: 60,
            additionalTimeDescription: "Resting",
            isHistory: true
        ),
        KimchiIngredientsData(
            name: "White Kimchi",
            koreanName: "백김치",
            kimchiDescription: "White kimchi without chili powder, offering a mild flavor.",
            spiceLevel: 1,
            type: "Cabbage-Based",
            cabbage: 1,
            seaSalt: 1/4,
            chiliPowder: 0,
            garlic: 4,
            ginger: 1,
            fishSauce: 0,
            greenOnions: 0,
            sugar: 0,
            radish: 1,
            cucumber: 0,
            fruits: 1,
            nuts: 0,
            seafood: 0,
            peoplePerServing: 3,
            prepTime: 10,
            cookTime: 15,
            additionalTime: 30,
            additionalTimeDescription: "Cooling",
            isHistory: true
        ),
        KimchiIngredientsData(
            name: "Cubed Radish Kimchi",
            koreanName: "깍두기",
            kimchiDescription: "Cubed radish kimchi with a crunchy texture.",
            spiceLevel: 4,
            type: "Radish-Based",
            cabbage: 0,
            seaSalt: 2,
            chiliPowder: 1/3,
            garlic: 4,
            ginger: 1,
            fishSauce: 2,
            greenOnions: 3,
            sugar: 1,
            radish: 1,
            cucumber: 0,
            fruits: 0,
            nuts: 0,
            seafood: 0,
            peoplePerServing: 3,
            prepTime: 20,
            cookTime: 10,
            additionalTime: 30,
            additionalTimeDescription: "Resting"
        ),
        KimchiIngredientsData(
            name: "Ponytail Radish Kimchi",
            koreanName: "총각김치",
            kimchiDescription: "Spicy ponytail radish kimchi with bold seasoning.",
            spiceLevel: 5,
            type: "Radish-Based",
            cabbage: 0,
            seaSalt: 2,
            chiliPowder: 1/2,
            garlic: 5,
            ginger: 1,
            fishSauce: 2,
            greenOnions: 3,
            sugar: 0,
            radish: 1,
            cucumber: 0,
            fruits: 0,
            nuts: 0,
            seafood: 0,
            peoplePerServing: 4,
            prepTime: 20,
            cookTime: 10,
            additionalTime: 60,
            additionalTimeDescription: "Ferment",
            isHistory: true
        ),
        KimchiIngredientsData(
            name: "Watery Radish Kimchi",
            koreanName: "동치미",
            kimchiDescription: "Watery radish kimchi served as a cold soup.",
            spiceLevel: 1,
            type: "Radish-Based",
            cabbage: 0,
            seaSalt: 1/4,
            chiliPowder: 0,
            garlic: 4,
            ginger: 1,
            fishSauce: 0,
            greenOnions: 3,
            sugar: 1,
            radish: 1,
            cucumber: 0,
            fruits: 1,
            nuts: 0,
            seafood: 0,
            peoplePerServing: 4,
            prepTime: 10,
            cookTime: 10,
            additionalTime: 20,
            additionalTimeDescription: "Chilling"
        ),
        KimchiIngredientsData(
            name: "Stuffed Kimchi",
            koreanName: "보쌈김치",
            kimchiDescription: "Luxurious stuffed kimchi with nuts, fruits, and seafood.",
            spiceLevel: 4,
            type: "Regional",
            cabbage: 1,
            seaSalt: 1/4,
            chiliPowder: 1/2,
            garlic: 5,
            ginger: 1,
            fishSauce: 0,
            greenOnions: 0,
            sugar: 0,
            radish: 0,
            cucumber: 0,
            fruits: 1,
            nuts: 1,
            seafood: 1,
            peoplePerServing: 6,
            prepTime: 30,
            cookTime: 20,
            additionalTime: 120,
            additionalTimeDescription: "Cooling",
            isHistory: true
        ),
        KimchiIngredientsData(
            name: "Young Radish Kimchi",
            koreanName: "열무김치",
            kimchiDescription: "Lightly seasoned young summer radish kimchi.",
            spiceLevel: 3,
            type: "Radish-Based",
            cabbage: 0,
            seaSalt: 1/4,
            chiliPowder: 1/3,
            garlic: 4,
            ginger: 1,
            fishSauce: 0,
            greenOnions: 0,
            sugar: 0,
            radish: 1,
            cucumber: 0,
            fruits: 0,
            nuts: 0,
            seafood: 0,
            peoplePerServing: 4,
            prepTime: 15,
            cookTime: 10,
            additionalTime: 40,
            additionalTimeDescription: "Ferment"
        ),
        KimchiIngredientsData(
            name: "Cucumber Kimchi",
            koreanName: "오이소박이",
            kimchiDescription: "Stuffed cucumber kimchi for a refreshing side dish.",
            spiceLevel: 4,
            type: "Special",
            cabbage: 0,
            seaSalt: 2,
            chiliPowder: 1/3,
            garlic: 4,
            ginger: 1,
            fishSauce: 0,
            greenOnions: 3,
            sugar: 0,
            radish: 0,
            cucumber: 5,
            fruits: 0,
            nuts: 0,
            seafood: 0,
            peoplePerServing: 3,
            prepTime: 15,
            cookTime: 10,
            additionalTime: 20,
            additionalTimeDescription: "Cooling"
        ),
        KimchiIngredientsData(
            name: "Green Onion Kimchi",
            koreanName: "파김치",
            kimchiDescription: "Green onion kimchi with a sharp taste.",
            spiceLevel: 4,
            type: "Special",
            cabbage: 0,
            seaSalt: 1/4,
            chiliPowder: 1/2,
            garlic: 5,
            ginger: 1,
            fishSauce: 2,
            greenOnions: 2,
            sugar: 0,
            radish: 0,
            cucumber: 0,
            fruits: 0,
            nuts: 0,
            seafood: 0,
            peoplePerServing: 3,
            prepTime: 20,
            cookTime: 15,
            additionalTime: 30,
            additionalTimeDescription: "Melding"
        ),
        KimchiIngredientsData(
            name: "Garlic Chives Kimchi",
            koreanName: "부추김치",
            kimchiDescription: "Garlic chives kimchi, often served with barbecue.",
            spiceLevel: 4,
            type: "Special",
            cabbage: 0,
            seaSalt: 2,
            chiliPowder: 1/3,
            garlic: 4,
            ginger: 1,
            fishSauce: 2,
            greenOnions: 0,
            sugar: 0,
            radish: 0,
            cucumber: 0,
            fruits: 0,
            nuts: 0,
            seafood: 0,
            peoplePerServing: 4,
            prepTime: 15,
            cookTime: 10,
            additionalTime: 20,
            additionalTimeDescription: "Cooling"
        )
    ]
}
