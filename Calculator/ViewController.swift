//
//  ViewController.swift
//  Calculator
//
//  Created by Bekarys Magauiya on 28.12.2021.
//

import UIKit

class ViewController: UIViewController {

    
//    @IBOutlet weak var myDiplay: UILabel!
////    var typing: Bool = false
//    @IBAction func Button1(_ sender: UIButton) {
////        let current_digit = sender.currentTitle!
////        if typing{
////        let current_display = myDiplay.text!
////        print("ddsd")
////        myDiplay.text = current_display + current_digit
////        }
////        else{
////            myDiplay.text = current_digit
////            typing = true
////        }
////    }
//        let current_digit = sender.currentTitle!
//        let current_display = myDiplay.text!
//        myDiplay.text = current_display + current_digit
//
//    }
    @IBOutlet weak var MyDisplay: UILabel!
    var typing: Bool = false
    @IBAction func Button_p(_ sender: UIButton) {
        let current_digit = sender.titleLabel?.text
        if typing{
        let current_display = MyDisplay.text!
        MyDisplay.text = current_display + current_digit!
        }
        else{
            MyDisplay.text = current_digit
        typing = true
        }
    }
    var displayValue: Double{
        get{
            return Double(MyDisplay.text!)!
        }
        set{
            MyDisplay.text = String(newValue)
        }
    }
    private var calculatorModel = CalcuModel()
    @IBAction func operationpressed(_ sender: UIButton) {
        calculatorModel.setOperand(displayValue)
        calculatorModel.performOperation((sender.titleLabel?.text)!)
        displayValue = calculatorModel.getResult()!
        typing = false
    }
    
    @IBAction func Removebu() {
        MyDisplay.text?.removeAll()
    }
    
}

