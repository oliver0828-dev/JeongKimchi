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
    @Environment(\.colorScheme) var colorScheme
    
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
                                .foregroundStyle(colorScheme == .dark ? .white : .black)
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
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if ingredientInt > 0.0 {
            HStack {
                Button {
                    checkedItems[ingredient] = !(checkedItems[ingredient] ?? false)
                } label: {
                    HStack{
                        Image(systemName: (checkedItems[ingredient] ?? false) ? "checkmark.square.fill" : "checkmark.square")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                        
                        Text(ingredient)
                            .font(.title3)
                            .foregroundStyle(colorScheme == .dark ? .white : .black)
                            .opacity(checkedItems[ingredient] ?? false ? 0.5 : 1.0)
                            .strikethrough(checkedItems[ingredient] ?? false)
                    }
                }
                
                
            }
        }
    }
}


struct IngredientsCheckSheetView: View {
    @State var kimchiName: String
    @State private var KimchiIngredientsList: [KimchiIngredientsData] = KimchiIngredientsLists.kimchis
    @State private var checkedItems: [String: Bool] = [:]

    var body: some View {
        VStack {
            Text("\(kimchiName) - Check List")
                .font(.headline)
                .padding()
            
            ScrollView {
                ForEach(KimchiIngredientsList.enumerated().map { $0 }, id: \.offset) { index, kimchi in
                    let KimchiIngredients = kimchi
                    if KimchiIngredients.name == kimchiName {
                        VStack(alignment: .leading) {
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.cabbage, ingredient: "Napa Cabbage", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.cucumber, ingredient: "Cucumber", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.seaSalt, ingredient: "Sea salt", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.chiliPowder, ingredient: "Korean chili powder (Gochugaru)", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.ginger, ingredient: "Ginger", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.fishSauce, ingredient: "Fish sauce", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.greenOnions, ingredient: "Green onions", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.sugar, ingredient: "Sugar", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.radish, ingredient: "Korean radish", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.fruits, ingredient: "Fruits (Apple / Pear)", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.nuts, ingredient: "Nuts", checkedItems: $checkedItems)
                            IngredientsCheckStack(ingredientInt: KimchiIngredients.seafood, ingredient: "Salted seafood (anchovy sauce, fermented shrimp)", checkedItems: $checkedItems)
                        }
                        .padding()
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 10)
        }
        .padding()
        .onAppear {
            loadCheckedItems()
        }
        .onDisappear {
            saveCheckedItems()
        }
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
    }
    
    // Load saved checked items for this specific recipe
    private func loadCheckedItems() {
        if let savedItems = UserDefaults.standard.dictionary(forKey: "checkedItems_\(kimchiName)") as? [String: Bool] {
            checkedItems = savedItems
        }
    }
    
    // Save the checked items for this specific recipe
    private func saveCheckedItems() {
        UserDefaults.standard.set(checkedItems, forKey: "checkedItems_\(kimchiName)")
    }
}
