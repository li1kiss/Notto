//
//  TabView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 07/11/2024.
//

import SwiftUI

class TabState: ObservableObject {
    @Published var selectedTab: Int = 0 // Відстежувана змінна для вибору вкладки
}

struct MainTabView: View {
    @EnvironmentObject var tabState: TabState

    var body: some View {
        TabView {
                    MainView()
                        .tabItem {
                            Image(systemName: "square.grid.2x2")
                            Text("Home")
                        }
                    
                    ActivitiesView()
                        .tabItem {
                            Image(systemName: "list.bullet.rectangle")
                            Text("Activities")
                        }
                    
                    StatisticsView()
                        .tabItem {
                            Image(systemName: "chart.bar")
                            Text("Statistics")
                        }
                    
                    ToDoView()
                        .tabItem {
                            Image(systemName: "checkmark.square")
                            Text("To Do")
                        }
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
    @EnvironmentObject var tabState: TabState
        var label: String
        var imageName: String
        var tag: Int

    var body: some View {
        VStack {
                    Image(systemName: tabState.selectedTab == tag ? "\(imageName).fill" : imageName)
                        .font(.system(size: 20))
                        .foregroundColor(tabState.selectedTab == tag ? .blue : .gray)
                    Text(label)
                        .font(.footnote)
                        .foregroundColor(tabState.selectedTab == tag ? .blue : .gray)
                }
        .padding(.vertical, 4)
        .frame(maxWidth: .infinity)
        .onTapGesture {
                        tabState.selectedTab = tag
                }
    }
}

#Preview{
    MainTabView()
        .environmentObject(TabState())
}
