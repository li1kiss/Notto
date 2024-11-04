//
//  MainView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 04/11/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        ZStack{
                ScrollView{
                    VStack(spacing: 16) {
                        
                        
                        
                        StatsCardView()
                        
                        StatisticsDisplayView()
                        QuickActionsView()
                        
                        RemindersView()
                        
                        RecentActivitiesView()
                        
                        Spacer()
                    }
                    .offset(y: 80)
                    .padding(16)
                }
                
                .navigationBarHidden(true)

            VStack{
                HeaderView()
                Spacer()
            }
            }

    }
}

#Preview {
    MainView()
}

