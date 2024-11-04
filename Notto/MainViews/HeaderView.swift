//
//  HeaderView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 04/11/2024.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text("BMW X3 xDrive 30")
                    .font(.headline)
                    .bold()
                Text("76,724 км")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            HStack(spacing: 16) {
                Button(action: {
                    // Дія для сповіщень
                }) {
                    Image(systemName: "bell")
                        .font(.title2)
                        .foregroundColor(.primary)
                }
                
                Button(action: {
                    // Дія для налаштувань
                }) {
                    Image(systemName: "gear")
                        .font(.title2)
                        .foregroundColor(.primary)
                }
            }
        }
        .padding()
        .background(.ultraThinMaterial)
        

    }
}

#Preview {
    HeaderView()
}
