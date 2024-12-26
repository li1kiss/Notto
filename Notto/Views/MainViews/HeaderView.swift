//
//  HeaderView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 04/11/2024.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var authService: AuthService
    var body: some View {
        HStack {
            Image("userCarLogo")
                .frame(width: 50, height: 50, alignment: .center)
                .background(Color.white)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text("BMW X3 xDrive 30")
                    .font(
                        Font.custom("", size: 18)
                        .weight(.semibold)
                    )
                    .foregroundColor(Color("colorCarName"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("76,724 км")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            HStack(spacing: 16) {
                Button(action: {
                    print("bell")
                }) {
                    Image(systemName: "bell")
                        .font(.system(size: 22))
                        .fontWeight(.regular)
                        .padding(0)
                        .frame(maxWidth: 50, maxHeight: 50, alignment: .center)
                        
                }
                .buttonStyle(StandardButtonStyle())
                
                
                Button(action: {
                    print("gear")
                    authService.handleLogout()
                }) {
                    Image(systemName: "gear")
                        .font(.title2)
                        .padding(0)
                        .frame(maxWidth: 50, maxHeight: 50, alignment: .center)
                        
                }
                .buttonStyle(StandardButtonStyle())
            }
        }
        .padding(.horizontal,16)
        .padding(.bottom, 8)
        .background(.regularMaterial)
        

    }
}

struct StandardButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(configuration.isPressed ? Color.white.opacity(0) : Color.white) // Зміна фону при натисканні
            .foregroundColor(configuration.isPressed ? Color.blue : Color("colorHeaderButtons"))
            .cornerRadius(8) // Округлені кути
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0) // Ефект зменшення при натисканні
    }
}


#Preview {
    HeaderView()
}
