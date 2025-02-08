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
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some Scene {
        WindowGroup {
            KimchiTabView()
                .environmentObject(KimchiUserData())
                .environmentObject(ImageData())
            
               
        }
    }
}
