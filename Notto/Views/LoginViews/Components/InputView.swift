//
//  InputFieldView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 22/10/2024.
//

import SwiftUI

struct InputFieldView: View {
    
    @Binding var textInput: String
    @State var isSecure: Bool
    @State var isVisible: Bool = true
    
    var title: String
    var placeholder: String = ""
    
    private let fieldPadding: CGFloat = 16
    private let cornerRadius: CGFloat = 4
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
            
            if isSecure {
                secureField
            } else {
                standardField
            }
        }
    }
    
    // MARK: - Secure Field
    private var secureField: some View {
        HStack {
            if isVisible {
                SecureField(placeholder, text: $textInput)
                    .textFieldStyle
            } else {
                TextField(placeholder, text: $textInput)
                    .textFieldStyle
            }
            
            toggleVisibilityButton
        }
        .padding(.horizontal, 16)
        .background(Color.white)
        .cornerRadius(4)
    }
    
    private var standardField: some View {
        TextField(placeholder, text: $textInput)
            .textFieldStyle
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(4)
    }
    
    // MARK: - Visibility Toggle Button
    private var toggleVisibilityButton: some View {
        Button(action: { isVisible.toggle() }) {
            Image(systemName: isVisible ? "eye.slash" : "eye")
                .foregroundColor(.gray)
        }
    }
}

// MARK: - Extensions
private extension View {
    var textFieldStyle: some View {
        self
            .padding(.vertical, 11)
            .lineLimit(1)
            .frame(height: 50)
            .multilineTextAlignment(.leading)
            .textInputAutocapitalization(.never)
    }
}


struct InputFieldView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InputFieldView(textInput: .constant(""), isSecure: true, title: "Password")
            InputFieldView(textInput: .constant("Sample Text"), isSecure: false, title: "Email")
        }
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
