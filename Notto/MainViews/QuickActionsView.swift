//
//  QuickActionsView .swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 04/11/2024.
//

import SwiftUI

struct QuickActionsView: View {
    var body: some View {
        HStack(spacing: 16) {
                        ActionButton(title: "Дохід", iconName: "arrow.down.circle")
                        ActionButton(title: "Оплата", iconName: "arrow.up.circle")
                        ActionButton(title: "Заправка", iconName: "fuelpump")
                        ActionButton(title: "Сервіс", iconName: "wrench")
                    }
    }
}


struct ActionButton: View {
    var title: String
    var iconName: String
    
    var body: some View {
        Button(action: {
            // Дія кнопки
        }) {
            VStack(spacing: 8) {
                Image(systemName: iconName)
                    .font(.largeTitle)
                Text(title)
                    .font(.footnote)
                    .foregroundColor(.primary)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(10)
        }
    }
}


#Preview {
    QuickActionsView()
}
