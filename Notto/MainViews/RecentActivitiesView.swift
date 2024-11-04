//
//  RecentActivitiesView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 04/11/2024.
//

import SwiftUI

struct RecentActivitiesView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Останні активності")
                .font(.headline)
            
            ForEach(0..<3) { _ in
                HStack {
                    Image(systemName: "wrench")
                        .frame(width: 32, height: 32)
                        .background(Color.purple.opacity(0.2))
                        .cornerRadius(8)
                    VStack(alignment: .leading) {
                        Text("Сервіс")
                        Text("Сьогодні 15:38, 76,724 км")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    Spacer()
                    Text("-$400")
                        .font(.body)
                        .foregroundColor(.red)
                }
                .padding(.vertical, 8)
            }
            
            Button("Показати всі") {
                // Дія для перегляду всіх активностей
            }
            .font(.footnote)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

#Preview {
    RecentActivitiesView()
}
