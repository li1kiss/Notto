//
//  MainView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 04/11/2024.
//

import SwiftUI

struct MainView: View {
    
    @State private var showSettings = false
    var body: some View {
      
        NavigationStack{
            ZStack{
                ScrollView{
                    VStack(spacing: 16) {
                        
                        
                        
                        StatsCardView()
                        
                        VStack(alignment: .center, spacing: 16){
                            StatisticsDisplayView()
                            QuickActionsView()
                        }
                        .padding(16)
                        .background(.white)
                        .cornerRadius(8)
                        
                        
                        ReminderView()
                        
                        RecentActivitiesView()
                        
                        Spacer()
                    }
                    .padding(16)
                }
                .safeAreaInset(edge: .top) {
                    Spacer().frame(height: 50) // Зміщення вмісту вниз
                }
                .scrollIndicators(.hidden)
                
                VStack{
                    HeaderView(showSettings: $showSettings)
                    Spacer()
                }
            }
            .background(.backgroundPrimary)
            
        }
        .fullScreenCover(isPresented: $showSettings) { // Презентуємо SettingsMainView як full screen
                        SettingsMainView()
                    }
    }
}


#Preview {
    MainView()
        .environmentObject(TabState())
}

