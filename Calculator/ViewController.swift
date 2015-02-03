//
//  ViewController.swift
//  Calculator
//
//  Created by Jacob Persing on 2/2/15.
//  Copyright (c) 2015 Jacob Persing. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
  
  @IBOutlet var calcButtons: [UIButton]!
  @IBOutlet weak var resultView: UILabel!
  var userIsTyping = false
  var inputStack = [String]()
  
  
   override func viewDidLoad(){
    
    resultView.layer.cornerRadius = 5.0
    resultView.layer.borderWidth = 2
    resultView.layer.borderColor = UIColor.grayColor().CGColor
    resultView.layer.sublayerTransform = CATransform3DMakeTranslation(-50, 0, 0);
    for item in calcButtons {
      println(item)
      item.layer.cornerRadius = 10.0
      item.layer.borderColor = UIColor.grayColor().CGColor
      item.layer.borderWidth = 5
    }
  }
  

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

