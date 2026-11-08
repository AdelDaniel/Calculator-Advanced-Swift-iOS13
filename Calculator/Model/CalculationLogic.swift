//
//  CalculationLogic.swift
//  Calculator
//
//  Created by BSOE- Adel Nabil Bible Booster on 27/09/2026.
//  Copyright © 2026 London App Brewery. All rights reserved.
//

import Foundation

struct CalculationLogic{
    
    private var number : Double?
    private var intermediateCalculation: (n1: Double, operation: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculationFor(_ label: String) -> Double? {
        if let num = number {
            if label == "AC" {
                return 0
            }else if label == "%" {
                return num / 100.0
            }else if label == "+/-" {
                return num * -1
            }else if label == "+" {
                intermediateCalculation = (num, "+")
            }else if label == "-" {
                intermediateCalculation = (num, "-")
            }else if label == "x" {
                intermediateCalculation = (num, "x")
            }else if label == "÷" {
                intermediateCalculation = (num, "÷")
            }else if label == "=" {
                return performTwoNumbersCalculation(n2: num)
            }
        }
        return 0;
    }
        
    private func performTwoNumbersCalculation(n2: Double) -> Double? {
        if let symbol = intermediateCalculation?.operation {
            if let n1 = intermediateCalculation?.n1 {
                switch symbol {
                    case "+":
                        return n1 + n2
                    case "÷":
                        return n1 / n2
                    case "x":
                        return n1 * n2
                    case "-":
                        return n1 - n2
                    default:
                        return nil
                }
            }
        }
        return nil
    }
    
}
