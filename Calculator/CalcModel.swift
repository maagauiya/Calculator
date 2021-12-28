//
//  CalcModel.swift
//  Calculator
//
//  Created by Bekarys Magauiya on 29.12.2021.
//

import Foundation
import UIKit
enum Operation{
    case constant(Double)
    case unaryOperation((Double)->Double)
    case binaryOperation((Double,Double)->Double)
    case equals
}
//func addi(op1:Double,op2:Double)->Double{
//    return op1+op2
//}
struct CalcuModel{
    var my_operation: Dictionary<String,Operation> =
    [
        "√": Operation.unaryOperation(sqrt),
        "+": Operation.binaryOperation({$0+$1}),
        "-": Operation.binaryOperation({$0-$1}),
        "*": Operation.binaryOperation({$0*$1}),
        "/": Operation.binaryOperation({$0/$1}),
        "^": Operation.binaryOperation({pow($0,$1)}),
        
        "=": Operation.equals
    ]
    private var global_value: Double?
    
    mutating func setOperand(_ operand: Double){
        global_value = operand
    }
    mutating func performOperation(_ operation:String){
        let symbol = my_operation[operation]!
        switch symbol {
        case .unaryOperation(let function):
            global_value=function(global_value!)
        case .binaryOperation(let function):
            saving=saveFirstopandoper(firstOp: global_value!, operation: function)
        case .equals:
            global_value=saving?.performOperationwith(secondOperand: global_value!)
        default:
            break
        }
        
        
    }
    func getResult()->Double?{
        return global_value!
    }
    private var saving: saveFirstopandoper?
    struct saveFirstopandoper{
        var firstOp:Double
        var operation:(Double,Double)->Double
        
        func performOperationwith(secondOperand op2:Double)->Double{
            return operation(firstOp,op2)
        }
    }
}
