//
//  CalculatorEngine.swift
//  Coursework1
//
//  Created by Burak Gunerhanal on 09/02/2017.
//  Copyright © 2017 Burak Gunerhanal. All rights reserved.
//

import Foundation
import UIKit
import Darwin

class CalculatorEngine : NSObject
{
    var operandStack = Array<Double>()
    func updateStackWithValue(value: Double)
    {
        self.operandStack.append(value)
    }
    
    func sinInDegrees(degreeValue: Double)->Double
    {
        return sin(degreeValue * M_PI / 180.0)
    }
    func cosInDegrees(degreeValue: Double)->Double
    {
        return cos(degreeValue * M_PI / 180.0)
    }
    func tanInDegrees(degreeValue: Double)->Double
    {
        return tan(degreeValue * M_PI / 180.0)
    }
    func asinInRadian(minusSin: Double)->Double
    {
        return asin(minusSin) * (180.0 / M_PI)
    }
    func acosInRadian(minusCos: Double)->Double
    {
        return acos(minusCos) * (180.0 / M_PI)
    }
    func atanInRadian(minusTan: Double)->Double
    {
        return atan(minusTan) * (180.0 / M_PI)
    }
    
    func operate(operation: String, buttonname: String) ->Double
    {
        switch operation
        {
            //basic operations
        case "✘":
            if operandStack.count >= 2
            {
                return self.operandStack.removeLast() * self.operandStack.removeFirst()
            }
        case "÷":
            if operandStack.count >= 2
            {
                return self.operandStack.removeFirst() / self.operandStack.removeLast()
            }
        case "✚":
            if operandStack.count >= 2
            {
                return self.operandStack.removeLast() + self.operandStack.removeFirst()
            }
        case "−":
            if operandStack.count >= 2
            {
                return self.operandStack.removeFirst() - self.operandStack.removeLast()
            }
            //basic operations
            
            //advanced operations
        case "π":
            let ans = self.operandStack.removeLast() * M_PI
            return round(ans * 10000000) / 10000000
        case "±":
            return self.operandStack.removeLast()*(-1)
        case "√":
            return sqrt(self.operandStack.removeLast())
        case "x²":
            let number = self.operandStack.removeLast()
            return number * number
        case "Log¹⁰":
            return log10(self.operandStack.removeLast())
        case "logᵉ":
            return log(self.operandStack.removeLast())
        case "⅟x":
            return 1 / self.operandStack.removeLast()
            //advanced operations
            
            //2nd functionality
            case "sin":
            if(buttonname == "rad"){
                return sin(self.operandStack.removeLast())
            }
            else{
                return sinInDegrees(degreeValue: self.operandStack.removeLast())
            }
            
        case "cos":
            if(buttonname == "rad"){
                return cos(self.operandStack.removeLast())
            }
            else{
                return cosInDegrees(degreeValue: self.operandStack.removeLast())
            }
            
        case "tan":
            if(buttonname == "rad"){
                return tan(self.operandStack.removeLast())
            }
            else{
                return tanInDegrees(degreeValue: self.operandStack.removeLast())
            }
            
        case "sin-¹":
            if(buttonname == "rad"){
                return asin(self.operandStack.removeLast())
            }
            else{
                return asinInRadian(minusSin: self.operandStack.removeLast())
            }
            
        case "cos-¹":
            if(buttonname == "rad"){
                return acos(self.operandStack.removeLast())
            }
            else{
                return acosInRadian(minusCos: self.operandStack.removeLast())
            }
            
        case "tan-¹":
            if(buttonname == "rad"){
                return atan(self.operandStack.removeLast())
            }
            else{
                return atanInRadian(minusTan: self.operandStack.removeLast())
            }
            //2nd functionality
        default:break
        }
        return 0.0
    }
}
