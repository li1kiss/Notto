//
//  TextTitleLoginView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 28/11/2024.
//

import SwiftUI

struct TextTitleLoginView: View {
    
    var title : String
    var subtitle : String
    var paddingButton : CGFloat
    
    var body: some View {
        VStack(alignment: .leading,spacing: 12){
            Text(title)
                .foregroundStyle(Color.white)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .font(.system(size: 28))
                .kerning(0.38)
            Text(subtitle)
                .font(.system(size: 17))
                .foregroundStyle(Color.subtitleColorSet.opacity(0.75))
                .frame(maxWidth: .infinity, alignment: .leading)
            
        }
        .padding(.horizontal, 24)
        .padding(.top, paddingButton)
    }
}

#Preview {
    TextTitleLoginView(title: "Title", subtitle: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", paddingButton: 10)
}
