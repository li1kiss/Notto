//
//  LoginView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 22/10/2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var appViewModel: AppViewModel
    @State private var username = ""
    @State private var password = ""
    @State private var showRegisterView = false // Для переходу на RegisterView
    
    var body: some View {
        GeometryReader{ geometry in
            
            ZStack{
                VStack{
                    Color("backgroundLoginColor")
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
                VStack {
                    Image("wheel")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width * 0.556 ,height:  geometry.size.height * 0.3)
                        .offset(x: 110, y: geometry.size.height * 0.02)
                        .rotationEffect(.degrees(0))
                    Spacer()
                }
                VStack(spacing: 0){
                    Spacer()
                    //                Text("\(geometry.size.height)")
                    //                        Text("\(geometry.size.width)")
                    //
                    //                let scale = UIScreen.main.scale
                    //                Text("Scale factor: \(scale)") // Наприклад, 2.0 або 3.0
                    VStack(alignment: .leading,spacing: 12){
                        Text("Log in to your account")
                            .foregroundStyle(Color.white)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity,alignment: .leading)
                            .font(.system(size: 28))
                            .kerning(0.38)
                        Text("Control your car in smartphone.")
                            .font(.system(size: 17))
                            .foregroundStyle(Color.subtitleColorSet.opacity(0.75))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                    .padding(.horizontal, 24)
                    .padding(.bottom, geometry.size.height * 0.095)
                    //                            Spacer()
                    VStack(spacing: 0){
                        VStack(spacing: 16){
                            InputFieldView(textInput: $username, isSecure: false, titleInput: "your@email.com", title: "Email")
                            
                            
                            InputFieldView(textInput: $password, isSecure: true, titleInput: "At least 8 symbols", title: "Password")
                        }
                        Button{
                        appViewModel.login(username: username, password: password)
                            print("ok")
                            UIApplication.shared.hideKeyboard()
                        }label: {
                            Text("Sign In")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical,14)
                                .foregroundColor(.white)
                            
                        }
                        .buttonStyle(CustomButtonStyle(normalColorBackground: Color.unpressedColorButton, pressedColorBackground: Color.buttonPressed, normalColorForeground: .white, pressedColorForeground: .white))
                        .cornerRadius(8)
                        .padding(.top, 24)
                        
                        Button{
                            print("forgot")
                        }label: {
                            Text("Forgot password?")
                            
                        }
                        .padding(geometry.size.height * 0.042)
                        
                        Spacer()
                        
                        Button{
//                              appViewModel.login(username: username, password: password)
                            print("register")
                        }label: {
                            Text("Create a new account")
                                .frame(maxWidth: .infinity)
                                .padding(.vertical,14)
                            
                            
                        }
                        .buttonStyle(CustomButtonStyle(normalColorBackground: .unpressedColorCreateButton, pressedColorBackground: Color.buttonPressed.opacity(0.1), normalColorForeground: Color.unpressedTextButton, pressedColorForeground: .white))
                        .cornerRadius(8)
                        .padding(.bottom,8)
                        
                    }
                    .frame(maxHeight: geometry.size.height * 0.72)
                    .padding(.horizontal,24)
                    .padding(.top,32)
                    .background(Color.backgroundPrimary)
                    .cornerRadius(16, corners: [.topLeft, .topRight])
                }
            }
            
        }
        .background(Color.backgroundPrimary)
        .ignoresSafeArea(.keyboard, edges: .bottom)
        
        if appViewModel.showBlur {
                    VisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
                        .edgesIgnoringSafeArea(.all)
                        .transition(.opacity)
                        .animation(.easeInOut(duration: 0.5), value: appViewModel.showBlur)
                }
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}



extension UIApplication {
    func hideKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}



struct InputFieldView: View {
    
    @Binding var textInput: String
    @State var isSecure: Bool
    @State var titleInput: String
    @State var title: String
    var body: some View {
        if isSecure {
            VStack(alignment: .leading, spacing: 8){
                Text(title)
                SecureField(titleInput, text: $textInput)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 11)
                    .textInputAutocapitalization(.never)
                    .background(Color.white)
                    .cornerRadius(4)
            }

        }else {
            VStack(alignment: .leading, spacing: 8){
                Text(title)
                TextField(titleInput, text: $textInput)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 11)
                    .textInputAutocapitalization(.never)
                    .background(Color.white)
                    .cornerRadius(4)
            }
        }
        
        
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}




struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?

    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView {
        UIVisualEffectView()
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) {
        uiView.effect = effect
    }
}
