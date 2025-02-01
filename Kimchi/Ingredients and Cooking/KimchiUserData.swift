//
//  KimchiUserData.swift
//  Kimchi
//
//  Created by Oliver Park on 12/31/24.
//

import Foundation
import SwiftUI

class KimchiUserData: ObservableObject {
    @AppStorage("isFavorite") var isFavorite: Bool = false
}

