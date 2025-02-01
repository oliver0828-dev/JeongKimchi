//
//  CookingView.swift
//  Kimchi
//
//  Created by Oliver Park on 1/1/25.
//

import SwiftUI

struct CookingView: View {
    @State private var kimchiIngredientsList: [KimchiIngredientsData] = KimchiIngredientsLists.kimchis
    @State private var selectedKimchi: KimchiIngredientsData?
    let kimchi: KimchiIngredientsData
    var cookingSteps: [CookingStepData] {
        KimchiCookingGuide.prepareKimchiSteps(for: kimchi)
    }
    
    @State var kimchiName: String
    @State var currentStep: Int = 1
    
    @State private var clicked = false
    @State private var checked = false
    @State private var showIngredients = false
    
    @Environment(\.dismiss) var dismiss
    
    @State private var counter = 0
    
    let ingredientsStep = ["Ingredients", "Current Step"]
    @State private var ingredientStepString = "Ingredients"
    
    var body: some View {
        VStack {
            CircleIndicatorView(currentStep: $currentStep, totalSteps: cookingSteps.count)
                .padding()
            
            TabView(selection: $currentStep) {
                ForEach(cookingSteps, id: \.stepNumber) { step in
                    VStack {
                        HStack {
                            Text(step.description)
                                .font(.title3)
                                .foregroundColor(.secondary)
                            Spacer()
                        }
                        .padding()
                        Spacer()
                    }
                    .tag(step.stepNumber)
                    
                    
                    Spacer()
                }
                
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentStep)
            
            HStack {
                Button(action: {
                    if currentStep > 1 {
                        currentStep -= 1
                    }
                    
                    counter += 1
                }) {
                    Image(systemName: "arrow.backward")
                        .padding()
                        .foregroundStyle(.white)
                        .background(currentStep > 1 ? Color.blue : Color.gray)
                        .cornerRadius(8)
                }
                .disabled(currentStep <= 1)
                .sensoryFeedback(.impact(flexibility: .solid, intensity: 0.5), trigger: counter)
                
                Spacer()
      
                Button(action: {
                    if currentStep < cookingSteps.count {
                        currentStep += 1
                    } else {
                        dismiss()
                    }
                    counter += 1
                }) {
                    Image(systemName: currentStep == cookingSteps.count ? "checkmark" : "arrow.forward")
                        .padding()
                        .foregroundStyle(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                    
                }
                .sensoryFeedback(.impact(flexibility: .solid, intensity: 0.5), trigger: counter)
            }
            .padding()
            
           
              

              
        }
        
        .multilineTextAlignment(.leading)
        .fontDesign(.rounded)
        .navigationTitle("\(kimchiName) Cooking Guide")
        .toolbar {
            Button {
                showIngredients.toggle()
            } label: {
                Image(systemName: showIngredients ? "list.bullet.circle.fill" : "list.bullet.circle")
            }
        } .sheet(isPresented: $showIngredients) {
            IngredientsCheckSheetView(kimchiName: kimchiName)
        }
    }
}

struct CircleIndicatorView: View {
    @Binding var currentStep: Int
    var totalSteps: Int
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 5)
                .opacity(0.3)
                .foregroundColor(Color.blue)
                .frame(width: 80, height: 80)
            
            Circle()
                .trim(from: 0.0, to: CGFloat(currentStep) / CGFloat(totalSteps))
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .foregroundColor(Color.blue)
                .rotationEffect(Angle(degrees: -90))
                .frame(width: 80, height: 80)
            
            Text("\(currentStep)")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(Color.blue)
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var kimchiIngredientslist: [KimchiIngredientsData] = KimchiIngredientsLists.kimchis
        @State private var kimchiName = "Cabbage Kimchi"
        var body: some View {
            NavigationStack {
                ForEach(kimchiIngredientslist.indices, id: \.self) { index in
                    if(kimchiName == kimchiIngredientslist[index].name) {
                        CookingView(kimchi: kimchiIngredientslist[index], kimchiName: kimchiIngredientslist[index].name)
                    }
                }
            }
        }
    }
    
    return PreviewWrapper()
}


struct IngredientsCheckView: View {
    @State var kimchiName: String
    @State private var KimchiIngredientsList: [KimchiIngredientsData] = KimchiIngredientsLists.kimchis
    @State private var checkedItems: [String: Bool] = UserDefaults.standard.dictionary(forKey: "checkedItems") as? [String: Bool] ?? [:]
    
