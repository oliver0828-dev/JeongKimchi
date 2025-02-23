//
//  KimchiApp.swift
//  Kimchi
//
//  Created by Oliver Park on 12/9/24.
//

import SwiftUI
import SwiftData

@main
struct KimchiApp: App {
    @StateObject private var kimchiUser = KimchiUserData() // Correct initialization

    var body: some Scene {
        WindowGroup {
            KimchiTabView()
                .fontDesign(.rounded)
                .environmentObject(kimchiUser) // Injected globally
        }
    }
}
