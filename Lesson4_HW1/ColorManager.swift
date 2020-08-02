//
//  ColorManager.swift
//  Lesson4_HW1
//
//  Created by Vladimir on 02.08.2020.
//  Copyright © 2020 Vladimir. All rights reserved.
//

import Foundation
import Combine

final class ColorManager: ObservableObject {
    @Published var alphaSliderValue: Float 
    
    @Published var targetValue: Int {
        didSet {
            setAlphaSliderValue()
        }
    }
    
    @Published var currentSliderValue: Double {
        didSet {
            setAlphaSliderValue()
        }
    }
    
    init(){
        alphaSliderValue = 0
        targetValue = Int.random(in: 0...100)
        currentSliderValue = Double(Int.random(in: 0...100))
        setAlphaSliderValue()
    }
    
    func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentSliderValue))
        return (100 - difference)
    }
    
    private func setAlphaSliderValue() {
        alphaSliderValue = Float(computeScore())/100.0
//        print(alphaSliderValue)
    }

}
