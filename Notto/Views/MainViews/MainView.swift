//
//  MainView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 04/11/2024.
//

import SwiftUI

struct MainView: View {
    
    
    @EnvironmentObject var appState: AppState
    
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
                    HeaderView(showSettings: $appState.showSettings)
                    Spacer()
                }
            }
            .background(.backgroundPrimary)
            
        }
        .fullScreenCover(isPresented: $appState.showSettings) { // Презентуємо SettingsMainView як full screen
                        SettingsMainView()
                    }
    }
}


#Preview {
    MainView()
        .environmentObject(AppState())
}

