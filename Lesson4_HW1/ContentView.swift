//
//  ContentView.swift
//  Lesson4_HW1
//
//  Created by Vladimir on 02.08.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var colorManager: ColorManager
    @State private var showAlert = false

    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к:")
            Text("\(colorManager.targetValue)")
                .font(.largeTitle)
            
            HStack {
                Text("0")
                ColorUISlider(value: $colorManager.currentSliderValue,
                              alphaValue: $colorManager.alphaSliderValue)
                Text("100")
            }.padding()
            
            Button(action: {
                self.showAlert = true
            }) {
                Text("Проверь меня!")
            }
            .padding()
            .alert(isPresented: .constant(showAlert)) {
                Alert(
                    title: Text("Your Score"),
                    message: Text("\(colorManager.computeScore())"),
                    dismissButton: .default(Text("OK"), action: {
                        self.showAlert = false
                    })
                )
            }

            Button(action: {
                self.colorManager.targetValue = Int.random(in: 0...100)
            }) {
                Text("Начать заново!")
            }
            .padding()
            
        }.padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
