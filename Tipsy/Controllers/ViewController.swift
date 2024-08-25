//
//  ViewController.swift
//  Tipsy
//
//  Created by Utkarsh Gupta on 24/08/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitValue: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    
    var tip = 0.1
    var numberOfPeople = 2
    var finalResult = "0.0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onTipAmountSelected(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.2) {
            self.zeroPctButton.isSelected = false
            self.tenPctButton.isSelected = false
            self.twentyPctButton.isSelected = false
            
            sender.isSelected = true
        }
        
        tip = Double(String(sender.titleLabel!.text!.dropLast()))! / 100
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.result = finalResult
            destinationVC.split = numberOfPeople
            destinationVC.tip = Int(tip * 100)
        }
    }
    
    @IBAction func onStepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = Int(sender.value)
        splitValue.text = String(numberOfPeople)
    }
    
    @IBAction func onCalculatePressed(_ sender: UIButton) {
        let amount = Double(billTextField.text ?? "0.0")!
        let amountAfterTip = amount * (1 + tip)
        finalResult = String(format: "%.2f", amountAfterTip / Double(numberOfPeople))
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
}
