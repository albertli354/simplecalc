//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let equationOperator: String
        if args.count == 3 {
            equationOperator = args[1]
        } else {
            equationOperator = args[args.count - 1]
        }
        
        if args.count == 3 { // basic operation
            let firstNum: Int! = Int(args[0])
            let secondNum: Int! = Int(args[2])
            switch equationOperator {
            case "+":
                return firstNum + secondNum
                
            case "-":
                return firstNum - secondNum
                
            case "/":
                return firstNum / secondNum
                
            case "%":
                return firstNum % secondNum
                
            case "*":
                return firstNum * secondNum
                
            default:
                print("Error, I do not understand your operator.")
            }
        } else { // less-traditional expressions
            switch equationOperator {
            case "count":
                return args.count - 1
                
            case "avg":
                if args.count == 1 {
                    return 0
                } else {
                    var sum: Int = 0
                    for num in args[0..<args.count-1] {
                        sum += Int(num)!
                    }
                    return sum / (args.count - 1)
                }

                
            case "fact":
                if args.count == 1{
                    return 0
                } else if args.count == 2 && Int(args[0])! == 0 {
                    return 1
                } else {
                    var result = 1
                    for num in 1...Int(args[0])! {
                        result = result * num
                    }
                    return result
                }
            default:
                print("The operation is too complicated for me")
            }
        }
        
        return 0
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let first = readLine()!
let operation = readLine()!
let second = readLine()!
print(Calculator().calculate([first, operation, second]))

