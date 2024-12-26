//
//  EnterEmailCodeView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 27/11/2024.
//

import SwiftUI
import UIKit

struct EnterEmailCodeView<NextView: View>: View {
    // MARK: - Properties
    @EnvironmentObject var authService: AuthService
    @Environment(\.presentationMode) var presentationMode
    @Binding var userEmail: String
    let nextView: () -> NextView

    @State private var code: [String] = Array(repeating: "", count: 6)
    @State private var showPopover = false
    @FocusState private var focusedField: Int?

    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            
                ZStack {
                    BackgroundView()
                    imageView(geometry: geometry)
                    VStack(spacing: 0) {
                        
                        titleView(geometry: geometry)
                        Spacer()
                        codeEntrySection(geometry: geometry)
                        
                    }
                    
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done"){
                            focusedField = nil // Закриваємо клавіатуру
                        }
                    }
                    
                }
                .background(Color.backgroundPrimary)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)
            .navigationBarBackButtonHidden(true)
            .toolbarNavigation(title: "Forgot Password"){
                presentationMode.wrappedValue.dismiss()
            }
    }
}

// MARK: - Preview
struct EnterEmailCodeView_Preview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            EnterEmailCodeView<ChangePasswordView>(
                userEmail: .constant("user@gmail.com"),
                nextView: { ChangePasswordView() }
            )
            .environmentObject(AuthService())
        }
    }
}





// MARK: - Subviews
extension EnterEmailCodeView {
    
    
    private func imageView(geometry: GeometryProxy) -> some View {
        VStack {
            Image("envelope.clock")
                .resizable()
                .scaledToFit()
                .frame(width: UIScreen.main.bounds.width * 0.70, height: UIScreen.main.bounds.height * 0.3)
                .offset(x: 90, y: -25)
            Spacer()
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
    
    private func titleView(geometry: GeometryProxy) -> some View {
        VStack(alignment: .leading){
            TextTitleLoginView(
                title: "Check your email",
                subtitle: "We have sent a code to your email",
                paddingButton: geometry.size.height * 0.06
            )
            HStack(spacing: 0){
                Text(userEmail)
                    .foregroundStyle(.white)
                    .padding(.leading, 25)
                    .font(.system(size: 17))
                Text(".")
                    .font(.system(size: 17))
                    .foregroundStyle(Color.subtitleColorSet.opacity(0.75))
            }
        }
    }
    
    private func codeEntrySection(geometry: GeometryProxy) -> some View {
        
            VStack {
                codeInputFields
                sendButton
                againsendButton
                Spacer()
                
                supportText
       
            }
        .customBackgroundLogin(geometry: geometry, heightPercentage: 65)
    }

    
    private var codeInputFields: some View {
        HStack(spacing: 8) {
            ForEach(0..<6) { index in
                CodeDigitField(
                    text: $code[index], showRedText: $showPopover,
                    index: index,
                    focusedField: $focusedField,
                    totalDigits: 6
                ){
                    handleCodeCompletion()
                        
                }
                .iOSPopover(isPresented: $showPopover, arrowDirection: .down) {
                    invalidCodeMessage
                 
                }
                
            }
            
        }
    }
    
    private var invalidCodeMessage: some View {
            Text("Code is not valid")
                .padding()
                .font(.system(size: 13))
                .foregroundColor(.popoverForeground)
                .frame(width: 157, height: 18) // Розміри вмісту поповеру
                .padding(8)
    }


    
    private var sendButton: some View {
        Button {
            
            UIApplication.shared.hideKeyboard()
        } label: {
            NavigationLink(destination: nextView()) {
                Text("Send")
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .foregroundColor(.white)
            }
        }
        .buttonStyle(
            CustomButtonStyle(
                normalColorBackground: Color.unpressedColorButton,
                pressedColorBackground: Color.buttonPressed,
                normalColorForeground: .white,
                pressedColorForeground: .white
            )
        )
        .cornerRadius(8)
        .padding(.top, 24)
    }
    
    private var againsendButton: some View {
        Button {
            showPopover.toggle()
        } label: {
            Text("Send code again")
                .foregroundColor(Color.unpressedColorButton)
        }
        .padding(.vertical, 8)
    }
    
    private var supportText: some View {
        VStack(spacing: 0){
            Text("Did not receive the email? Check your")
                .foregroundStyle(.secondaryText)
                .font(.system(size: 15))
            HStack(spacing: 0){
                Text("spam filter, or ")
                    .font(.system(size: 15))
                    .foregroundStyle(.secondaryText)
                Button{
                    presentationMode.wrappedValue.dismiss()
                }label:{
                    Text("try another email address")
                        .font(.system(size: 15))
                        .foregroundColor(.blue)
                }
            }
        }
        .padding(.bottom, 8)
    }
    
}


// MARK: - Actions
extension EnterEmailCodeView {
    private func handleCodeCompletion() {
        print("Code is complete: \(code.joined())")
        // Додаткова логіка після введення коду
    }
}



// MARK: - CodeDigitField
struct CodeDigitField: View {
    // MARK: - Properties
    @Binding var text: String
    @Binding var showRedText: Bool
    var index: Int
    var focusedField: FocusState<Int?>.Binding
    var totalDigits: Int
    var onComplete: () -> Void
    
    // MARK: - Body
    var body: some View {
        TextField("_", text: $text)
            .foregroundStyle(showRedText ?  Color.red  :Color.gray)
            .font(.system(size: 17))
            .keyboardType(.numberPad)
            .textContentType(.oneTimeCode)
            .padding(.vertical, 11)
            .background(Color.white)
            .cornerRadius(4)
            .font(.title)
            .multilineTextAlignment(.center)
            .focused(focusedField, equals: index)
            .onChange(of: text) { oldValue, newValue in
                handleTextChange()
            }
            .onTapGesture {
                focusedField.wrappedValue = index
            }
        
    }
    
    // MARK: - Methods
    private func handleTextChange() {
        // Дозволяємо тільки цифри та обмежуємо одним символом
        text = String(text.prefix(1)).filter { $0.isNumber }
        
        if !text.isEmpty {
            if index < totalDigits - 1 {
                // Переходимо до наступного поля
                focusedField.wrappedValue = index + 1
            } else {
                focusedField.wrappedValue = nil
                onComplete()
            }
        } else if index > 0 {
            // Повертаємося до попереднього поля при видаленні
            focusedField.wrappedValue = index - 1
        }
    }

}
