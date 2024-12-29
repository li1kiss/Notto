import SwiftUI

struct PersonalDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var licenseNumber: String = ""
    @State private var licenseCategory: String = ""
    @State private var validityPeriod: String = ""

    @FocusState private var focusedField: Field?

    enum Field: Hashable {
        case firstName, lastName, licenseNumber, licenseCategory, validityPeriod
    }

    var body: some View {
            List {
                Section(header: Text("Personal Information")) {
                    CompactInputField(label: "First Name", placeholder: "Name", text: $firstName, isFocused: $focusedField, field: .firstName)
                    CompactInputField(label: "Last Name", placeholder: "Surname", text: $lastName, isFocused: $focusedField, field: .lastName)
                }
                
                Section(header: Text("Driver's License Details")) {
                    CompactInputField(label: "Driver's licence", placeholder: "Licence number", text: $licenseNumber, isFocused: $focusedField, field: .licenseNumber)
                    CompactInputField(label: "Licence category", placeholder: "Enter category", text: $licenseCategory, isFocused: $focusedField, field: .licenseCategory)
                    CompactInputField(label: "Validity period", placeholder: "Enter date", text: $validityPeriod, isFocused: $focusedField, field: .validityPeriod)
                    
                }
                HStack {
                            Button {
                                print("Save натиснуто")
                            } label: {
                                Text("Save")
                                    .frame(maxWidth: .infinity) 
                                    .padding(.vertical, 14)
                                    .foregroundColor(.white)
                            }
                            .buttonStyle(CustomButtonStyle(
                                normalColorBackground: Color.unpressedColorButton,
                                pressedColorBackground: Color.buttonPressed,
                                normalColorForeground: .white,
                                pressedColorForeground: .white))
                        }
                        .listRowInsets(EdgeInsets())
                        .padding(.horizontal, -16)

            
           
        }
        .navigationTitle("Personal details")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Image(systemName: "chevron.left")
                            .font(.headline)
                            
                    }
                }
            }
        }

    
    }
}

struct CompactInputField: View {
    let label: String
    let placeholder: String
    @Binding var text: String
    @FocusState.Binding var isFocused: PersonalDetailView.Field?
    let field: PersonalDetailView.Field

    var body: some View {
        HStack {
            Text(label)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 0) {
                TextField(placeholder, text: $text)
                    .focused($isFocused, equals: field)
                    .tint(Color.gray)
                    .multilineTextAlignment(.leading)
                if isFocused == field && !text.isEmpty {
                    Button(action: {
                        text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                    .padding(.leading, 8)
                }
            }
            .frame(minWidth: 0, maxWidth: 170, alignment: .trailing)
        }
    }
}

#Preview {
    NavigationView {
        PersonalDetailView()
    }
}
