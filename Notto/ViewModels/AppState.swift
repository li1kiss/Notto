//
//  AppState.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 28/12/2024.
//

import SwiftUI
import Combine

class AppState: ObservableObject {
    @Published var selectedTab: Int = 0
    @Published var showSettings: Bool = false
}

