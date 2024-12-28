//
//  SettingsMainView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 26/12/2024.
//

import SwiftUI

struct SettingsMainView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Account"){
                    NavigationLink(destination: EmptyView()) {
                        HStack{
                            images(imagename: "person")
                        Text("Personal details")
                    }
                    }
                    NavigationLink(destination: EmptyView()) {
                        HStack{
                            images(imagename: "lock.shield")
               
                            Text("Login & security")
                        }
                    }
                }
                
                Section("General"){
                    NavigationLink(destination: EmptyView()) {
                        HStack{
                            images(imagename: "iphone.gen1")
                            Text("Basic settings")
                        }
                    }
                        NavigationLink(destination: EmptyView()) {
                            HStack{
                                images(imagename: "bell")
                                Text("Notifications")
                            }
                        }
                }
                
                Section("Functionality"){
                    NavigationLink(destination: EmptyView()) {
                        HStack{
                            images(imagename: "car")
                            Text("Vehicles")
                        }
                    }
                        NavigationLink(destination: EmptyView()) {
                            HStack{
                                images(imagename: "waveform")
                                Text("Measurement units")
                            }
                        }
                        NavigationLink(destination: EmptyView()) {
                            HStack{
                                images(imagename: "square.grid.2x2")
                                Text("Categories")
                            }
                        }
                            NavigationLink(destination: EmptyView()) {
                                HStack{
                                    images(imagename: "mappin.and.ellipse")
                                    Text("Locations")
                                }
                            }
                            
                        }
                
                
                Section("Support"){
                    NavigationLink(destination: EmptyView()) {
                        HStack{
                            images(imagename: "steeringwheel")
                            Text("About the app")
                        }
                    }
                        NavigationLink(destination: EmptyView()) {
                            HStack{
                                images(imagename: "bubble.right")
                                Text("Feedback")
                            }
                        }
                }
                
            }
            .toolbar(.hidden, for: .tabBar)
            .navigationTitle("Setting")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true) // Приховує стандартну кнопку
            .navigationBarItems(leading: Button(action: {
                appState.showSettings = false
            }) {
                Image(systemName: "chevron.left") // Іконка стрілки
                    .font(.headline)
            })
        }
    }
}


func images(imagename : String) -> some View {

        Image(systemName: imagename)
            .frame(width: 32, height: 32)
            .foregroundStyle(Color.white)
            .background(Color.blue)
            .cornerRadius(6)

    
}

#Preview {
    NavigationView {
        SettingsMainView()
    }
}
