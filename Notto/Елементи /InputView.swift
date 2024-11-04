
//
//  InputView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 22/10/2024.
//
import SwiftUI

struct InputView: View {
    @Binding var text: String
    var title: String
    var isSecureField: Bool
    var placeholder: String

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .foregroundColor(Color(.darkGray))
                .fontWeight(.semibold)
                .font(.footnote)
            
            // Використовуємо або TextField, або SecureField залежно від параметра isSecureField
            if isSecureField {
                SecureField(placeholder, text: $text)
                    .font(.system(size: 14))
                    .textInputAutocapitalization(.never)

            } else {
                TextField(placeholder, text: $text)
                    .font(.system(size: 14))
                    .textInputAutocapitalization(.never)

            }
            
            Divider()
        }
    }
}



struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Your Email", isSecureField: true, placeholder: "example@email.com")
    }
}


