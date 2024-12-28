//
//  TabView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 07/11/2024.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        TabView(selection: $appState.selectedTab){
                    MainView()
                        .tabItem {
                            Image(systemName: "square.grid.2x2")
                            Text("Home")
                        }
                        .tag(0)
                    ActivitiesView()
                        .tabItem {
                            Image(systemName: "list.bullet.rectangle")
                            Text("Activities")
                        }
                        .tag(1)
                    StatisticsView()
                        .tabItem {
                            Image(systemName: "chart.bar")
                            Text("Statistics")
                        }
                        .tag(2)
                    ToDoView()
                        .tabItem {
                            Image(systemName: "checkmark.square")
                            Text("To Do")
                        }
                        .tag(3)
                }
                .accentColor(.blue)
        
    }
}


struct ActivitiesView: View {
    var body: some View {
        Text("Activities View")
    }
}

struct StatisticsView: View {
    var body: some View {
        Text("Statistics View")
    }
}

struct ToDoView: View {
    var body: some View {
        Text("To Do View")
    }
}


struct TabButton: View {
    @EnvironmentObject var appState: AppState
        var label: String
        var imageName: String
        var tag: Int

    var body: some View {
        VStack {
                    Image(systemName: appState.selectedTab == tag ? "\(imageName).fill" : imageName)
                        .font(.system(size: 20))
                        .foregroundColor(appState.selectedTab == tag ? .blue : .gray)
                    Text(label)
                        .font(.footnote)
                        .foregroundColor(appState.selectedTab == tag ? .blue : .gray)
                }
        .padding(.vertical, 4)
        .frame(maxWidth: .infinity)
        .onTapGesture {
            appState.selectedTab = tag
                }
    }
}

#Preview{
    MainTabView()
        .environmentObject(AppState())
}
