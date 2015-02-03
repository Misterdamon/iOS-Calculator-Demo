//
//  ViewController.swift
//  Calculator
//
//  Created by Jacob Persing on 2/2/15.
//  Copyright (c) 2015 Jacob Persing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var resultView: UILabel!
  var userIsTyping = false
  var inputStack = [String]()
  

  @IBAction func clearInput(sender: UIButton) {
    inputStack = [String]()
    resultView.text = "0"
    userIsTyping = false
  }
  
  @IBAction func enterDigit(sender: UIButton) {
    let buttonDigit = sender.currentTitle!
    
    if userIsTyping {
      resultView.text = resultView.text! + buttonDigit
    } else {
      resultView.text = buttonDigit
      userIsTyping = true
    }
  }
  
  
  @IBAction func addOperator(sender: UIButton) {
    
    inputStack.append(resultView.text!)
    inputStack.append(sender.currentTitle!)
    resultView.text = sender.currentTitle!
    userIsTyping = false
    println(inputStack)
  }
  
  
  @IBAction func performOperation(){
    inputStack.append(resultView.text!)
    
//    if inputStack.count > 0 {
      let op1 = (inputStack.removeAtIndex(0) as NSString).doubleValue
      let operation = inputStack.removeAtIndex(0)
      let op2 = (inputStack.removeAtIndex(0) as NSString).doubleValue
//    }
    
      switch operation {
      case "×":  resultView.text = "\(op1 * op2)";
      case "÷":  resultView.text =  "\(op1 / op2)";
      case "+":  resultView.text = "\(op1 + op2)";
      case "-": resultView.text = "\(op1 - op2)";
      case "√": resultView.text = "\(sqrt(op1))"
      default: break;
      
    }
  }
  
}

