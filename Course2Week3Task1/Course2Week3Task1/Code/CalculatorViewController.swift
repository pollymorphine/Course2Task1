//
//  CalculatorViewController.swift
//  Course2Week3Task1
//
//  Copyright © 2018 e-Legion. All rights reserved.
//

import Foundation
import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var firstOperandLable: UILabel!
    @IBOutlet weak var secondOperandLabel: UILabel!
    @IBOutlet weak var firstMultipilerLabel: UILabel!
    @IBOutlet weak var secondMultipilerLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    
    // MARK: Slider
    
    @IBOutlet weak var slider: UISlider! {
        didSet {
            slider.maximumValue = 100
            slider.minimumValue = 1
            slider.value = 0
        }
    }
    
    // MARK: Stepper
    
    @IBOutlet weak var stepper: UIStepper! {
        didSet {
            stepper.maximumValue = 10.0
            stepper.minimumValue = 1.0
            stepper.stepValue = 0.5
            stepper.setDecrementImage(stepper.decrementImage(for: .normal), for: .normal)
            stepper.setIncrementImage(stepper.incrementImage(for: .normal), for: .normal)
            stepper.layer.cornerRadius = 4
            stepper.layer.borderWidth = 1
            stepper.layer.borderColor = UIColor(red: 0.925,
                                                green: 0.443,
                                                blue: 0.286,
                                                alpha: 1)
                                                .cgColor
        }
    }
    
    // MARK: Slider function
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        let secondOperand = Double(String(format: "%.4f", sender.value))
        secondMultipilerLabel.text = "\(secondOperand!)"
    }
    
    
   // MARK: Stepper function
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let firstOperand = sender.value
        firstMultipilerLabel.text = "\(firstOperand)"
    }
    
    
    // MARK: Calculate action
    
    func calculate() {
        let intermediateResult = stepper.value * Double(slider.value)
        let result =  Double(String(format: "%.4f", intermediateResult))
        resultLabel.text = "\(result!)"
    }
    
    @IBAction func calculateButtonPress(_ sender: UIButton) {
        calculate()
    }
}