    var body: some View {
        ForEach(KimchiIngredientsList.enumerated().map { $0 }, id: \ .offset) { index, kimchi in
            let KimchiIngredients = kimchi
            if KimchiIngredients.name == kimchiName {
                VStack(alignment: .leading) {
                    Text("Check List")
                        .font(.headline)
                    
                    VStack(alignment: .leading) {
                        IngredientsCheckStack(ingredientInt: KimchiIngredients.cabbage, ingredient: "medium napa cabbage", checkedItems: $checkedItems)
                        IngredientsCheckStack(ingredientInt: KimchiIngredients.cucumber, ingredient: "cucumber", checkedItems: $checkedItems)
                        IngredientsCheckStack(ingredientInt: KimchiIngredients.seaSalt, ingredient: "cup of coarse sea salt", checkedItems: $checkedItems)
                        IngredientsCheckStack(ingredientInt: KimchiIngredients.chiliPowder, ingredient: "cup of Korean chili powder (Gochugaru)", checkedItems: $checkedItems)
                        IngredientsCheckStack(ingredientInt: KimchiIngredients.ginger, ingredient: "tsp ginger, minced", checkedItems: $checkedItems)
                        IngredientsCheckStack(ingredientInt: KimchiIngredients.fishSauce, ingredient: "tbsp fish sauce", checkedItems: $checkedItems)
                        IngredientsCheckStack(ingredientInt: KimchiIngredients.greenOnions, ingredient: "green onions", checkedItems: $checkedItems)
                        IngredientsCheckStack(ingredientInt: KimchiIngredients.sugar, ingredient: "sugar", checkedItems: $checkedItems)
                        IngredientsCheckStack(ingredientInt: KimchiIngredients.radish, ingredient: "small Korean radish, julienned", checkedItems: $checkedItems)
                        IngredientsCheckStack(ingredientInt: KimchiIngredients.fruits, ingredient: "pear or apple, sliced", checkedItems: $checkedItems)
                        IngredientsCheckStack(ingredientInt: KimchiIngredients.nuts, ingredient: "tbsp nuts", checkedItems: $checkedItems)
                        IngredientsCheckStack(ingredientInt: KimchiIngredients.seafood, ingredient: "cup salted seafood (anchovy sauce, fermented shrimp)", checkedItems: $checkedItems)
                    }
                    .padding()
                }
                .fontDesign(.rounded)
            }
        }
        Spacer()
    }
}

struct IngredientsCheckStack: View {
    @State var ingredientInt: Double
    @State var ingredient: String
    @Binding var checkedItems: [String: Bool]
    
    var body: some View {
        if ingredientInt > 0.0 {
            HStack {
                Button {
                    checkedItems[ingredient] = !(checkedItems[ingredient] ?? false)
                    UserDefaults.standard.set(checkedItems, forKey: "checkedItems")
                } label: {
                    Image(systemName: (checkedItems[ingredient] ?? false) ? "checkmark.square.fill" : "checkmark.square")
                }
                
                Text(ingredient)
                    .foregroundStyle((checkedItems[ingredient] ?? false) ? .secondary : .primary)
                    .strikethrough(checkedItems[ingredient] ?? false)
            }
        }
    }
}

struct IngredientsCheckSheetView: View {
    @State var kimchiName: String
    @State private var KimchiIngredientsList: [KimchiIngredientsData] = KimchiIngredientsLists.kimchis
    @State private var checkedItems: [String: Bool] = UserDefaults.standard.dictionary(forKey: "checkedItems") as? [String: Bool] ?? [:]
    
    var body: some View {
        VStack {
            Text("Check List")
                .font(.headline)
                .padding()
            
            ScrollView {
                ForEach(KimchiIngredientsList.enumerated().map { $0 }, id: \.offset) { index, kimchi in
                    let KimchiIngredients = kimchi
                    if KimchiIngredients.name == kimchiName {
                        VStack(alignment: .leading) {
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.cabbage, ingredient: "medium napa cabbage", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.cucumber, ingredient: "cucumber", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.seaSalt, ingredient: "cup of coarse sea salt", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.chiliPowder, ingredient: "cup of Korean chili powder (Gochugaru)", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.ginger, ingredient: "tsp ginger, minced", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.fishSauce, ingredient: "tbsp fish sauce", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.greenOnions, ingredient: "green onions", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.sugar, ingredient: "sugar", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.radish, ingredient: "small Korean radish, julienned", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.fruits, ingredient: "pear or apple, sliced", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.nuts, ingredient: "tbsp nuts", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.seafood, ingredient: "cup salted seafood (anchovy sauce, fermented shrimp)", checkedItems: $checkedItems)
                        }
                        .padding()
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 10)

        }
        .padding()
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
    }
}

