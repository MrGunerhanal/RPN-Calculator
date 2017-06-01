//
//  ViewController.swift
//  Coursework1
//
//  Created by Burak Gunerhanal on 07/02/2017.
//  Copyright © 2017 Burak Gunerhanal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var calcEngine : CalculatorEngine!
    var userHasStartedTyping = false

    @IBOutlet weak var labelDisplay: UILabel!
    @IBOutlet weak var displayEntry: UILabel!
    
    @IBOutlet weak var dec: UIButton!
    @IBOutlet weak var secondBtn: UIButton!
    @IBOutlet weak var sin: UIButton!
    @IBOutlet weak var cos: UIButton!
    @IBOutlet weak var tan: UIButton!
    
    var selectedBtn: String?
    var valueOfLabel: String = ""
    var calcTape = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedBtn = "deg"
        if self.calcEngine == nil
        {
            self.calcEngine = CalculatorEngine()
        } 
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        let digit = sender.currentTitle!
        print("digit pressed = \(digit)")
        if userHasStartedTyping
        {
            labelDisplay.text = labelDisplay.text! + "\(digit)"
        }
        else
        {
            labelDisplay.text = digit
            userHasStartedTyping = true
        }
    }
    
    var displayValue : Double {
        get {
            return(NumberFormatter().number(from: labelDisplay.text!)?.doubleValue)!
        }
        set (newValue)
        {
            labelDisplay.text = "\(newValue)"
        }
    }
    
    @IBAction func enter() {
        userHasStartedTyping = false
        self.calcEngine!.operandStack.append(displayValue)
        dec.isEnabled = true
        displayEntry.text! += "\(displayValue)⏎"
        valueOfLabel = valueOfLabel + "\(displayValue)"
        
        print("Operand Stack on engine = \(self.calcEngine!.operandStack)")
    }
    
    @IBAction func operation(_ sender: UIButton) {
        let operation = sender.currentTitle!
        if userHasStartedTyping
        {
            enter()
        }
        
        if (labelDisplay.text == "0" || labelDisplay.text == "0.0" && operation == "⅟x"){
            labelDisplay.text = "error"
        }
        else{
            self.displayValue = (self.calcEngine?.operate(operation: operation, buttonname: selectedBtn!))!
            valueOfLabel += "\(operation)"
            displayEntry.text! += "\(operation)"
            enter()
            calcTape.append(valueOfLabel)
            valueOfLabel = ""
        }

    }
    
    @IBAction func decimal(_ sender: UIButton) {
        let decimalValue = sender.currentTitle!
        if userHasStartedTyping{
            labelDisplay.text = labelDisplay.text! + "\(decimalValue)"
            dec.isEnabled = false;
        }
        else{
            labelDisplay.text=("0")
            userHasStartedTyping = true
            dec.isEnabled = true;
        }
    }
    
    @IBAction func degreeRadius(_ sender: UIButton) {
        
        if(sender.titleLabel!.text == "deg")
        {
            sender.setTitle("rad", for: UIControlState.normal)
            selectedBtn = "rad"
        }
        else
        {
            sender.setTitle("deg", for: UIControlState.normal)
            selectedBtn = "deg"
        }
    }
    
    @IBAction func secondBtn(_ sender: UIButton) {
        
        if(sin.titleLabel!.text == "sin")
        {
            sin.setTitle("sin-¹", for: UIControlState.normal)
        }
        else
        {
            sin.setTitle("sin", for: UIControlState.normal)
        }
        
        if(cos.titleLabel!.text == "cos")
        {
            cos.setTitle("cos-¹", for: UIControlState.normal)
        }
        else
        {
            cos.setTitle("cos", for: UIControlState.normal)
        }
        
        if(tan.titleLabel!.text == "tan")
        {
            tan.setTitle("tan-¹", for: UIControlState.normal)
        }
        else
        {
            tan.setTitle("tan", for: UIControlState.normal)
        }
        
        if(secondBtn.titleLabel!.text == "2nd")
        {
            secondBtn.setTitle("1st", for: UIControlState.normal)
        }
        else
        {
            secondBtn.setTitle("2nd", for: UIControlState.normal)
        }
    }

    @IBAction func clear(_ sender: UIButton) {
        labelDisplay.text = "\(0)"
        self.calcEngine.operandStack.removeLast()
        userHasStartedTyping = false
    }
    
    @IBAction func clearAll(_ sender: UIButton) {
        labelDisplay.text = "\(0)"
        //displayEntry.text = "\(0)"
        self.calcEngine.operandStack.removeAll()
        userHasStartedTyping = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let calcVC: TapeViewController = segue.destination as! TapeViewController
        calcVC.receivedTape = calcTape
        print(calcTape)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

