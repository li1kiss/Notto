//
//  RecentActivitiesView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 04/11/2024.
//

import SwiftUI

struct RecentActivitiesView: View {
    
    @EnvironmentObject var appState: AppState

    
    var body: some View {
    
            VStack(alignment: .leading){
                Text("Recent activities")
                    .font(.headline)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 7)
                VStack(spacing: 0){
                    ForEach(0..<3) { _ in
                        HStack(spacing: 8){
                            Image(systemName: "wrench")
                                .frame(width: 32, height: 32)
                                .background(Color.purple.opacity(0.2))
                                .cornerRadius(8)
                            
                            VStack(alignment: .leading){
                                HStack{
                                    VStack(alignment: .leading,spacing: 0) {
                                        Text("Service")
                                            .font(.system(size: 17))
                                        Text("Today 15:38")
                                            .font(.system(size: 15))
                                            .foregroundColor(.secondary)
                                        
                                    }
                                    Spacer()
                                    VStack(alignment: .trailing){
                                        Text("-$400")
                                            .font(.body)
                                            .foregroundColor(.red)
                                        Text("76,724 km")
                                            .font(.footnote)
                                            .foregroundColor(.secondary)
                                    }
                                }
                                
                            }
                            
                            
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 9)
                        Divider()
                    }
                    HStack{
                        Spacer()
                        
                        Button(action: {
                            appState.selectedTab = 1
                        }) {
                            Text("See all")
                                .fontWeight(.regular)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.vertical, 11)
                                .padding(.horizontal, 16)
                            
                        }
                        
                        Spacer()
                    }
                    
                    .cornerRadius(10)
                }
                .padding(.top, 8)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
            }
    }
}

#Preview {
    RecentActivitiesView()
}
