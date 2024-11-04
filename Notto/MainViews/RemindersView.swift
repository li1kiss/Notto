//
//  RemindersView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 04/11/2024.
//

import SwiftUI

struct RemindersView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Майбутні нагадування")
                .font(.headline)
            HStack {
                VStack(alignment: .leading) {
                    Text("Сервіс • 20 Жовт 2024")
                        .font(.subheadline)
                    Text("Lorem ipsum dolor sit amet consectetur.")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                }
                Spacer()
                HStack {
                    Button("Перенести") {
                        // Дія для перенесення
                    }
                    .font(.footnote)
                    
                    Button("Готово") {
                        // Дія для завершення
                    }
                    .font(.footnote)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

#Preview {
    RemindersView()
}
