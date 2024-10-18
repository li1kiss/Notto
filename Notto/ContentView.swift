import SwiftUI

struct ContentView: View {
    @State private var carSelected = "Mazda MX-5 III"
    let cars = ["audi", "bmw"]
    var body: some View {
        NavigationStack{
            ZStack{
                // TabView
                TabView {
                    
                    MainView() // Ваш основний вигляд
                        .tabItem {
                            Label("Overview", systemImage: "car.fill")
                        }
                    
                    StatisticsView() // Ваш окремий вигляд для статистики
                        .tabItem {
                            Label("Statistics", systemImage: "chart.bar.fill")
                        }
                    
                    AddView() // Ваш окремий вигляд для додавання
                        .tabItem {
                            Label("Add", systemImage: "plus.app.fill")
                        }
                    
                    ToDoView() // Ваш окремий вигляд для справ
                        .tabItem {
                            Label("To Do", systemImage: "checkmark.circle.fill")
                        }
                    
                    SettingsView() // Ваш окремий вигляд для налаштувань
                        .tabItem {
                            Label("Settings", systemImage: "gearshape.fill")
                        }
                }
                VStack{
                    Image("ImageCarTest")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .mask(
                            LinearGradient(
                                gradient: Gradient(stops: [
                                    .init(color: Color.black.opacity(0.0), location: 0),   // Початкова прозорість зверху
                                    .init(color: Color.black.opacity(1), location: 0.5), // Повна видимість у середині
                                    .init(color: Color.black.opacity(0.0), location: 1)    // Прозорість знизу
                                ]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                    Spacer()
                }
                
                VStack {
                    HStack {
                        
                        Button("", systemImage: "person"){}
                            .foregroundStyle(.black)
                        Spacer()
                        Picker("Select a car", selection: $carSelected) {
                                                    ForEach(cars, id: \.self) {
                                                        Text($0)
                                                            
                                                    }
                                                }
                        .pickerStyle(.menu) // Використовуйте стиль меню
                        .accentColor(.black)
                                                .padding(.horizontal)
                        
                        Spacer() // Відступ для кнопок справа
                        Button(action: {
                            // Додайте дію для кнопки "gear"
                            print("Settings pressed")
                        }) {
                            Image(systemName: "photo.on.rectangle")
                                .font(.system(size: 20))
                                .foregroundStyle(.black)
                                .padding(0)
                        }
                        
                        Button(action: {
                            // Додайте дію для кнопки "plus"
                            print("Add pressed")
                        }) {
                            Image(systemName: "gear")
                                .font(.system(size: 20))
                                .foregroundStyle(.black)
                                .padding(.leading)
                        }
                        
                    }
                    Spacer()
                }
                .padding(.horizontal)
                
                }
            }
        }
    }

// Приклади окремих виглядів для кожної вкладки
struct StatisticsView: View {
    var body: some View {
        Text("Statistics View")
            .navigationTitle("Statistics")
    }
}

struct AddView: View {
    var body: some View {
        Text("Add View")
            .navigationTitle("Add")
    }
}

struct ToDoView: View {
    var body: some View {
        Text("To Do View")
            .navigationTitle("To Do")
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings View")
            .navigationTitle("Settings")
    }
}

#Preview {
    ContentView()
}
