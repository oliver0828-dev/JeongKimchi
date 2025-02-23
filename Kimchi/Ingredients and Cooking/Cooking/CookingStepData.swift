import SwiftUI
import Foundation

struct CookingStepData: Identifiable {
    let id = UUID()
    let stepNumber: Int
    let description: String
    let kimchiName: String
    var ingredientsName: String = " "
}

struct KimchiCookingGuide {
    static func fractionToString(fraction: Double) -> String {
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

    static func prepareKimchiSteps(for kimchi: KimchiIngredientsData) -> [CookingStepData] {
        var steps: [CookingStepData] = []
        var stepNumber = 1

        // Step 1: Prepare the main ingredients
        if kimchi.cabbage > 0 {
            steps.append(CookingStepData(stepNumber: stepNumber, description: "Cut the cabbage into quarters and rinse thoroughly.", kimchiName: kimchi.name, ingredientsName: "Cabbage"))
            stepNumber += 1
            steps.append(CookingStepData(stepNumber: stepNumber, description: "Sprinkle the cabbage with \(fractionToString(fraction: kimchi.seaSalt)) cups of sea salt. Let it sit for 1-2 hours, turning occasionally.", kimchiName: kimchi.name, ingredientsName: "Sea Salt"))
            stepNumber += 1
        }
        if kimchi.radish > 0 {
            steps.append(CookingStepData(stepNumber: stepNumber, description: "Peel the radish and cut it into cubes or slices, depending on the type.", kimchiName: kimchi.name, ingredientsName: "Radish"))
            stepNumber += 1
        }
        if kimchi.cucumber > 0 {
            steps.append(CookingStepData(stepNumber: stepNumber, description: "Slice or score the cucumber and prepare for stuffing, if necessary.", kimchiName: kimchi.name, ingredientsName: "Cucumber"))
            stepNumber += 1
        }
        if kimchi.greenOnions > 0 {
            steps.append(CookingStepData(stepNumber: stepNumber, description: "Wash and cut green onions into manageable lengths.", kimchiName: kimchi.name, ingredientsName: "Green Onions"))
            stepNumber += 1
        }

        // Step 2: Prepare the seasoning
        steps.append(CookingStepData(stepNumber: stepNumber, description: "In a mixing bowl, combine the following ingredients:", kimchiName: kimchi.name))
        stepNumber += 1

        if kimchi.chiliPowder > 0 {
            steps.append(CookingStepData(stepNumber: stepNumber, description: "\(fractionToString(fraction: kimchi.chiliPowder)) cups of chili powder", kimchiName: kimchi.name, ingredientsName: "Chili Powder"))
            stepNumber += 1
        }
        if kimchi.garlic > 0 {
            steps.append(CookingStepData(stepNumber: stepNumber, description: "\(fractionToString(fraction:kimchi.garlic)) cloves of minced garlic", kimchiName: kimchi.name, ingredientsName: "Garlic"))
            stepNumber += 1
        }
        if kimchi.ginger > 0 {
            steps.append(CookingStepData(stepNumber: stepNumber, description: "\(fractionToString(fraction: kimchi.ginger)) inches of grated ginger", kimchiName: kimchi.name, ingredientsName: "Ginger"))
            stepNumber += 1
        }
        if kimchi.fishSauce > 0 {
            steps.append(CookingStepData(stepNumber: stepNumber, description: "\(fractionToString(fraction: kimchi.fishSauce)) tablespoons of fish sauce", kimchiName: kimchi.name, ingredientsName: "Fish Sauce"))
            stepNumber += 1
        }
        if kimchi.sugar > 0 {
            steps.append(CookingStepData(stepNumber: stepNumber, description: "\(fractionToString(fraction: kimchi.sugar)) tablespoons of sugar", kimchiName: kimchi.name, ingredientsName: "Sugar"))
            stepNumber += 1
        }
        if kimchi.fruits > 0 {
            steps.append(CookingStepData(stepNumber: stepNumber, description: "Optional: Add \(fractionToString(fraction: kimchi.fruits)) cups of fruits like apple or pear for natural sweetness.", kimchiName: kimchi.name, ingredientsName: "Fruits"))
            stepNumber += 1
        }
        if kimchi.nuts > 0 {
            steps.append(CookingStepData(stepNumber: stepNumber, description: "Optional: Add \(fractionToString(fraction: kimchi.nuts)) cups of chopped nuts for texture.", kimchiName: kimchi.name, ingredientsName: "Nuts"))
            stepNumber += 1
        }
        if kimchi.seafood > 0 {
            steps.append(CookingStepData(stepNumber: stepNumber, description: "Optional: Add \(fractionToString(fraction: kimchi.seafood)) cups of seafood (e.g., shrimp or oysters).", kimchiName: kimchi.name, ingredientsName: "Sea Food"))
            stepNumber += 1
        }

        // Step 3: Combine and pack
        steps.append(CookingStepData(stepNumber: stepNumber, description: "Massage the seasoning mixture into the prepared vegetables until evenly coated.", kimchiName: kimchi.name))
        stepNumber += 1

        // Add type-specific steps
        if kimchi.type == "Cabbage-Based" {
            steps.append(CookingStepData(stepNumber: stepNumber, description: "Pack the cabbage tightly into an airtight container or jar.", kimchiName: kimchi.name))
        } else if kimchi.type == "Radish-Based" {
            steps.append(CookingStepData(stepNumber: stepNumber, description: "Mix the radish or other base thoroughly with the seasoning.", kimchiName: kimchi.name))
        } else if kimchi.type == "Special" {
            steps.append(CookingStepData(stepNumber: stepNumber, description: "Stuff the cucumbers or green onions with the prepared seasoning.", kimchiName: kimchi.name))
        } else if kimchi.type == "Regional" {
            steps.append(CookingStepData(stepNumber: stepNumber, description: "Layer the stuffed ingredients carefully, ensuring even seasoning distribution.", kimchiName: kimchi.name))
        }
        stepNumber += 1

        // Step 4: Fermentation or resting
        steps.append(CookingStepData(stepNumber: stepNumber, description: "Leave the kimchi at room temperature for \(fractionToString(fraction: Double(kimchi.additionalTime) / 60.0)) hour(s).", kimchiName: kimchi.name))
        stepNumber += 1
        steps.append(CookingStepData(stepNumber: stepNumber, description: "Transfer to the refrigerator for long-term storage, ensuring the flavors meld over time.", kimchiName: kimchi.name))
        stepNumber += 1

        // Serving note
        steps.append(CookingStepData(stepNumber: stepNumber, description: "Serve cold or at room temperature as a side dish. Enjoy!", kimchiName: kimchi.name))
        return steps
    }
}
