//
//  StatisticsDisplayView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 04/11/2024.
//

import SwiftUI

struct StatisticsDisplayView: View {
    
    @State var moneySpend: Int = 1555
    @State var moneyIncome: Int = 132
    @State var AVGBalance: Int = 1423
    
    var body: some View {
        HStack(alignment: .top) {
            Spacer()
            SummaryCard(value: "$\(moneySpend)", title: "Total Spend", valueColor: "statisticsMoneySpent")
            Spacer()
            Divider()
            Spacer()
            SummaryCard(value: "$\(moneyIncome)", title: "Total income", valueColor: "statisticsTotalIncome")
            Spacer()
            Divider()
            Spacer()
            SummaryCard(value: "-$\(AVGBalance)", title: "AVG Balance", valueColor: "statisticsAvgBalance")
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .center)
    }
}
    struct SummaryCard: View {
        var value: String
        var title: String
        var valueColor: String
        
        var body: some View {
            VStack(alignment: .center){
                // Headings/h2
                Text(value)
                    .font(.system(size: 22))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(Color(valueColor))
                   
                // Footnote/regular
                Text(title)
                    .font(.system(size: 12))
                    .fontWeight(.regular)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.statisticsTitle)
            }
        }
    }




#Preview {
    StatisticsDisplayView()
}
