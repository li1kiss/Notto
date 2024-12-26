//
//  SwiftUITest.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 20/12/2024.
//


import SwiftUI

struct SwiftUITest: View {
    
    @State var showPopover: Bool = false
    
    var body: some View {
        HStack {
            Spacer()
            Button("Show Popover") {
                showPopover.toggle()
            }
            .iOSPopover(isPresented: $showPopover, arrowDirection: .down) {
//                test()
            }
            .offset(x: -20)
        }
    }
}



#Preview {
    SwiftUITest()
}

extension View {
    @ViewBuilder
    func iOSPopover<Content: View>(
        isPresented: Binding<Bool>,
        arrowDirection: UIPopoverArrowDirection,
        @ViewBuilder content: @escaping () -> Content
    ) -> some View {
        self
            .background {
                PopOverController(
                    isPresented: isPresented,
                    arrowDirection: arrowDirection,
                    content: content()
                )
            }
    }
}

struct PopOverController<Content: View>: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    var arrowDirection: UIPopoverArrowDirection
    var content: Content

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .clear
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if isPresented {
            // Створюємо кастомний Popover
            let controller = CustomHostingView(rootView: content)
            controller.view.backgroundColor = .popoverBackgroung
            controller.modalPresentationStyle = .popover
            controller.popoverPresentationController?.permittedArrowDirections = arrowDirection

            controller.presentationController?.delegate = context.coordinator
            controller.popoverPresentationController?.sourceView = uiViewController.view
          
                
                // Зміщення стрілки
                controller.popoverPresentationController?.sourceRect = CGRect(
                    x: uiViewController.view.bounds.width * 0.7, // 80% від ширини (зміщення вправо)
                    y: uiViewController.view.bounds.height * 0.1 - 7, // 10% від висоти (зміщення вгору)
                    width: 1, height: 1 // Маленький прямокутник
                )
            
            uiViewController.present(controller, animated: true)
        }
    }

     
    class Coordinator: NSObject, UIPopoverPresentationControllerDelegate {
        var parent: PopOverController
        
        init(parent: PopOverController) {
            self.parent = parent
        }
        
        /// Налаштування стилю презентації
        func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
            return .none // Забороняє автоматичне перетворення на full-screen на iPhone
        }
        
        /// Спостереження за статусом Popover
        /// Коли Popover закривається, оновлюємо стан `isPresented`
        func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
            parent.isPresented = false
        }
    }
}

class CustomHostingView<Content: View>: UIHostingController<Content> {
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = view.intrinsicContentSize
    }
}
