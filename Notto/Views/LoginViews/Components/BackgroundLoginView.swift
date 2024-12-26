//
//  BackgroundLoginView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 12/12/2024.
//


import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Color("backgroundLoginColor")
            .edgesIgnoringSafeArea(.top) // Можна змінити на .all, якщо потрібно
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
