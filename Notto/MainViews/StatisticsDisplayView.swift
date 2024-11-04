//
//  StatisticsDisplayView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 04/11/2024.
//

import SwiftUI

struct StatisticsDisplayView: View {
    var body: some View {
        HStack(spacing: 16) {
                        SummaryCard(title: "Загальні витрати", value: "$3,902")
                        SummaryCard(title: "Загальний дохід", value: "$1,834")
                        SummaryCard(title: "Середній баланс", value: "-$2,194")
        }
    }
}

struct SummaryCard: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(value)
                .font(.title3)
                .bold()
            Text(title)
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}


#Preview {
    StatisticsDisplayView()
}
