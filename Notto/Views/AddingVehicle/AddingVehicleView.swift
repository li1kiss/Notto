import SwiftUI

struct AddingVehicleView: View {
    
    let vehicles = [
        Vehicle(name: "Motorbike", imageName: "motorcycle"),
        Vehicle(name: "Car", imageName: "car.side"),
        Vehicle(name: "Bus", imageName: "bus.fill"),
        Vehicle(name: "Truck", imageName: "truck.box")
    ]
    
    let fuelTypes = ["CNG", "Diesel", "Electricity", "Gasoline", "Hybrid", "Hydrogen", "LPG"]

    let measurementUnits = [
        "Cubic meter (m³)",
        "US gallon (US gal)",
        "Imperial gallon (imp ga)",
        "Kilogram (kg)",
        "Kilowatt-hour (kWh)",
        "Liter (L)"
    ]
    
    let mileageUnits = ["Km", "Mile"]
    
    @State private var selectedVehicle: String = "Car"
    @State private var selectedBrand: String = "Choose brand"
    @State private var selectedModel: String = "Choose model"
    @State private var selectedYear: String = "Choose year"
    @State private var selectedFuelType: String = "Gasoline"
    @State private var selectedMeasurementUnit: String = "Liter (L)"
    @State private var fuelTank: String = ""
    @State private var vin: String = ""
    @State private var mileage: String = "0000000"
    @State private var mileageUnit: String = "Km"
    @State private var countSymbolsNote: Int = 30
    @State private var textNote: String = ""
    @State private var showAlert: Bool = false
    @State private var navigateToNextView: Bool = false
    
    
    var body: some View {
        NavigationStack {
            ZStack{
                Form {
                    Picker("Vehicle", selection: $selectedVehicle) {
                        ForEach(vehicles) { vehicle in
                            HStack {
                                Image(systemName: vehicle.imageName)
                                Text(vehicle.name)
                            }
                            .tag(vehicle.name)
                        }
                    }
                    .tint(Color.black)
                    
                    Section {
                        NavigationLink(destination: BrandPickerView(selectedBrand: $selectedBrand)) {
                            HStack {
                                Text("Brand")
                                Spacer()
                                Text(selectedBrand)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        NavigationLink(destination: ModelPickerView(selectedBrand: selectedBrand, selectedModel: $selectedModel)) {
                            HStack {
                                Text("Model")
                                Spacer()
                                Text(selectedModel)
                                    .foregroundColor(.gray)
                            }
                        }
                        
                        NavigationLink(destination: YearPickerView(selectedYear: $selectedYear)) {
                            HStack {
                                Text("Year")
                                Spacer()
                                Text(selectedYear)
                                    .foregroundColor(.gray)
                            }
                        }
                    } header: {
                        HStack(spacing: 4) {
                            Image(systemName: "steeringwheel")
                            Text("Main info (required)")
                        }
                    }
                    
                    
                    Section{
                        Picker("Fuel type", selection: $selectedFuelType) {
                            ForEach(fuelTypes, id: \.self) { superFuelType in
                                Text(superFuelType)
                            }
                        }
                        .pickerStyle(.menu)
                        .tint(Color.black)
                        
                        
                        
                        Picker("Volume units",selection: $selectedMeasurementUnit) {
                            ForEach(measurementUnits, id: \.self) {
                                Text($0)
                            }
                        }
                        .tint(Color.black)
                        
                        
                        
                        HStack{
                            Text("Fuel tank")
                                .frame(width: 100, alignment: .leading)
                            
                            TextField("Enter tank volume", text: $fuelTank)
                                .keyboardType(.numberPad)
                            
                            
                        }
                    }header: {
                        HStack{
                            Image(systemName: "fuelpump.exclamationmark.fill")
                            Text("Fuel(required)")
                        }
                    }
                    
                    
                    Section{
                        HStack{
                            Text("VIN")
                                .frame(width: 90, alignment: .leading)
                            TextField("Enter code", text: $vin)
                                .onSubmit {
                                    hideKeyboard()
                                }
                        }
                        
                        
                        HStack{
                            Text("Mileage")
                                .frame(width: 90, alignment: .leading)
                            TextField("Enter code", text: $mileage)
                                .tint(Color.gray)
                            
                            Picker("Mileage", selection: $mileageUnit){
                                ForEach(mileageUnits, id: \.self){
                                    Text($0)
                                }
                            }
                            .pickerStyle(.segmented)
                            
                        }
                        
                        
                        HStack{
                            Text("Note")
                                .frame(width: 90, alignment: .leading)
                            TextField("Enter short text", text: $textNote)
                                .tint(Color.gray)
                            
                            Text("\(countSymbolsNote)/30")
                                .foregroundStyle(Color.gray)
                            
                        }
                    }header:{
                        HStack{
                            Image(systemName: "menucard")
                            Text("Other")
                        }
                    }
                    
                    
                    
                }

                .navigationTitle("Add Vehicle")
                .navigationBarTitleDisplayMode(.inline)
                .safeAreaInset(edge: .bottom) {
                    Button{
                                       showAlert = true
                                   }
                                   label: {
                                       Text("Save")
                                           .frame(maxWidth: .infinity)
                                           .padding(.vertical, 12)
                   
                                           .foregroundColor(.white)
                                   }
                                   .buttonStyle(CustomButtonStyle(
                                       normalColorBackground: Color.unpressedColorButton,
                                       pressedColorBackground: Color.buttonPressed,
                                       normalColorForeground: .white,
                                       pressedColorForeground: .white))
                                   .cornerRadius(8)
                                   .padding(.horizontal,18)
                                   .padding(.bottom,8)
                                   .background(.regularMaterial)
                            }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: LoginView()){
                            Image(systemName: "rectangle.portrait.and.arrow.right")
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .alert("Перехід на новий екран", isPresented: $showAlert) {
                    Button("OK") {
                        navigateToNextView = true
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .fullScreenCover(isPresented: $navigateToNextView) {
            MainTabView()
        }
     
    }
}

#Preview{
    AddingVehicleView()
}



struct Vehicle: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
}

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        HStack{
            Image(systemName: "magnifyingglass")
            TextField(" Search", text: $text)
     
        }
    }
}



struct BrandPickerView: View {
    @Binding var selectedBrand: String
    @Environment(\.presentationMode) var presentationMode
    @State private var searchText = ""
    
    let carBrands = [
        "Audi", "BMW", "Chevrolet", "Citroen", "Dacia", "Fiat", "Ford", "Honda", "Hyundai", "Jeep",
        "KIA", "Land Rover", "Lexus", "Mazda", "Mercedes-Benz", "Nissan", "Opel", "Peugeot", "Renault", "Skoda",
        "Subaru", "Suzuki", "Toyota", "Volkswagen", "Volvo"
    ]
    
    var filteredCarBrands: [String] {
        if searchText.isEmpty {
            return carBrands
        } else {
            return carBrands.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        Form {
            SearchBar(text: $searchText)
            Section{
                List {
                    ForEach(filteredCarBrands, id: \.self) { brand in
                        HStack {
                            Text(brand)
                            Spacer()
                            if brand == selectedBrand {
                                Image(systemName: "checkmark")
                                    .foregroundColor(.blue)
                            }
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            selectedBrand = brand
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
        .navigationTitle("Brand")
    }
}

struct ModelPickerView: View {
    let selectedBrand: String
    @Binding var selectedModel: String
    @Environment(\.presentationMode) var presentationMode
    
    var models: [String] {
        switch selectedBrand {
        case "Toyota": return ["Camry", "Corolla", "RAV4"]
        case "Honda": return ["Civic", "Accord", "CR-V"]
        default: return ["Generic Model 1", "Generic Model 2"]
        }
    }
    
    var body: some View {
        List(models, id: \.self) { model in
            HStack {
                Text(model)
                Spacer()
                if model == selectedModel {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                selectedModel = model
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Select Model")
    }
}

struct YearPickerView: View {
    
    @State private var searchText = ""
    @Binding var selectedYear: String
    @Environment(\.presentationMode) var presentationMode
    
    let years = Array((1980...2024).map { "\($0)" }.reversed())
    
    var filteredYears: [String] {
        if searchText.isEmpty {
            return years
        } else {
            return years.filter { $0.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        List(filteredYears, id: \.self) { year in
            HStack {
                Text(year)
                Spacer()
                if year == selectedYear {
                    Image(systemName: "checkmark")
                        .foregroundColor(.blue)
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                selectedYear = year
                presentationMode.wrappedValue.dismiss()
            }
        }
        .navigationTitle("Select Year")
    }
}
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
