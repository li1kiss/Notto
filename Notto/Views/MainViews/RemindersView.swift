//
//  RemindersView.swift
//  Notto
//
//  Created by Mykhailo Kravchuk on 04/11/2024.
//

import SwiftUI

struct RemindersView: View {
    var body: some View {
        
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Майбутні нагадування")
                        .font(.headline)
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Сервіс • 20 Жовт 2024")
                                .font(.subheadline)
                            Text("Lorem ipsum dolor sit amet consectetur.")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                Spacer()
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)

            Divider()
            HStack{
                Spacer()
                VStack {
                    Spacer()
                    Button("Перенести") {
                        // Дія для перенесення
                    }
                    .font(.footnote)
//                    Spacer()
                }
                Spacer()
                Divider()
                Spacer()
                VStack {
                    Spacer()
                    Button("Готово") {
                        // Дія для завершення
                    }

                    .font(.footnote)
//                    Spacer()
                }
                Spacer()
            }
        }
        
        .cornerRadius(8)
    }
}
#Preview {
    Spacer()
    ReminderView()
        .padding(16)
    Spacer()
}


import SwiftUI

struct ReminderView: View {
    var body: some View {
        VStack(spacing: 0) {
            // Заголовок і вміст
            HStack{
                VStack(alignment: .leading, spacing: 10) {
                    // Заголовок
                    Text("Upcoming reminders")
                        .font(.headline)
                        .foregroundColor(.black)
                    
                    // Інформація про нагадування
                    HStack {
                        Label("Service", systemImage: "alarm")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                        Text("20 Oct 2024")
                            .foregroundColor(.blue)
                            .font(.subheadline)
                        Spacer()
                    }
                    
                    // Опис
                    Text("Lorem ipsum dolor sit amet consectetur. Hac nisl nec elementum habitant volutpat. Cum turpis vivamus...")
                        .font(.footnote)
                        .foregroundColor(.gray)
                        .lineLimit(2)
                }
                .padding(.horizontal)
                .padding(.vertical, 15)
            }
            
            Divider() // Лінія між текстом і кнопками
            
            // Кнопки
            HStack(spacing: 0) {
                // Перша кнопка
                Button(action: {
                    // Дія для Reschedule
                    print("Done Reschedule")
                }) {
                    Text("Reschedule")
                        .font(.callout)
                        .frame(maxWidth: .infinity, maxHeight: .infinity) // Кнопка займає весь доступний простір
                        .padding(.vertical,12)

                }
                .buttonStyle(CustomButtonStyle(normalColorBackground: .white, pressedColorBackground: .buttonPressedReminder, normalColorForeground: .unpressedColorButton, pressedColorForeground: .buttonPressed))
                
                Divider() // Вертикальний роздільник між кнопками
                
                // Друга кнопка
                Button(action: {
                   print("Done")
                }) {
                    Text("Done")
                        .font(.callout)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .padding(.vertical,12) // Кнопка займає весь доступний простір
                }
                .buttonStyle(CustomButtonStyle(normalColorBackground: .white, pressedColorBackground: .buttonPressedReminder, normalColorForeground: .unpressedColorButton, pressedColorForeground: .buttonPressed))
            }

        }
        .background(Color.white) // Білий фон
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}


