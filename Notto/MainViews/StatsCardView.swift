//
//  StatsCardView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 04/11/2024.
//

import SwiftUI

struct StatsCardView: View {
    var body: some View {
        HStack(spacing: 16) {
            StatCard(title: "Cost per km", value: "$2.46")
            StatCard(title: "Щоденна вартість", value: "$6.70")
            StatCard(title: "Витрата пального", value: "10.6 км/л")

        }
    }
}

struct StatCard: View {
    var title: String
    var value: String
    
    var body: some View {
//        VStack(spacing: 8) {
//            Spacer()
//            
//                
//                Text(value)
//                    .font(.title2)
//                    .bold()
//            HStack{
//                Text(title)
//                    .font(Font.custom(Constants.footnoteFamily, size: Constants.footnoteSize)
//                        .weight(Constants.footnoteWeightRegular))
//                    .foregroundColor(Color("typographySubtitleLight"))
//                    .multilineTextAlignment(.leading)
//                    .padding(8)
//                Spacer()
//            }
//        }
//        .frame(width: 99, height: 99)
//        .background(Color(red: 0.33, green: 0.55, blue: 1))
//        .cornerRadius(10)
        
        VStack(alignment: .leading, spacing: Constants.unnamed) { }
        .padding(Constants.unnamed)
        .frame(maxWidth: .infinity, minHeight: 120, maxHeight: 120, alignment: .bottomLeading)
        .background(
        Image("PATH_TO_IMAGE")
        .resizable()
        .aspectRatio(contentMode: .fill)
        .frame(width: 114, height: 120)
        .clipped()
        .opacity(0.6)
        )
        .background(
        EllipticalGradient(
        stops: [
        Gradient.Stop(color: Color(red: 0.33, green: 0.55, blue: 1), location: 0.00),
        Gradient.Stop(color: Color(red: 0.12, green: 0.3, blue: 0.69), location: 1.00),
        ],
        center: UnitPoint(x: 0.3, y: 0.75)
        )
        )
        .cornerRadius(Constants.unnamed)
        }
}

struct Constants {
    
    static let typographySubtitleLight: Color = Color(red: 0.95, green: 0.95, blue: 0.97).opacity(0.75)
static let footnoteSize: CGFloat = 13
static let footnoteFamily: String = "SF Pro"
static let footnoteWeightRegular: Font.Weight = .regular
    static let unnamed: CGFloat = 8
}

#Preview {
    StatsCardView()
}
