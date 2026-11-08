//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    private var calculationLogic : CalculationLogic = CalculationLogic()
    @IBOutlet weak var displayLabel: UILabel!
    var isFinishTypingNumber : Bool = true
    var firstNumber : Float?
    var secondNumber : Float?
    
    /// Getter
    
    private var currentDispalyValue : Double {
        get{
            
            if let value = displayLabel.text{
                return Double(value) ?? 0.0
            }
            return 0.0
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        if let currentButtonLabel = sender.currentTitle {
            calculationLogic.setNumber(currentDispalyValue)
            let result = calculationLogic.calculationFor(currentButtonLabel)
            if let result = result {
                currentDispalyValue = result
                // What should happen when a non-number button is pressed
                isFinishTypingNumber = true
            }
        }
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if isFinishTypingNumber {
            displayLabel.text = sender.currentTitle ?? ""
            isFinishTypingNumber = false
        } else {
            let currentNumber : String = displayLabel.text ?? ""
            let newNumber : String = sender.currentTitle ?? ""
            
            if(newNumber == "." && currentNumber.contains(".")) {
                return
            }
            var updatedNumbere : String = currentNumber + newNumber
            if(updatedNumbere.first == "0"){
                updatedNumbere.removeFirst()
            }
            displayLabel.text = updatedNumbere
        }
        print(sender.currentTitle ?? ":")
    }
    
}

