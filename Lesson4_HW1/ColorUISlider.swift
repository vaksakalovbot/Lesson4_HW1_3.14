//
//  ColorUISlider.swift
//  Lesson4_HW1
//
//  Created by Vladimir on 02.08.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import SwiftUI

struct ColorUISlider: UIViewRepresentable {
    @Binding var value: Double
    @Binding var alphaValue: Float
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.thumbTintColor = UIColor(red: 0, green: 0, blue: 1, alpha: CGFloat(alphaValue))
        slider.tintColor = UIColor(red: 0, green: 0, blue: 1, alpha: CGFloat(alphaValue))
        slider.value = Float(value)
        
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueChanged),
                         for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        
        // Здесь похулигальничал чуток - уж очень хочется всегда 100 баллов получать :)
        if alphaValue == 1.0 {
            uiView.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: CGFloat(alphaValue))
        } else {
            uiView.thumbTintColor = UIColor(red: 0, green: 0, blue: 1, alpha: CGFloat(alphaValue))
            uiView.tintColor = UIColor(red: 0, green: 0, blue: 1, alpha: CGFloat(alphaValue))
        }
        
    }
    
    func makeCoordinator() -> ColorUISlider.Coordinator {
        Coordinator(value: $value, alphaValue: $alphaValue)
    }
    
}

extension ColorUISlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        @Binding var alphaValue: Float
        
        init(value: Binding<Double>, alphaValue: Binding<Float>) {
            self._value = value
            self._alphaValue = alphaValue
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct ColorUISlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorUISlider(value: .constant(50), alphaValue: .constant(0.5))
    }
}
