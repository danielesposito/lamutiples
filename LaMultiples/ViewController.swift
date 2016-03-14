//
//  ViewController.swift
//  LaMultiples
//
//  Created by Daniel Esposito on 3/13/16.
//  Copyright © 2016 Daniel Esposito. All rights reserved.
//  App contains some logo vectors designed by Freepik. freepik.com

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var logoImage : UIImageView!
    @IBOutlet weak var letsPlayButton: UIButton!
    @IBOutlet weak var addMultipleButton: UIButton!
    @IBOutlet weak var quitButton: UIButton!
    @IBOutlet weak var multipleField: UITextField!
    @IBOutlet weak var multipleOutputLabel: UILabel!
    @IBOutlet weak var multipleOutputLabelLarge: UILabel!
    @IBOutlet weak var incorrectInputValueMessage: UILabel!
    @IBOutlet weak var multipleNumberToHighMessage: UILabel!
    

    
    
    
    //Properties
    var submittedMultipleNumber = 0
    var addedMultipleNumber = 0
    var alertString = ""


    @IBAction func restartGame(sender: UIButton) {
        
        prepareRestartGame()
        
    }
    
    @IBAction func startMultipleGame(sender: UIButton) {
        
        
        if isInputGiven() && isNumberAInt(){
            
            submittedMultipleNumber =  Int(multipleField.text!)!
            preparePlayScreen()
            
        } else {
        
            incorrectInputValueMessage.text = wrongInputValueMessage("Incorrect value given! Try again.")
        
        }
        
    }
    
    @IBAction func addMultipleNumber(sender: UIButton) {

        displayMultipleOutput()
        
            if !isNumberOver1Mill() {
        
                addMultipleCalculation()
            
        } else {
            
                multipleNumberToHighMessage.text = wrongInputValueMessage("Multiple has reach 1 Million or more!")
            }
    }
    
    func addMultipleCalculation() {

        addedMultipleNumber = addedMultipleNumber + Int(submittedMultipleNumber)
        
    }
    
    func displayMultipleOutput() {
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.DecimalStyle
        
        multipleOutputLabel.text = "\(numberFormatter.stringFromNumber(addedMultipleNumber)!) + \(numberFormatter.stringFromNumber(submittedMultipleNumber)!) ="
        multipleOutputLabelLarge.text = "\(numberFormatter.stringFromNumber(addedMultipleNumber + submittedMultipleNumber)!)"
        
    }
    
    func preparePlayScreen () {
        
        multipleOutputLabel.text = "Press Add to add!"
        multipleOutputLabelLarge.text = ""
        letsPlayButton.hidden = true
        addMultipleButton.hidden = false
        multipleField.hidden = true
        multipleOutputLabel.hidden = false
        multipleOutputLabelLarge.hidden = false
        quitButton.hidden = false
        incorrectInputValueMessage.text = ""
        
    }
    
    func prepareRestartGame() {
        
        letsPlayButton.hidden = false
        addMultipleButton.hidden = true
        multipleField.hidden = false
        multipleOutputLabel.hidden = true
        multipleOutputLabelLarge.hidden = true
        quitButton.hidden = true
        multipleOutputLabel.text = ""
        multipleOutputLabelLarge.text = ""
        multipleField.text = ""
        
        submittedMultipleNumber = 0
        addedMultipleNumber = 0
        multipleNumberToHighMessage.text = ""
        
        
    }
    
    func isInputGiven() -> Bool {
        
        if multipleField.text != nil && multipleField.text != "" {
            
            return true
            
        } else {
            
            return false
        }
        
    }
    
    func isNumberAInt() -> Bool {
        
        if Int(multipleField.text!) != nil {
            
            return true
        
        } else {
            
            return false
        }
        
    }
    
    func wrongInputValueMessage(message:String) -> String{
        
        alertString = String(message)
        return alertString
    }
    
    func isNumberOver1Mill() -> Bool {
    
            if (addedMultipleNumber + submittedMultipleNumber) >= 1000000 {
                
                return true

            } else {
                
                return false

        }
  
    }
}

