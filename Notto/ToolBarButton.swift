//
//  ToolBarButton.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 18/10/2024.
//

import SwiftUI

struct ToolBarButton: View {
    @State private var carSelected = "Mazda MX-5 III"
    let cars = ["Mazda MX-5 III", "audi", "bmw"]
    var body: some View {
        // Кнопки на зображенні
        Picker("Select a car", selection: $carSelected) {
                                    ForEach(cars, id: \.self) {
                                        Text($0)
                                    }
                                }
        .pickerStyle(.menu) // Використовуйте стиль меню
                                
                                .padding(.horizontal)
    }
}

#Preview {
    ToolBarButton()
}
