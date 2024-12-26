//
//  StatsCardView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 04/11/2024.
//

import SwiftUI

struct StatsCardView: View {
    var body: some View {
        HStack(spacing: 16) {
            StatCard(title: "Cost per km", value: "$2.46")
            StatCard(title: "Щоденна вартість", value: "$6.70")
            StatCard(title: "Витрата пального", value: "10.6 км/л")

        }
    }
}

struct StatCard: View {
    var title: String
    var value: String
    
    var body: some View {

        VStack(alignment: .leading, spacing: 8) {
            
        }
        .padding(8)
        .frame(maxWidth: .infinity, minHeight: 120, maxHeight: 120, alignment: .bottomLeading)
        .background(Color("colorStatsCard"))
        .cornerRadius(8)
        }
}

#Preview {
    StatsCardView()
}
