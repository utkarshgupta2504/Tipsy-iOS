//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Utkarsh Gupta on 24/08/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var billPerPersonLabel: UILabel!
    @IBOutlet weak var splitDescriptionLabel: UILabel!
    
    var result = "0.0"
    var split = 2
    var tip = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()

        billPerPersonLabel.text = result
        splitDescriptionLabel.text = "Split between \(split) people, with \(tip)% tip."
    }

    @IBAction func onRecalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
