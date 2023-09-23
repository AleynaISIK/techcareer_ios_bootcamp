//
//  ViewController.swift
//  Homework5
//
//  Created by Aleyna IŞIK on 23.09.2023.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var resultLabel: UILabel!
  
  @IBOutlet weak var historyLabel: UILabel!
  
  var currentInput = ""
  var firstNumber = 0.0
  var operation = ""
  var history = ""
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    resultLabel.text = "0"

  }
  
  @IBAction func numberButton(_ sender: UIButton) {
    guard let number = sender.titleLabel?.text else { return }
    currentInput += number
    resultLabel.text = currentInput
    history += number
    historyLabel.text = history
    
  }
  
  @IBAction func decimalButton(_ sender: UIButton) {
    if !currentInput.contains(".") {
      currentInput += "."
      resultLabel.text = currentInput
      history += "."
      historyLabel.text = history

      
    }
  }
  
  @IBAction func clearButton(_ sender: UIButton) {
    currentInput = ""
    firstNumber = 0.0
    operation = ""
    resultLabel.text = "0"
    history = ""
    historyLabel.text = history

    
  }
  
  @IBAction func operationButton(_ sender: UIButton) {
    if let currentNumber = Double(currentInput) {
      if operation.isEmpty {
        firstNumber = currentNumber
      } else {
        switch operation {
        case "+":
          firstNumber += currentNumber
        case "-":
          firstNumber -= currentNumber
        case "X":
          firstNumber *= currentNumber
        case "/":
          if currentNumber != 0 {
            firstNumber /= currentNumber
          } else {
            resultLabel.text = "!! Error !!"
            return
          }
        default:
          break
        }
      }
    }
    
    operation = sender.titleLabel?.text ?? ""
    currentInput = ""
    
    if !history.isEmpty {
      history += " \(currentInput)"
    } else {
      history += "\(firstNumber)"
    }
    
    history += " \(operation) "
    
    resultLabel.text = String(firstNumber)
    historyLabel.text = history

  }
  @IBAction func equalsButton(_ sender: UIButton) {
    operationButton(sender)
    operation = ""
    print(history)
    
  }
  
  @IBAction func deleteButton(_ sender: UIButton) {
    if !currentInput.isEmpty {
      currentInput.removeLast()
      history.removeLast()
      resultLabel.text = currentInput
      historyLabel.text = history

    }
  }
  
}
