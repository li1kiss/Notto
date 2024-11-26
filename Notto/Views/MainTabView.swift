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
        VStack(spacing: 0) {
            // Контент залежно від вибраної вкладки
            ZStack {
                            switch tabState.selectedTab {
                            case 0:
                                MainView()
                            case 1:
                                ActivitiesView()
                            case 2:
                                StatisticsView()
                            case 3:
                                ToDoView()
                            default:
                                MainView()
                            }
                        }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // Кастомна панель вкладок
            HStack {
                           TabButton(label: "Home", imageName: "square.grid.2x2", tag: 0)
                           Spacer()
                           TabButton(label: "Activities", imageName: "list.bullet.rectangle", tag: 1)
                           Spacer()
                           TabButton(label: "Statistics", imageName: "chart.bar", tag: 2)
                           Spacer()
                           TabButton(label: "To Do", imageName: "checkmark.square", tag: 3)
                       }
            .padding(.top, 10)
            .frame(height: 60) // Висота, подібна до стандартного TabBar
            .background(Color(.systemBackground).shadow(radius: 2)) // Фон і тінь
            .cornerRadius(10)
        }
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

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()

    }
}
