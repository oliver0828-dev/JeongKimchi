//  IngredientsView.swift
//  Kimchi
//
//  Created by Oliver Park on 12/18/24.
//

import SwiftUI

struct IngredientsView: View {
    @State var kimchiName: String
    @State private var KimchiIngredientsList: [KimchiIngredientsData] = KimchiIngredientsLists.kimchis
    @State private var checked = UserDefaults.standard.bool(forKey: "checked")
    var body: some View {
        
        ForEach(KimchiIngredientsList.enumerated().map { $0 }, id: \.offset) { index,  kimchi in
            let KimchiIngredients = kimchi
            if (KimchiIngredients.name == kimchiName) {
                VStack (alignment : .leading) {
                    HStack {
                        VStack (alignment: .leading) {
                            Text("Ingredients")
                                .font(.title3)
                                .fontWeight(.semibold)
                            HStack {
                                VStack (alignment: .leading) {
                                    ingredientsListStack(ingredient: "medium napa cabbage", ingredientInt: KimchiIngredients.cabbage)
                                    ingredientsListStack(ingredient: "cucumber", ingredientInt: KimchiIngredients.cucumber)
                                    ingredientsListStack(ingredient: "cup of coarse sea salt", ingredientInt: KimchiIngredients.seaSalt)
                                    ingredientsListStack(ingredient: "cup of Korean chili powder (Gochugaru)", ingredientInt: KimchiIngredients.chiliPowder)
                                    ingredientsListStack(ingredient: "tsp ginger, minced", ingredientInt: KimchiIngredients.ginger)
                                    ingredientsListStack(ingredient: "tbsp fish sauce", ingredientInt: KimchiIngredients.fishSauce)
                                    ingredientsListStack(ingredient: "green onions", ingredientInt: KimchiIngredients.greenOnions)
                                    ingredientsListStack(ingredient: "sugar", ingredientInt: KimchiIngredients.sugar)
                                    ingredientsListStack(ingredient: "small Korean radish, julienned", ingredientInt: KimchiIngredients.radish)
                                    ingredientsListStack(ingredient: "pear or apple, sliced", ingredientInt: KimchiIngredients.fruits)
                                    ingredientsListStack(ingredient: "tbsp nuts", ingredientInt: KimchiIngredients.nuts)
                                    ingredientsListStack(ingredient: "cup salted seafood (anchovy sauce, fermented shrimp)", ingredientInt: KimchiIngredients.seafood)
                                    
                                }
                                .fontWeight(.semibold)
                                
                                Spacer()
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.gray.opacity(0.3))
                            .clipShape(.rect(cornerRadius: 15))
                        }
                        Spacer()
                        
                    }
                    
                    // Checklist for the ingredients
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Check List")
                                .font(.title3)
                                .fontWeight(.semibold)
                            HStack {
                                VStack (alignment: .leading) {
                                    ingredientsCheckStack(ingredientInt: KimchiIngredients.cabbage, ingredient: "Cabbage")
                                    ingredientsCheckStack(ingredientInt: KimchiIngredients.cucumber, ingredient: "Cucumber")
                                    ingredientsCheckStack(ingredientInt: KimchiIngredients.seaSalt, ingredient: "Sea Salt")
                                    ingredientsCheckStack(ingredientInt: KimchiIngredients.chiliPowder, ingredient: "Chili Powder")
                                    ingredientsCheckStack(ingredientInt: KimchiIngredients.ginger, ingredient: "Ginger")
                                    ingredientsCheckStack(ingredientInt: KimchiIngredients.fishSauce, ingredient: "Fish Sauce")
                                    ingredientsCheckStack(ingredientInt: KimchiIngredients.greenOnions, ingredient: "Green Onions")
                                    ingredientsCheckStack(ingredientInt: KimchiIngredients.sugar, ingredient: "Sugar")
                                    ingredientsCheckStack(ingredientInt: KimchiIngredients.radish, ingredient: "Radish")
                                    ingredientsCheckStack(ingredientInt: KimchiIngredients.fruits, ingredient: "Fruits")
                                    ingredientsCheckStack(ingredientInt: KimchiIngredients.nuts, ingredient: "Nuts")
                                    ingredientsCheckStack(ingredientInt: KimchiIngredients.seafood, ingredient: "Seafood")
                                    
                                    
                                    
                                }
                                
                                Spacer()
                            }
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(.gray.opacity(0.3))
                            .clipShape(.rect(cornerRadius: 15))
                        }
                        Spacer()
                    }
                    
                }
                .fontDesign(.rounded)
            }
        }
        
        
        Spacer()
        
    }
}

#Preview {
    IngredientsView(kimchiName: "Cabbage Kimchi")
}

struct ingredientsCheckStack: View {
    @State var ingredientInt: Double
    @State var ingredient: String
    @State var checked: Bool = false
    @Environment(\.colorScheme)  var colorScheme
    var body: some View {
        
        if ingredientInt > 0.0 {
            HStack {
                Button {
                    checked.toggle()
                } label: {
                    HStack {
                        if checked {
                            Image(systemName: "checkmark.square.fill")
                                .resizable()
                                .frame(width: 20, height: 20 )
                            
                        } else {
                            Image(systemName: "checkmark.square")
                                .resizable()
                                .frame(width: 20, height: 20 )
                        }
                        
                        Text(ingredient)
                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                            .opacity(checked ? 0.5 : 1.0)
                            .strikethrough(checked)
                    }
                }
                
               
            }
        }
    }
}


struct ingredientsListStack: View {
    @State var ingredient: String
    @State var ingredientInt: Double
    var body: some View {
        if (ingredientInt > 0) {
            HStack {
                Text(fractionToString(fraction: ingredientInt))
                    .foregroundStyle(.red)
                Text(" " + ingredient)
            }
        }
    }
    func fractionToString (fraction: Double) -> String {
        switch fraction {
        case 0.125..<0.126:
            return NSLocalizedString("\u{215B}", comment: "1/8")
        case 0.25..<0.26:
            return NSLocalizedString("\u{00BC}", comment: "1/4")
        case 0.33..<0.34:
            return NSLocalizedString("\u{2153}", comment: "1/3")
        case 0.5..<0.6:
            return NSLocalizedString("\u{00BD}", comment: "1/2")
        case 0.66..<0.67:
            return NSLocalizedString("\u{2154}", comment: "2/3")
        case 0.75..<0.76:
            return NSLocalizedString("\u{00BE}", comment: "3/4")
        default:
            return "\(Int(fraction))"
        }
    }
}


