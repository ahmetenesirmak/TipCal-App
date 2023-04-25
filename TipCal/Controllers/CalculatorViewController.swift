//
//  ViewController.swift
//  TipCal
//
//  Created by Ahmet Enes Irmak on 25.04.2023.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: - Variables
    var tipPercentage = 0.10
    var totalBillAmount: Double!
    var numberOfPeople: String!
    var billPerPerson: Double!
    
    //MARK: - IBOutlets
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    //MARK: - Functions

    @IBAction func tipChanged(_ sender: UIButton) {
        //Hide keyboard when clicked tipChanged button.
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Double(buttonTitleMinusPercentSign)!
        tipPercentage = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = String(format: "%.0f", sender.value)
        splitNumberLabel.text = numberOfPeople
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.totalBillAmount = Double(billTextField.text!)
        
        //Add tip to total bill amount
        totalBillAmount += totalBillAmount * tipPercentage
        
        //Bill per person
        billPerPerson = totalBillAmount / Double(numberOfPeople)!
        print(String(format: "%.2f", billPerPerson))
        
        //Segue
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.ResultPerPerson = String(format: "%.2f", billPerPerson)
            destinationVC.percentageOfTip = Int(tipPercentage * 100)
            destinationVC.numberOfSplittedCustomer = numberOfPeople
        }
    }
    
    
}

