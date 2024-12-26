//
//  PasswordFieldView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 03/12/2024.
//


import SwiftUI

struct PasswordFieldView: View {
      @State private var showPopover = false

      var body: some View {
        Button("Show Popover") {
          showPopover.toggle()
        }
        .buttonStyle(.borderedProminent)
        .popover(isPresented: $showPopover,
                 attachmentAnchor: .point(.topLeading),
                 content: {
          Text("This is a Popover")
            .padding()
            .frame(minWidth: 300, maxHeight: 400)
            .background(.red)
            .presentationCompactAdaptation(.popover)
        })
      }
    }


struct PasswordFieldView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordFieldView()
    }
}
