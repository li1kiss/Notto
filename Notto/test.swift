import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            Image("Vector")
                .foregroundStyle(Color("vectorImageColor"))
            Spacer()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

